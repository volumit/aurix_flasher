/*****************************************************************************
 *
 * Copyright (C) 2007-2012 Infineon Technologies AG. All rights reserved.
 *
 * Infineon Technologies AG (Infineon) is supplying this software for use with
 * Infineon's microcontrollers.  This file can be freely used for creating
 * development tools that are supporting such microcontrollers.
 *
 * THIS SOFTWARE IS PROVIDED "AS IS".  NO WARRANTIES, WHETHER EXPRESS, IMPLIED
 * OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE APPLY TO THIS SOFTWARE.
 * INFINEON SHALL NOT, IN ANY CIRCUMSTANCES, BE LIABLE FOR DIRECT, INDIRECT, 
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES, FOR ANY REASON 
 * WHATSOEVER.
 *
 ******************************************************************************
 * MODULE:  mcd_demo_main.cpp
 * VERSION: $Revision: 1.14 $ $Date: 2012/04/12 14:24:11 $
 ******************************************************************************
 * DESCRIPTION: 
 * Simple example for the usage of the MCD API
 * Tested with TriCore and XMC4000 evaluation boards using DAS release V4.0.5.
 * DAS Installer (includes mcdxdas.dll) is available at www.infineon.com/DAS             
 ******************************************************************************/

#include <stdio.h>
#include <string.h>
#include <assert.h>

#include "mcd_api.h"
#include "mcd_tools.h"
#include "mcd_loader_class.h"


/* this loads an intel hex file into the memory[] array */
void load_file(char *filename);

/* this writes a part of memory[] to an intel hex file */
void save_file(char *command);

/* this is used by load_file to get each line of intex hex */
int parse_hex_line(char *theline, int bytes[], unsigned int *addr, int *num, int *code);
int parse_hex_line_addr(char *theline, int bytes[], unsigned int *addr, int *num, int *code);

/* this does the dirty work of writing an intel hex file */
/* caution, static buffering is used, so it is necessary */
/* to call it with end=1 when finsihed to flush the buffer */
/* and close the file */
void hexout(FILE *fhex, int byte, int memory_location, int end);

int insert_memory_buffer(int i, unsigned int addr, unsigned int addr_mirror, unsigned int length, unsigned int page_size);
int init_memory_buffers(void);
int set_memory_value(unsigned int addr, unsigned char value);
unsigned char* get_memory_buffer(unsigned int dst, unsigned int *paddr, unsigned int *plength);
int analyze_memory_buffer(void);


extern int do_tests(mcd_server_st *server, mcd_core_st *core, mcd_core_con_info_st *core_con_info_core, mcd_register_info_st *core_ip_reg);
extern int do_rsthlt(mcd_server_st *server, mcd_core_st *core, mcd_core_con_info_st *core_con_info_core, mcd_register_info_st *core_ip_reg);
extern int do_frequency(mcd_server_st *server, mcd_core_st *core, mcd_core_con_info_st *core_con_info_core, mcd_register_info_st *core_ip_reg);
extern int do_status(mcd_server_st *server, mcd_core_st *core, mcd_core_con_info_st *core_con_info_core, mcd_register_info_st *core_ip_reg, int *status);
extern int do_write_mem(mcd_server_st *server, mcd_core_st *core, mcd_core_con_info_st *core_con_info_core, mcd_register_info_st *core_ip_reg, unsigned int addr, unsigned int data);
extern int do_read_mem(mcd_server_st *server, mcd_core_st *core, mcd_core_con_info_st *core_con_info_core, mcd_register_info_st *core_ip_reg, unsigned int addr, unsigned int *data);
extern int do_run(mcd_server_st *server, mcd_core_st *core, mcd_core_con_info_st *core_con_info_core, mcd_register_info_st *core_ip_reg);
extern mcd_return_et mcdd_write_block(mcd_core_st *core, unsigned address, uint32_t num_bytes, unsigned char *pmem);
int target_download_ram(mcd_server_st *server, mcd_core_st *core, mcd_core_con_info_st *core_con_info_core, mcd_register_info_st *core_ip_reg, char *pname);
int target_download_init(mcd_server_st *server, mcd_core_st *core, mcd_core_con_info_st *core_con_info_core, mcd_register_info_st *core_ip_reg);
int target_download_flash(mcd_server_st *server, mcd_core_st *core, mcd_core_con_info_st *core_con_info_core, mcd_register_info_st *core_ip_reg, char *pname, int emul);
int target_download_flash_double(mcd_server_st *server, mcd_core_st *core, mcd_core_con_info_st *core_con_info_core, mcd_register_info_st *core_ip_reg, char *pname, int emul);

int	memory[65536];		/* the memory is global */

/* parses a line of intel hex code, stores the data in bytes[] */
/* and the beginning address in addr, and returns a 1 if the */
/* line was valid, or a 0 if an error occured.  The variable */
/* num gets the number of bytes that were stored into bytes[] */


