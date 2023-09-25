

#ifdef GNU
#include <machine/intrinsics.h>
#endif
#ifdef __TASKING__
#define _debug __debug
#define _nop __nop
#endif
#define flashaddress  parameter[0]
#define databuswidth  parameter[1]
#define address       parameter[2]
#define number		  parameter[3]
#define status		  parameter[4]
#define databegin	  parameter[5]
#define dummy1		  parameter[6]
#define dummy2		  parameter[7]
#define HF_STATUS	 0xF8040010u	/* Flash Status Register */
#define HF_CLRE      0xF8040038u /* Clear Error Register, mask is 0x3E*/
#define HF_ERRSR     0xF8040034u /* Clear Error Register, mask is 0x3E*/
// this macro is used to address SFRs directly in C programs
#ifndef MEM
# define MEM(address) (*((volatile unsigned int *)(address)))  // makes live easier
#endif
#ifndef MEM16
# define MEM16(address) (*((volatile unsigned short *)(address)))
#endif
#ifndef MEM8
# define MEM8(address) (*((volatile unsigned char *)(address)))
#endif


void start(void)
{
  __asm (".global _start");
  __asm (" _start:	 nop");
  __asm (" nop");
  __asm (" movh.a   %a10,hi:(0x70004000)");
  __asm (" lea      %a10,[%a10]lo:(0x70004000)");
  __asm (" ja flashing");
}

int flashing(unsigned long * parameter, char **notused)
{
  volatile int timeout;
  volatile unsigned int i,j;
  volatile unsigned int addr_aligned;
  volatile unsigned int *data,read;
  volatile unsigned int low32bit,high32bit;
  volatile unsigned int burst;
  volatile unsigned int len;
  volatile unsigned int burst_buffer[0x40];
  /* FLASH PROGRAMMING */
  /* requested operaeration 1= prog  2= erase 3=ucb bmhd*/
  MEM(HF_CLRE)=0x3e;
  if (status == 1)
    {
      status=0x100;
      addr_aligned  = (unsigned int) address;						/* address in flash for current data 		*/
      data  = (unsigned int *) databegin;					/* pointer to current data in data buffer 	*/
      burst=0x0;
      if ((flashaddress & 0x8F000000)==0x80000000) burst=0x40;
      if ((flashaddress & 0x8F000000)==0x8F000000) burst=0x8;
      if (burst==0x0) { status = 0x100;__asm ("	debug"); }
      while (number > 0)
	{
	  for (i=0; i<burst; i++)
	    {
	      burst_buffer[i]=*data;
	      data++;
	      number-=4;
	    }
	  if (burst==0x40) { MEM(0xAF005554) = 0x50;	 }
	  if (burst==0x8) { MEM(0xAF005554) = 0x5D;	 }
	  i=0;
	  while (i<burst)
	    {
	      low32bit=burst_buffer[i];
	      i+=1;
	      high32bit=burst_buffer[i];
	      i+=1;
	      MEM(0xAF0055F0)=low32bit;
	      __asm ("	dsync");
	      MEM(0xAF0055F4)=high32bit;
	      __asm ("	dsync");
	    }

	  MEM(0xAF00AA50) = addr_aligned;
	  __asm ("	dsync");
	  MEM(0xAF00AA58) = 0x0;
	  __asm ("	dsync");
	  MEM(0xAF00AAA8) = 0xa0;
	  __asm ("	dsync");
	  MEM(0xAF00AAA8) = 0xa6;
	  __asm ("	dsync");

	  for (timeout=0x4000; timeout>0; timeout--)
	    {
	      read = MEM(HF_STATUS);
	      __asm ("	dsync");
	      if ((read & 0x00FF) ==0) { timeout=0; MEM(0xAF005554) = 0xFA; }
	      if (timeout==1) {
		  address = addr_aligned; status = 0x0100; MEM(0xAF005554) = 0xFA;	__asm ("	debug");
	      }
	    }
	  addr_aligned+=burst*4;
	}
      if ((MEM(HF_ERRSR) & 0x003E)!=0)
	status = 0x0100; else status=0x0;	
      MEM(0xAF005554) = 0xFA;
      __asm ("	debug");
    }


  /* sector erase singular */
  /* can be optimized if host knows the amount of sectors */
  if (status == 2)
    {
      status=0x100;
      MEM(0xAF00AA50) = address;
      __asm ("	dsync");
      MEM(0xAF00AA58) = 1;
      __asm ("	dsync");
      MEM(0xAF00AAA8) = 0x80;
      __asm ("	dsync");
      MEM(0xAF00AAA8) = 0x50;
      __asm ("	dsync");
      while (1==1)
	{
	  for (i=0; i<0x40000; i++) {i+=1; i-=1;	}
	  read = MEM(HF_STATUS);
	  __asm ("	dsync");
	  if ((MEM(HF_STATUS) & 0x00FF) ==0)
	    {
	      if ((MEM(HF_ERRSR) & 0x003E)!=0)
		status = 0x0100; else status=0x0;
	      __asm ("	debug");

	    }
	}

    }

  /* Erase and program a BMH UCH incl. its copy */
  if (status == 3)
    {
      //erase the copy
      status=0x100;
      MEM(0xAF00AA50) = address;
      __asm ("	dsync");
      MEM(0xAF00AA58) = 1;
      __asm ("	dsync");
      MEM(0xAF00AAA8) = 0x80;
      __asm ("	dsync");
      MEM(0xAF00AAA8) = 0x50;
      __asm ("	dsync");
      while (1==1)
	{
	  for (i=0; i<0x40000; i++) {i+=1; i-=1;	}
	  read = MEM(HF_STATUS);
	  __asm ("	dsync");
	  if ((MEM(HF_STATUS) & 0x00FF) ==0)
	    {
	      if ((MEM(HF_ERRSR) & 0x003E)!=0)
		{
		  status = 0x0101;
		  __asm ("	debug");
		}
	      else
		{
		  status=0x0;
		  goto program_copy;
		}

	    }
	}
      program_copy:
      len=0x200>>2;
      burst=0x8;
      data  = (unsigned int *) (databegin);
      j=0;
      while (j<len)
	{	
	  i=0;
	  MEM(0xAF005554) = 0x5D;
	  while (i<burst)
	    {
	      low32bit=data[j+i];
	      MEM(0xAF0055F0)=low32bit;
	      __asm ("	dsync");
	      i+=1;
	      high32bit=data[j+i];
	      MEM(0xAF0055F4)=high32bit;
	      __asm ("	dsync");
	      i+=1;
	    }
	  MEM(0xAF00AA50) = address + (j<<2);
	  __asm ("	dsync");
	  MEM(0xAF00AA58) = 0x0;
	  __asm ("	dsync");
	  MEM(0xAF00AAA8) = 0xa0;


	  MEM(0xAF00AAA8) = 0xa6;
	  __asm ("	dsync");
	  for (timeout=0x4000; timeout>0; timeout--)
	    {
	      read = MEM(HF_STATUS);
	      __asm ("	dsync");
	      if ((read & 0x00FF) ==0) { timeout=0; MEM(0xAF005554) = 0xFA; }
	      if (timeout==1) {
		  address = addr_aligned; status = 0x0102; MEM(0xAF005554) = 0xFA;
		  __asm ("	debug");
	      }
	    }
	  j+=burst;
	  if ((MEM(HF_ERRSR) & 0x003E)!=0)
	    {
	      status = 0x0103;
	      __asm ("	debug");
	    }
	}
      status=0x0;
      __asm ("	debug");
    }

  status = 0x100;
  __asm ("	debug");
  return 0;
}


