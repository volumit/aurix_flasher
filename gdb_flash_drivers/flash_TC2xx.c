

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
#define FLASH0_FSR	0xf8002010u	/* Flash Status Register */
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
  __asm (" ja main");
}

void main(unsigned long * parameter)
{
  volatile int timeout;
  volatile unsigned int len, valid,i,j,physical;
  volatile unsigned int *addr;
  volatile unsigned int addr_unaligned,addr_aligned;
  volatile unsigned int *data,read;
  volatile unsigned int low32bit,high32bit;
  volatile unsigned int burst;
  volatile unsigned int burst_buffer[0x40];
  volatile unsigned int dummy;
  /* FLASH PROGRAMMING */
  if (status == 1) 								/* requested operaeration 1= prog  2= erase */
    {
      addr_aligned  = (unsigned int) address;						/* address in flash for current data 		*/
      data  = (unsigned int *) databegin;					/* pointer to current data in data buffer 	*/
      burst=0x0;
      if ((flashaddress & 0x8F000000)==0x80000000) burst=0x40;
      if ((flashaddress & 0x8F000000)==0x8F000000) burst=0x8;
      if (burst==0x0) { status = 0x100;__asm ("	debug"); }
      while (number > 0)
	{
	  addr = (unsigned int *) addr_aligned;
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
	  MEM(0xAF00AAA8) = 0x7A;
	  for (timeout=0x4000; timeout>0; timeout--)
	    {
	      read = MEM(FLASH0_FSR);
	      __asm ("	dsync");
	      if ((read & 0x001E) ==0) { timeout=0; MEM(0xAF005554) = 0xFA; }
	      if (timeout==1) { address = addr_aligned; status = 0x0100; MEM(0xAF005554) = 0xFA;	__asm ("	debug"); }
	    }
	  addr_aligned+=burst*4;
	}
      status = 0x00;/* set return parameter = success, return to control */
      MEM(0xAF005554) = 0xFA;
      __asm ("	debug");
    }


  /* FLASH CHIP ERASE (no sector erase) */
  if (status == 2)
    {
      valid=0;
      if ((((flashaddress & 0xFFFFFF00) +0x0000)==(address & 0xFFFFFF00)) && (valid==0)) { len=0x4000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x4000)==(address & 0xFFFFFF00)) && (valid==0)) { len=0x4000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x8000)==(address & 0xFFFFFF00)) && (valid==0)) { len=0x4000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0xC000)==(address & 0xFFFFFF00)) && (valid==0)) { len=0x4000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x10000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x4000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x14000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x4000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x18000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x4000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x1C000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x4000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x20000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x8000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x28000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x8000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x30000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x8000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x38000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x8000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x40000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x8000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x48000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x8000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x50000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x8000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x58000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x8000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x60000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x10000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x70000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x10000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x80000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x10000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x90000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x10000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0xA0000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x20000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0xC0000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x20000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0xE0000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x20000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x100000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x40000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x140000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x40000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x180000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x40000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x1C0000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x40000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x200000)==(address & 0xFFFFFF00)) && (valid==0)) { len=0x4000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x204000)==(address & 0xFFFFFF00)) && (valid==0)) { len=0x4000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x208000)==(address & 0xFFFFFF00)) && (valid==0)) { len=0x4000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x20C000)==(address & 0xFFFFFF00)) && (valid==0)) { len=0x4000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x210000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x4000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x214000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x4000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x218000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x4000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x21C000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x4000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x220000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x8000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x228000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x8000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x230000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x8000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x238000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x8000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x240000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x8000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x248000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x8000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x250000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x8000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x258000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x8000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x260000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x10000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x270000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x10000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x280000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x10000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x290000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x10000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x2A0000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x20000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x2C0000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x20000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x2E0000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x20000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x300000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x40000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x340000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x40000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x380000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x40000;valid=1;physical=0; }
      if ((((flashaddress & 0xFFFFFF00) +0x3C0000)==(address & 0xFFFFFF00)) && (valid==0))  { len=0x40000;valid=1;physical=0; }
      valid=1;
      if (valid==0)
	{
	  status = 0x100;	/* set error return parameter and return to control */
	  __asm ("	debug");

	}
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
	  read = MEM(FLASH0_FSR);
	  __asm ("	dsync");
	  if ((MEM(FLASH0_FSR) & 0x001E) ==0)
	    {
	      status = 0x0000;
	      __asm ("	nop");
	      __asm ("	nop");
	      __asm ("	nop");
	      __asm ("	debug");

	    }
	}

    }

  __asm ("	debug");
}