typedef struct
{
  int was_used; //shows if the memory region was touched
  int valid; //the entry is valid
  unsigned int addr; //the primary address, uncached
  unsigned int addr_mirror; //the secondary address, cached
  unsigned int page_size;
  int length; //length of the memory in bytes
  unsigned char *data; //the content
  char *status; //the status of the content
} tmemel;
#define BYTE_SET_CONTENT 1
#define BYTE_SET_PAGE 2
#define BYTE_SET_EMPTY 0

#define MAX_memel 512
tmemel memel[MAX_memel];

int target_download_init(mcd_server_st *server, mcd_core_st *core, mcd_core_con_info_st *core_con_info_core, mcd_register_info_st *core_ip_reg)
{
  int ret;
  printf("Do Halt after Reset \n");
  ret = do_rsthlt(server, core, core_con_info_core, core_ip_reg);
  printf("Do Frequency \n");
  ret = do_frequency(server, core, core_con_info_core, core_ip_reg);
  return(ret);
}

int target_download_flash(mcd_server_st *server, mcd_core_st *core, mcd_core_con_info_st *core_con_info_core, mcd_register_info_st *core_ip_reg, char *pname,int emul)
{
  int i;
  int ret;
  unsigned int len;
  unsigned int addr;
  unsigned char *pdata0;
  unsigned char *pdata1;
  unsigned int begin_addr;
  unsigned int target_addr0;
  unsigned int target_param_addr0;
  unsigned int target_status0;
  unsigned int target_addr1;
  unsigned int target_param_addr1;
  unsigned int target_status1;
  unsigned int params[8];
  int status;
  unsigned int value;

  ret = 0;
  init_memory_buffers();
  load_file(pname);
  analyze_memory_buffer();

  SYSTEMTIME time;
  GetSystemTime(&time);
  LONG time_ms_start = (time.wSecond * 1000) + time.wMilliseconds;
  // check the sectors to be erased
  if (emul == 1)
    {
      for (i = 0; i < MAX_memel; i += 1)
	{
	  if ((memel[i].valid == 1) && (memel[i].was_used == 1))
	    {
	      //printf("Emul Erase Sector Used=%d Addr=%8.8X Addr_mirror=%8.8X length=%8.8X\n", i, memel[i].addr, memel[i].addr_mirror, memel[i].length);
	    }
	}
    }
  if (emul == 0)
    {
      //ERASE Sectors
      for (i = 0; i < MAX_memel; i += 1)
	{
	  if ((memel[i].valid == 1) && (memel[i].was_used == 1))
	    {
	      //set PC to 0x70000000
	      ret = do_write_mem(server, core, core_con_info_core, core_ip_reg, 0xF881FE08, 0x70000000); //PC
	      ret = do_write_mem(server, core, core_con_info_core, core_ip_reg, 0xF881FF90, 0x70008000); //A4
	      {
		status = -1;
		ret = do_status(server, core, core_con_info_core, core_ip_reg, &status);
		/*		MCD_CORE_STATE_UNKNOWN = 0x00000000,   < Target core state is unknown.
					MCD_CORE_STATE_RUNNING = 0x00000001, < Target core is running.
					MCD_CORE_STATE_HALTED = 0x00000002,  < Target core is halted.
					MCD_CORE_STATE_DEBUG = 0x00000003,   < Target core is in debug mode.
		 */
	      }
	      //printf("Erase Sector Used=%d Addr=%8.8X Addr_mirror=%8.8X length=%8.8X\n", i, memel[i].addr, memel[i].addr_mirror, memel[i].length);
	      /*
				#define flashaddress  parameter[0] 0x0
				#define databuswidth  parameter[1] 0x4
				#define address       parameter[2] 0x8
				#define number		  parameter[3] 0xC
				#define status		  parameter[4] 0x10
				#define databegin	  parameter[5] 0x14
				#define dummy1		  parameter[6] 0x18
				#define dummy2		  parameter[7] 0x1C
				0x70008000
	       */
	      params[0] = 0xA0000000;
	      params[2] = memel[i].addr;
	      params[4] = 0x2;
	      ret= mcdd_write_block(core, 0x70008000, 32, (unsigned char *) &params[0]);
	      ret = do_run(server, core, core_con_info_core, core_ip_reg);
	      {
		status = -1;
		while (1 == 1)
		  {
		    ret = do_status(server, core, core_con_info_core, core_ip_reg, &status);
		    /*		MCD_CORE_STATE_UNKNOWN = 0x00000000,   < Target core state is unknown.
						MCD_CORE_STATE_RUNNING = 0x00000001, < Target core is running.
						MCD_CORE_STATE_HALTED = 0x00000002,  < Target core is halted.
						MCD_CORE_STATE_DEBUG = 0x00000003,   < Target core is in debug mode.
		     */
		    //printf("Status2 %d \n", status);
		    if (status != MCD_CORE_STATE_RUNNING)
		      {
			ret = do_status(server, core, core_con_info_core, core_ip_reg, &status);
			ret = do_read_mem(server, core, core_con_info_core, core_ip_reg, 0x70008010, &value);
			//printf("StatusExit Erase Target=%d Status=%8.8x \n", status, value);
			break;
		      }
		  }
	      }
	    }
	}
    }
  GetSystemTime(&time);
  LONG time_ms_end = (time.wSecond * 1000) + time.wMilliseconds;
  printf("Time to Erase in ms (Milliseconds) %d \n", time_ms_end - time_ms_start);
  GetSystemTime(&time);
  time_ms_start = (time.wSecond * 1000) + time.wMilliseconds;

  if (emul == 0)
    {
      for (i = 0; i < MAX_memel; i += 1)
	{
	  if ((memel[i].valid == 1) && (memel[i].was_used == 1))
	    {
	      target_addr0 = 0x70008000;
	      target_param_addr0 = 0x70006000;
	      target_status0 = 0;
	      target_addr1 = 0x70010000;
	      target_param_addr1 = 0x70006100;
	      target_status1 = 0;
	      begin_addr = memel[i].addr;
	      while (1 == 1)
		{
		  pdata0 = get_memory_buffer(begin_addr, &addr, &len);
		  if (pdata0 == NULL) { break;	}
		  if (len > 0x8000) len = 0x8000;
		  begin_addr = addr + len;
		  printf("Program Flash Used=%d Addr_Base=%8.8X Addr=%8.8X targaddr=%8.8X length=%8.8X\n", i, memel[i].addr, addr, target_addr0, len);
		  ret = mcdd_write_block(core, target_addr0, len, &pdata0[0]);
		  params[0] = 0xA0000000;
		  params[2] = addr;
		  params[3] = len;
		  params[4] = 0x1;
		  params[5] = target_addr0;
		  ret = mcdd_write_block(core, target_param_addr0, 32, (unsigned char *)&params[0]);
		  target_status0 = 1;

		  //set PC to 0x70000000
		  ret = do_write_mem(server, core, core_con_info_core, core_ip_reg, 0xF881FE08, 0x70000000); //PC
		  ret = do_write_mem(server, core, core_con_info_core, core_ip_reg, 0xF881FF90, target_param_addr0); //A4
		  ret = do_run(server, core, core_con_info_core, core_ip_reg);
		  target_status0 = 2;
		  status = -1;
		  while (1 == 1)
		    {
		      ret = do_status(server, core, core_con_info_core, core_ip_reg, &status);
		      if (status != MCD_CORE_STATE_RUNNING)
			{
			  //#define status		  parameter[4] 0x10
			  //read status
			  ret = do_read_mem(server, core, core_con_info_core, core_ip_reg, target_param_addr0+0x10, &value);
			  target_status0 = 0;
			  //printf("StatusExit Program Target=%d Status=%8.8x \n", status, value);
			  break;
			}
		    }
		  //end of memory element reached
		  if (begin_addr >= (memel[i].addr + memel[i].length)) break;
		}
	    }
	}
    }
  GetSystemTime(&time);
  time_ms_end = (time.wSecond * 1000) + time.wMilliseconds;
  printf("Time to Program in ms (Milliseconds) %d \n", time_ms_end - time_ms_start);
  return(ret);
}

LONG delta_ms(SYSTEMTIME time_start,SYSTEMTIME time_end)
{
  LONG time_s;
  LONG time_e;
  time_s=time_start.wHour * 3600 * 1000 + time_start.wMinute *60 * 1000 + time_start.wSecond *1000 + time_start.wMilliseconds;
  time_e=time_end.wHour * 3600 * 1000 + time_end.wMinute *60 * 1000 + time_end.wSecond *1000 + time_end.wMilliseconds;
  return(time_e-time_s);
}


int target_download_flash_double(mcd_server_st *server, mcd_core_st *core, mcd_core_con_info_st *core_con_info_core, mcd_register_info_st *core_ip_reg, char *pname, int emul)
{
  int i;
  int ret;
  unsigned int len;
  unsigned int addr;
  unsigned char *pdata0;
  unsigned char *pdata1;
  unsigned int begin_addr;
  unsigned int target_addr0;
  unsigned int target_param_addr0;
  unsigned int target_status0;
  unsigned int target_addr1;
  unsigned int target_param_addr1;
  unsigned int target_status1;
  unsigned int params[8];
  int status;
  unsigned int value;
  SYSTEMTIME time_end;
  SYSTEMTIME time_start;
  LONG time_delta_ms;

  ret = 0;
  init_memory_buffers();
  GetSystemTime(&time_start);
  load_file(pname);
  analyze_memory_buffer();
  GetSystemTime(&time_end);
  printf("Load IHex FilE Done! \n");
  fflush(stdout);
  printf("Time to Load in ms (Milliseconds) %ld \n", delta_ms(time_start,time_end));
  fflush(stdout);


  GetSystemTime(&time_start);
  // check the sectors to be erased
  if (emul == 1)
    {
      for (i = 0; i < MAX_memel; i += 1)
	{
	  if ((memel[i].valid == 1) && (memel[i].was_used == 1))
	    {
	      //printf("Emul Erase Sector Used=%d Addr=%8.8X Addr_mirror=%8.8X length=%8.8X\n", i, memel[i].addr, memel[i].addr_mirror, memel[i].length);
	    }
	}
    }
  if (emul == 0)
    {
      //ERASE Sectors
      for (i = 0; i < MAX_memel; i += 1)
	{
	  if ((memel[i].valid == 1) && (memel[i].was_used == 1))
	    {
	      //set PC to 0x70000000
	      ret = do_write_mem(server, core, core_con_info_core, core_ip_reg, 0xF881FE08, 0x70000000); //PC
	      ret = do_write_mem(server, core, core_con_info_core, core_ip_reg, 0xF881FF90, 0x70008000); //A4
	      {
		status = -1;
		ret = do_status(server, core, core_con_info_core, core_ip_reg, &status);
		/*		MCD_CORE_STATE_UNKNOWN = 0x00000000,   < Target core state is unknown.
					MCD_CORE_STATE_RUNNING = 0x00000001, < Target core is running.
					MCD_CORE_STATE_HALTED = 0x00000002,  < Target core is halted.
					MCD_CORE_STATE_DEBUG = 0x00000003,   < Target core is in debug mode.
		 */
	      }
	      //printf("Erase Sector Used=%d Addr=%8.8X Addr_mirror=%8.8X length=%8.8X\n", i, memel[i].addr, memel[i].addr_mirror, memel[i].length);
	      /*
				#define flashaddress  parameter[0] 0x0
				#define databuswidth  parameter[1] 0x4
				#define address       parameter[2] 0x8
				#define number		  parameter[3] 0xC
				#define status		  parameter[4] 0x10
				#define databegin	  parameter[5] 0x14
				#define dummy1		  parameter[6] 0x18
				#define dummy2		  parameter[7] 0x1C
				0x70008000
	       */
	      params[0] = 0xA0000000;
	      params[2] = memel[i].addr;
	      params[4] = 0x2;
	      ret = mcdd_write_block(core, 0x70008000, 32, (unsigned char *)&params[0]);
	      ret = do_run(server, core, core_con_info_core, core_ip_reg);
	      printf("Erase Sector @addr=%8.8x \n", memel[i].addr);
	      fflush(stdout);
	      {
		status = -1;
		while (1 == 1)
		  {
		    ret = do_status(server, core, core_con_info_core, core_ip_reg, &status);
		    /*		MCD_CORE_STATE_UNKNOWN = 0x00000000,   < Target core state is unknown.
						MCD_CORE_STATE_RUNNING = 0x00000001, < Target core is running.
						MCD_CORE_STATE_HALTED = 0x00000002,  < Target core is halted.
						MCD_CORE_STATE_DEBUG = 0x00000003,   < Target core is in debug mode.
		     */
		    //printf("Status2 %d \n", status);
		    if (status != MCD_CORE_STATE_RUNNING)
		      {
			ret = do_status(server, core, core_con_info_core, core_ip_reg, &status);
			ret = do_read_mem(server, core, core_con_info_core, core_ip_reg, 0x70008010, &value);
			//printf("StatusExit Erase Status=%d Value=%8.8x \n", status, value);
			break;
		      }
		  }
	      }
	    }
	}
    }

  GetSystemTime(&time_end);
  printf("Erase Done! \n");
  fflush(stdout);
  printf("Time to Erase in ms (Milliseconds) %ld \n", delta_ms(time_start,time_end));
  fflush(stdout);
  GetSystemTime(&time_start);

  if (emul == 0)
    {
      for (i = 0; i < MAX_memel; i += 1)
	{
	  if ((memel[i].valid == 1) && (memel[i].was_used == 1))
	    {
	      target_addr0 = 0x70008000;
	      target_param_addr0 = 0x70006000;
	      target_status0 = 0;
	      target_addr1 = 0x70010000;
	      target_param_addr1 = 0x70006100;
	      target_status1 = 0;
	      begin_addr = memel[i].addr;
	      while (1 == 1)
		{
		  //printf("Target0=%d Target1=%d\n", target_status0, target_status1);
		  if (target_status0 == 0)
		    {
		      if (target_status1 == 1)
			{
			  //set PC to 0x70000000
			  //printf("Start Program1\n");
			  ret = do_write_mem(server, core, core_con_info_core, core_ip_reg, 0xF881FE08, 0x70000000); //PC
			  ret = do_write_mem(server, core, core_con_info_core, core_ip_reg, 0xF881FF90, target_param_addr1); //A4
			  ret = do_run(server, core, core_con_info_core, core_ip_reg);
			  target_status1 = 2;
			}
		      if (begin_addr < (memel[i].addr + memel[i].length))
			{
			  pdata0 = get_memory_buffer(begin_addr, &addr, &len);
			  if (pdata0 != NULL)
			    {
			      if (len > 0x8000) len = 0x8000;
			      begin_addr = addr + len;
			      //printf("Program0 Flash Used=%d Addr_Base=%8.8X Addr=%8.8X targaddr=%8.8X length=%8.8X\n", i, memel[i].addr, addr, target_addr0, len);
			      ret = mcdd_write_block(core, target_addr0, len, &pdata0[0]);
			      params[0] = 0xA0000000;
			      params[2] = addr;
			      params[3] = len;
			      params[4] = 0x1;
			      params[5] = target_addr0;
			      ret = mcdd_write_block(core, target_param_addr0, 32, (unsigned char *)&params[0]);
			      target_status0 = 1;
			    }
			  else
			    {
			      target_status0 = 4;
			    }
			}
		      else
			{
			  target_status0 = 4;
			}
		    }
		  if (target_status1 == 0)
		    {
		      if (target_status0 == 1)
			{
			  //set PC to 0x70000000
			  //printf("Start Program0\n");
			  ret = do_write_mem(server, core, core_con_info_core, core_ip_reg, 0xF881FE08, 0x70000000); //PC
			  ret = do_write_mem(server, core, core_con_info_core, core_ip_reg, 0xF881FF90, target_param_addr0); //A4
			  ret = do_run(server, core, core_con_info_core, core_ip_reg);
			  target_status0 = 2;
			}
		      if (begin_addr < (memel[i].addr + memel[i].length))
			{
			  pdata1 = get_memory_buffer(begin_addr, &addr, &len);
			  if (pdata1 != NULL)
			    {
			      if (len > 0x8000) len = 0x8000;
			      begin_addr = addr + len;
			      //printf("Program1 Flash Used=%d Addr_Base=%8.8X Addr=%8.8X targaddr=%8.8X length=%8.8X\n", i, memel[i].addr, addr, target_addr1, len);
			      ret = mcdd_write_block(core, target_addr1, len, &pdata1[0]);
			      params[0] = 0xA0000000;
			      params[2] = addr;
			      params[3] = len;
			      params[4] = 0x1;
			      params[5] = target_addr1;
			      ret = mcdd_write_block(core, target_param_addr1, 32, (unsigned char *)&params[0]);
			      target_status1 = 1;
			    }
			  else
			    {
			      target_status1 = 4;
			    }
			}
		      else
			{
			  target_status1 = 4;
			}

		    }
		  status = -1;
		  while (1 == 1)
		    {
		      ret = do_status(server, core, core_con_info_core, core_ip_reg, &status);
		      if (status != MCD_CORE_STATE_RUNNING)
			{
			  //#define status		  parameter[4] 0x10
			  //read status
			  if (target_status0 == 2) {
			      ret = do_read_mem(server, core, core_con_info_core, core_ip_reg, target_param_addr0 + 0x10, &value);
			      target_status0 = 0;
			      //printf("StatusExit Program Target0 Status=%d Value=%8.8x \n", status, value);
			  }
			  if (target_status1 == 2) {
			      ret = do_read_mem(server, core, core_con_info_core, core_ip_reg, target_param_addr1 + 0x10, &value);
			      target_status1 = 0;
			      //printf("StatusExit Program Target1 Status=%d Value=%8.8x \n", status, value);
			  }
			  break;
			}
		    }
		  //end of memory element reached
		  if ((target_status0 == 4) && (target_status1 == 4))
		    {
		      //printf("%8.8X %8.8X\n", begin_addr, memel[i].addr + memel[i].length);
		      //if (begin_addr >= (memel[i].addr + memel[i].length))
		      //{
		      //printf("Leave Target0=%d Target1=%d\n", target_status0, target_status1);
		      break;
		      //}
		    }
		}
	    }
	}
    }
  GetSystemTime(&time_end);
  printf("Time to Program in ms (Milliseconds) %d \n", delta_ms(time_start,time_end));
  return(ret);
}

int target_download_ram(mcd_server_st *server, mcd_core_st *core, mcd_core_con_info_st *core_con_info_core, mcd_register_info_st *core_ip_reg, char *pname)
{
  int ret;
  init_memory_buffers();
  load_file(pname);
  analyze_memory_buffer();
  {
    unsigned int len;
    unsigned int addr;
    unsigned char *pdata;
    unsigned int i;
    pdata = get_memory_buffer(0x70000000, &addr, &len);
    printf("Write Memory addr=%8.8X length=%8.8X \n", addr, len);
    ret = mcdd_write_block(core, addr, len, &pdata[0]);
  }
  {
    int status;
    status = -1;
    ret = do_status(server, core, core_con_info_core, core_ip_reg, &status);
    /*		MCD_CORE_STATE_UNKNOWN = 0x00000000,   < Target core state is unknown.
		MCD_CORE_STATE_RUNNING = 0x00000001, < Target core is running.
		MCD_CORE_STATE_HALTED = 0x00000002,  < Target core is halted.
		MCD_CORE_STATE_DEBUG = 0x00000003,   < Target core is in debug mode.
     */
    printf("Status CPU0 %d \n", status);
  }
  //set PC to 0x70000000
  ret = do_write_mem(server, core, core_con_info_core, core_ip_reg, 0xF881FE08, 0x70000000);
  {
    int status;
    status = -1;
    ret = do_status(server, core, core_con_info_core, core_ip_reg, &status);
    /*		MCD_CORE_STATE_UNKNOWN = 0x00000000,   < Target core state is unknown.
		MCD_CORE_STATE_RUNNING = 0x00000001, < Target core is running.
		MCD_CORE_STATE_HALTED = 0x00000002,  < Target core is halted.
		MCD_CORE_STATE_DEBUG = 0x00000003,   < Target core is in debug mode.
     */
    printf("Status CPU0 %d \n", status);
  }
  return(ret);
}

unsigned char* get_memory_buffer(unsigned int dst, unsigned int *paddr, unsigned int *plength)
{
  unsigned char *pret;
  int i,j;
  int banalyzed;
  int offs_0, offs_1;
  pret = NULL;
  //we have an address and want to set the value
  for (i = 0; i < MAX_memel; i += 1)
    {
      if ((dst >= memel[i].addr) && (dst < (memel[i].addr+ memel[i].length-1))  && (memel[i].valid == 1) && (memel[i].was_used == 1))
	{
	  j = dst-memel[i].addr;
	  offs_0 = -1;
	  offs_1 = -1;
	  banalyzed = 0;
	  while (banalyzed == 0)
	    {
	      if ((memel[i].status[j] != BYTE_SET_EMPTY) && (offs_0 == -1)) offs_0 = j;
	      if ((memel[i].status[j + memel[i].page_size] == BYTE_SET_EMPTY) && (offs_0 != -1) && (offs_1 == -1)) offs_1 = j + memel[i].page_size - 1;
	      if ((offs_0 != -1) && (offs_1 != -1))
		{
		  //printf("RegionUpload1 Used=%d Addr=%8.8X Addr_mirror=%8.8X length=%8.8X from=%8.8X to=%8.8X \n", i, memel[i].addr, memel[i].addr_mirror, memel[i].length, offs_0 + memel[i].addr, offs_1 + memel[i].addr);
		  banalyzed = 1;
		}
	      j += memel[i].page_size;
	      if (j >= (memel[i].length - memel[i].page_size))
		{
		  if (offs_0 != -1)
		    {
		      offs_1 = memel[i].length - 1;
		      //printf("RegionUpload2 Used=%d Addr=%8.8X Addr_mirror=%8.8X length=%8.8X from=%8.8X to=%8.8X \n", i, memel[i].addr, memel[i].addr_mirror, memel[i].length, offs_0 + memel[i].addr, offs_1 + memel[i].addr);
		    }
		  banalyzed = 1;
		}
	    }

	  if ((offs_0 == -1) || (offs_1 == -1)) return(NULL);

	  *paddr = offs_0+ memel[i].addr;
	  *plength = offs_1 - offs_0 +1;
	  pret = &memel[i].data[offs_0];
	  //printf("RegionUploadSum Used=%d Addr=%8.8X Addr_mirror=%8.8X length=%8.8X addr=%8.8X length=%8.8X \n", i, memel[i].addr, memel[i].addr_mirror, memel[i].length, *paddr, *plength);
	  return (pret);
	}
    }
  return (pret);

}

int set_memory_value(unsigned int addr, unsigned char value)
{
  int ret;
  int i,j,valid_addr;
  unsigned int rel_addr;

  ret = -1;
  //we have an address and want to set the value
  for (i = 0; i < MAX_memel; i += 1)
    {
      valid_addr = -1;
      if ((addr >= memel[i].addr) && (addr < (memel[i].addr + memel[i].length)) && (memel[i].valid == 1)) {
	  valid_addr = 1; rel_addr = addr - memel[i].addr;
      }
      if ((addr >= memel[i].addr_mirror) && (addr < (memel[i].addr_mirror + memel[i].length)) && (memel[i].valid == 1)) {
	  valid_addr = 1; rel_addr = addr - memel[i].addr_mirror;
      }
      if (valid_addr==1)
	{
	  memel[i].was_used = 1;
	  if ((memel[i].status[rel_addr] == BYTE_SET_EMPTY) || (memel[i].status[rel_addr] == BYTE_SET_PAGE))
	    {
	      unsigned int page_begin, page_end;
	      //the location is unused
	      memel[i].data[rel_addr] = value;
	      memel[i].status[rel_addr] = BYTE_SET_CONTENT;
	      //apply other pages members with fill value, page size = 0x100 for program flash
	      page_begin = rel_addr & ~(memel[i].page_size - 1);
	      page_end = rel_addr | (memel[i].page_size-1);
	      for (j = page_begin; j <= page_end; j += 1)
		{
		  if (memel[i].status[j] == BYTE_SET_EMPTY) memel[i].status[j] = BYTE_SET_PAGE;
		}
	    }
	  return(0);
	}
      else
	{
	}
    }
  return (ret);
}

int analyze_memory_buffer(void)
{
  int i,j;
  int offs_0, offs_1;
  int banalyzed;
  for (i = 0; i < MAX_memel; i += 1) {
      if ((memel[i].was_used != -1) && (memel[i].valid == 1))
	{
	  j = 0;
	  offs_0 = -1;
	  offs_1 = -1;
	  banalyzed = 0;
	  while (banalyzed==0)
	    {
	      if ((memel[i].status[j] != BYTE_SET_EMPTY) && (offs_0 == -1)) offs_0 = j;
	      if ((memel[i].status[j + memel[i].page_size] == BYTE_SET_EMPTY) && (offs_0 != -1) && (offs_1 == -1)) offs_1 = j + memel[i].page_size - 1;
	      if ((offs_0 != -1) && (offs_1 != -1))
		{
		  //printf("Region Used=%d Addr=%8.8X Addr_mirror=%8.8X length=%8.8X from=%8.8X to=%8.8X \n", i, memel[i].addr, memel[i].addr_mirror, memel[i].length, offs_0 + memel[i].addr, offs_1 + memel[i].addr);
		  offs_0 = -1;
		  offs_1 = -1;
		}
	      j += memel[i].page_size;
	      if (j >= (memel[i].length - memel[i].page_size))
		{
		  if (offs_0 != -1)
		    {
		      offs_1 = memel[i].length-1;
		      //printf("Region Used=%d Addr=%8.8X Addr_mirror=%8.8X length=%8.8X from=%8.8X to=%8.8X \n", i, memel[i].addr, memel[i].addr_mirror, memel[i].length, offs_0 + memel[i].addr, offs_1 + memel[i].addr);
		    }
		  banalyzed = 1;
		}
	    }
	}
  }
  return(0);
}

int insert_memory_buffer(int i, unsigned int addr, unsigned int addr_mirror, unsigned int length, unsigned int page_size)
{
  int j;
  memel[i].length = length;
  memel[i].addr = addr;
  memel[i].addr_mirror = addr_mirror;
  memel[i].page_size = page_size;
  memel[i].data = (unsigned char *)malloc(memel[i].length); //2Mbyte
  memel[i].status = (char *)malloc(memel[i].length); //2Mbyte
  if (memel[i].data == NULL) printf("MALLOC Issue\n");
  if (memel[i].status == NULL) printf("MALLOC Issue\n");
  //fill status with invalid
  for (j = 0; j < memel[i].length; j += 1) memel[i].status[j] = BYTE_SET_EMPTY;
  memel[i].valid = 1;
  memel[i].was_used = -1;
  return(0);
}

int init_memory_buffers(void)
{
  int i,id;
  int ret;
  unsigned int base;
  for (i = 0; i < MAX_memel; i += 1) {
      memel[i].valid = -1; memel[i].was_used = -1;
      if (memel[i].data != NULL) free(memel[i].data);
      if (memel[i].status != NULL) free(memel[i].status);
  }

  ret = 0;
  base = 0;
  id = 0;
  ret = 0;
  base = 0;
  id=0;
  for (i=0; i<(192*2); i+=1)
    {
      ret |= insert_memory_buffer(id++, 0xA0000000+i*0x4000, 0x80000000+i*0x4000, 0x4000,0x100);
    }
  ret |= insert_memory_buffer(id++, 0x70000000, 0x70000000, 0x40000,0x100);
  return (ret);

}
//ARVO dirty hack to understand ihex extended
int parse_hex_line_addr(char *theline, int bytes[], unsigned int *addr, int *num, int *code)
{
  int sum, len, cksum;
  char *ptr;

  *num = 0;
  if (theline[0] != ':') return 0;
  if (strlen(theline) < 11) return 0;
  ptr = theline + 1;
  if (!sscanf(ptr, "%02x", &len)) return 0;
  ptr += 2;
  if (len != 2) return 0;
  if (strlen(theline) < (11 + (len * 2))) return 0;
  if (!sscanf(ptr, "%04x", addr)) return 0;
  ptr += 4;
  if (*addr != 0) return 0;
  if (!sscanf(ptr, "%02x", code)) return 0;
  ptr += 2;
  if (*code != 4) return 0;
  sum = (len & 255) + ((*addr >> 8) & 255) + (*addr & 255) + (*code & 255);
  while (*num != len) {
      if (!sscanf(ptr, "%02x", &bytes[*num])) return 0;
      ptr += 2;
      sum += bytes[*num] & 255;
      (*num)++;
      if (*num >= 256) return 0;
  }
  *addr = bytes[0] * 256 + bytes[1];
  *addr = *addr << 16;
  if (!sscanf(ptr, "%02x", &cksum)) return 0;
  if (((sum & 255) + (cksum & 255)) & 255) return 0; /* checksum error */
  return 1;
}

int parse_hex_line(char *theline, int bytes[], unsigned int *addr, int *num, int *code)
{
  int sum, len, cksum;
  char *ptr;

  *num = 0;
  if (theline[0] != ':') return 0;
  if (strlen(theline) < 11) return 0;
  ptr = theline + 1;
  if (!sscanf(ptr, "%02x", &len)) return 0;
  ptr += 2;
  if (strlen(theline) < (11 + (len * 2))) return 0;
  if (!sscanf(ptr, "%04x", addr)) return 0;
  ptr += 4;
  //printf("Line: length=%d Addr=%d\n", len, *addr);
  if (!sscanf(ptr, "%02x", code)) return 0;
  ptr += 2;
  sum = (len & 255) + ((*addr >> 8) & 255) + (*addr & 255) + (*code & 255);
  while (*num != len) {
      if (!sscanf(ptr, "%02x", &bytes[*num])) return 0;
      ptr += 2;
      sum += bytes[*num] & 255;
      (*num)++;
      if (*num >= 256) return 0;
  }
  if (!sscanf(ptr, "%02x", &cksum)) return 0;
  if (((sum & 255) + (cksum & 255)) & 255) return 0; /* checksum error */
  return 1;
}

/* loads an intel hex file into the global memory[] array */
/* filename is a string of the file to be opened */

void load_file(char *filename)
{
  char line[1000];
  FILE *fin;
  int n, status, bytes[256];
  unsigned int addr;
  unsigned int addr_offs;
  int i, total = 0, lineno = 1;
  addr_offs = 0;
  if (strlen(filename) == 0) {
      printf("   Can't load a file without the filename.");
      printf("  '?' for help\n");
      return;
  }
  fin = fopen(filename, "r");
  if (fin == NULL) {
      printf("   Can't open file '%s' for reading.\n", filename);
      return;
  }
  while (!feof(fin) && !ferror(fin)) {
      line[0] = '\0';
      fgets(line, 1000, fin);
      if (line[strlen(line) - 1] == '\n') line[strlen(line) - 1] = '\0';
      if (line[strlen(line) - 1] == '\r') line[strlen(line) - 1] = '\0';
      if (parse_hex_line_addr(line, bytes, &addr_offs, &n, &status))
	{
	  if (status == 1) {  /* data */
	      printf("Changed Address offest to %8.8X \n", addr_offs);
	  }
	}

      if (parse_hex_line(line, bytes, &addr, &n, &status)) {
	  if (status == 0) {  /* data */
	      for (i = 0; i <= (n - 1); i++) {
		  unsigned char value;
		  int ret;
		  //memory[addr] = bytes[i] & 255;
		  value = bytes[i] & 255;
		  ret = set_memory_value(addr+addr_offs, value);
		  if (ret == -1) printf("Error! Could not map address %8.8x \n", addr+addr_offs);
		  total++;
		  addr++;
	      }
	  }
	  if (status == 1) {  /* end of file */
	      fclose(fin);
	      printf("IHEX %s Loaded %d bytes \n", filename,total);
	      return;
	  }
	  if (status == 2);  /* begin of file */
      }
      else {
	  printf("   Error: '%s', line: %d\n", filename, lineno);
      }
      lineno++;
  }
}


/* the command string format is "S begin end filename" where */
/* "begin" and "end" are the locations to dump to the intel */
/* hex file, specified in hexidecimal. */

void save_file(char *command)
{
  int begin, end, addr;
  char *ptr, filename[200];
  FILE *fhex;

  ptr = command + 1;
  while (isspace(*ptr)) ptr++;
  if (*ptr == '\0') {
      printf("   Must specify address range and filename\n");
      return;
  }
  if (sscanf(ptr, "%x%x%s", &begin, &end, filename) < 3) {
      printf("   Invalid addresses or filename,\n");
      printf("    usage: S begin_addr end_addr filename\n");
      printf("    the addresses must be hexidecimal format\n");
      return;
  }
  begin &= 65535;
  end &= 65535;
  if (begin > end) {
      printf("   Begin address must be less than end address.\n");
      return;
  }
  fhex = fopen(filename, "w");
  if (fhex == NULL) {
      printf("   Can't open '%s' for writing.\n", filename);
      return;
  }
  for (addr = begin; addr <= end; addr++)
    hexout(fhex, memory[addr], addr, 0);
  hexout(fhex, 0, 0, 1);
  printf("Memory %04X to %04X written to '%s'\n", begin, end, filename);
}


/* produce intel hex file output... call this routine with */
/* each byte to output and it's memory location.  The file */
/* pointer fhex must have been opened for writing.  After */
/* all data is written, call with end=1 (normally set to 0) */
/* so it will flush the data from its static buffer */

#define MAXHEXLINE 32	/* the maximum number of bytes to put in one line */

void hexout(FILE *fhex, int byte, int memory_location, int end)
{
  static int byte_buffer[MAXHEXLINE];
  static int last_mem, buffer_pos, buffer_addr;
  static int writing_in_progress = 0;
  int i, sum;

  if (!writing_in_progress) {
      /* initial condition setup */
      last_mem = memory_location - 1;
      buffer_pos = 0;
      buffer_addr = memory_location;
      writing_in_progress = 1;
  }

  if ((memory_location != (last_mem + 1)) || (buffer_pos >= MAXHEXLINE) \
      || ((end) && (buffer_pos > 0))) {
      /* it's time to dump the buffer to a line in the file */
      fprintf(fhex, ":%02X%04X00", buffer_pos, buffer_addr);
      sum = buffer_pos + ((buffer_addr >> 8) & 255) + (buffer_addr & 255);
      for (i = 0; i < buffer_pos; i++) {
	  fprintf(fhex, "%02X", byte_buffer[i] & 255);
	  sum += byte_buffer[i] & 255;
      }
      fprintf(fhex, "%02X\n", (-sum) & 255);
      buffer_addr = memory_location;
      buffer_pos = 0;
  }

  if (end) {
      fprintf(fhex, ":00000001FF\n");  /* end of file marker */
      fclose(fhex);
      writing_in_progress = 0;
  }

  last_mem = memory_location;
  byte_buffer[buffer_pos] = byte & 255;
  buffer_pos++;
}


