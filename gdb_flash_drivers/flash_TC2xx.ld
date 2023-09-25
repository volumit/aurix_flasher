/* Default linker script, for normal executables */
OUTPUT_FORMAT("elf32-tricore")
OUTPUT_ARCH(tricore)
ENTRY(_start)

__TRICORE_DERIVATE_MEMORY_MAP__ = 0x270;
/* the internal FLASH description */
/* the internal ram description */
__INT_DATA_RAM_BEGIN = 0x70002000;
__INT_DATA_RAM_SIZE = (16K) ;
__ISTACK = 0x70006000 ;
__ISTACK_SIZE = 1K;
__USTACK = 0x70006400;
__USTACK_SIZE = 1K;
__CSA_BEGIN = 0x70007000 ;
__CSA_SIZE = 4k ;
__CSA_END = __CSA_BEGIN + __CSA_SIZE ;

MEMORY
{
  int_flash (rx): org = 0x70000000, len = 8K
  int_dsprcpu0 (w!x): org = 0x70002000, len = (64K-8K)  
}

SECTIONS
{
  /*
   * The startup code should be placed where the CPU expects it after a reset,
   * so we try to locate it first, no matter where it appears in the list of
   * objects and libraries (note: because the wildcard pattern doesn't match
   * directories, we'll try to find crt0.o in various (sub)directories).
   */
  .startup :
  {
    KEEP (*(.startup_code))
    . = ALIGN(8);
  } > int_flash =0x800
  /*
   * Allocate space for absolute addressable sections; this requires that
   * "int_dspr" starts at a TriCore segment (256M) and points to
   * some RAM area!  If these conditions are not met by your particular
   * hardware setup, you should either not use absolute data, or you
   * must move .zdata*,.zbss*,.bdata*,.bbss* input sections to some appropriate
   * memory area.
   */
 .zbss  (NOLOAD) :
  {
    ZBSS_BASE = . ;
    *(.zbss)
    *(.zbss.*)
    *(.gnu.linkonce.zb.*)
    *(.bbss)
    *(.bbss.*)
    . = ALIGN(8);
    ZBSS_END = . ;
  } > int_dsprcpu0
  .zdata  :
  {
    ZDATA_BASE = . ;
    *(.zrodata)
    *(.zrodata.*)
    *(.zdata)
    *(.zdata.*)
    *(.gnu.linkonce.z.*)
    *(.bdata)
    *(.bdata.*)
    . = ALIGN(8);
    ZDATA_END = . ;
  } > int_dsprcpu0 AT> int_flash

  /*
   * Allocate trap and interrupt vector tables.
   */
  .traptab  :
  {
    *(.traptab)
    . = ALIGN(8) ;
  } > int_flash


  /*
   * Allocate .text and other read-only sections.
   */
  .init  :
  {
    *(.init)
    *(.fini)
    . = ALIGN(8);
  } > int_flash =0
  .text  :
  {
    *(.text)
    *(.text.*)
    *(.gnu.linkonce.t.*)
    /*
     * .gnu.warning sections are handled specially by elf32.em.
     */
    *(.gnu.warning)

    . = ALIGN(8);
  } > int_flash =0
  .rodata   :
  {
    *(.rodata)
    *(.rodata.*)
    *(.gnu.linkonce.r.*)
    *(.rodata1)
    *(.toc)
    *(.jcr)
    /*
     * Create the clear and copy tables that tell the startup code
     * which memory areas to clear and to copy, respectively.
     */
    . = ALIGN(4) ;
    PROVIDE(__clear_table = .) ;
    LONG(0 + ADDR(.bss));     LONG(SIZEOF(.bss));
    LONG(0 + ADDR(.sbss));    LONG(SIZEOF(.sbss));
    LONG(0 + ADDR(.zbss));    LONG(SIZEOF(.zbss));
    LONG(-1);                 LONG(-1);
    PROVIDE(__copy_table = .) ;
    LONG(LOADADDR(.data));    LONG(0 + ADDR(.data));    LONG(SIZEOF(.data));
    LONG(LOADADDR(.sdata));   LONG(0 + ADDR(.sdata));   LONG(SIZEOF(.sdata));
    LONG(LOADADDR(.zdata));   LONG(0 + ADDR(.zdata));   LONG(SIZEOF(.zdata));
    LONG(-1);                 LONG(-1);                 LONG(-1);
    . = ALIGN(8);
  } > int_flash
  .sdata2  :
  {
    *(.sdata.rodata)
    *(.sdata.rodata.*)
    . = ALIGN(8);
  } > int_flash
  /*
   * C++ exception handling tables.  NOTE: gcc emits .eh_frame
   * sections when compiling C sources with debugging enabled (-g).
   * If you can be sure that your final application consists
   * exclusively of C objects (i.e., no C++ objects), you may use
   * the -R option of the "strip" and "objcopy" utilities to remove
   * the .eh_frame section from the executable.
   */
  .eh_frame  :
  {
    *(.gcc_except_table)
    __EH_FRAME_BEGIN__ = . ;
    KEEP (*(.eh_frame))
    __EH_FRAME_END__ = . ;
    . = ALIGN(8);
  } > int_flash
  /*
   * Constructors and destructors.
   */
  .ctors :
  {
    __CTOR_LIST__ = . ;
    LONG((__CTOR_END__ - __CTOR_LIST__) / 4 - 2);
    *(.ctors)
    LONG(0) ;
    __CTOR_END__ = . ;
    . = ALIGN(8);
  } > int_flash
  .dtors :
  {
    __DTOR_LIST__ = . ;
    LONG((__DTOR_END__ - __DTOR_LIST__) / 4 - 2);
    *(.dtors)
    LONG(0) ;
    __DTOR_END__ = . ;
    . = ALIGN(8);
  } > int_flash
  /*
   * We're done now with the text part of the executable.  The
   * following sections are special in that their initial code or
   * data (if any) must also be stored in said text part of an
   * executable, but they "live" at completely different addresses
   * at runtime -- usually in RAM areas.  NOTE: This is not really
   * necessary if you use a special program loader (e.g., a debugger)
   * to load a complete executable consisting of code, data, BSS, etc.
   * into the RAM of some target hardware or a simulator, but it *is*
   * necessary if you want to burn your application into non-volatile
   * memories such as EPROM or FLASH.
   */
  .data :
  {
    . = ALIGN(8) ;
    DATA_BASE = . ;
    *(.data)
    *(.data.*)
    *(.gnu.linkonce.d.*)
    SORT(CONSTRUCTORS)
    . = ALIGN(8) ;
    DATA_END = . ;
  } > int_dsprcpu0 AT> int_flash
  .sdata  :
  {
    . = ALIGN(8) ;
    SDATA_BASE = . ;
    PROVIDE(__sdata_start = .);
    *(.sdata)
    _CONFIG_BEGIN_ = .;
    *(.sdata.CONFIG)
    _CONFIG_END_ = .;
    *(.sdata.*)
    *(.gnu.linkonce.s.*)
    . = ALIGN(8) ;
  } > int_dsprcpu0 AT> int_flash
  .sbss  :
  {
    PROVIDE(__sbss_start = .);
    *(.sbss)
    *(.sbss.*)
    *(.gnu.linkonce.sb.*)
    . = ALIGN(8) ;
  } > int_dsprcpu0

  /*
   * Allocate space for BSS sections.
   */
  .bss  (NOLOAD) :
  {
    BSS_BASE = . ;
    *(.bss)
    *(.bss.*)
    *(.gnu.linkonce.b.*)
    *(COMMON)
    . = ALIGN(8) ;
  } > int_dsprcpu0
/*  __ISTACK = __INT_DATA_RAM_BEGIN + __ISTACK_SIZE ;
  __USTACK = __ISTACK + __USTACK_SIZE ;
  __HEAP = __USTACK ;
  __HEAP_END = __RAM_END ;
  _end = __HEAP_END ;
  PROVIDE(end = _end) ;
*/
  /* Make sure CSA, stack and heap addresses are properly aligned.  */
/*  _. = ASSERT ((__CSA_BEGIN & 0x3f) == 0 , "illegal CSA start address") ;
  _. = ASSERT ((__CSA_SIZE & 0x3f) == 0 , "illegal CSA size") ;
  _. = ASSERT ((__ISTACK & 7) == 0 , "ISTACK not doubleword aligned") ;
  _. = ASSERT ((__USTACK & 7) == 0 , "USTACK not doubleword aligned") ;
  _. = ASSERT ((__HEAP_END & 7) == 0 , "HEAP not doubleword aligned") ;
*/
  /* Define a default symbol for address 0.  */
  NULL = DEFINED (NULL) ? NULL : 0 ;
  /*
   * DWARF debug sections.
   * Symbols in the DWARF debugging sections are relative to the
   * beginning of the section, so we begin them at 0.
   */
  /*
   * DWARF 1
   */
  .comment         0 : { *(.comment) }
  .debug           0 : { *(.debug) }
  .line            0 : { *(.line) }
  /*
   * GNU DWARF 1 extensions
   */
  .debug_srcinfo   0 : { *(.debug_srcinfo) }
  .debug_sfnames   0 : { *(.debug_sfnames) }
  /*
   * DWARF 1.1 and DWARF 2
   */
  .debug_aranges   0 : { *(.debug_aranges) }
  .debug_pubnames  0 : { *(.debug_pubnames) }
  /*
   * DWARF 2
   */
  .debug_info      0 : { *(.debug_info) }
  .debug_abbrev    0 : { *(.debug_abbrev) }
  .debug_line      0 : { *(.debug_line) }
  .debug_frame     0 : { *(.debug_frame) }
  .debug_str       0 : { *(.debug_str) }
  .debug_loc       0 : { *(.debug_loc) }
  .debug_macinfo   0 : { *(.debug_macinfo) }
  .debug_ranges    0 : { *(.debug_ranges) }
  /*
   * SGI/MIPS DWARF 2 extensions
   */
  .debug_weaknames 0 : { *(.debug_weaknames) }
  .debug_funcnames 0 : { *(.debug_funcnames) }
  .debug_typenames 0 : { *(.debug_typenames) }
  .debug_varnames  0 : { *(.debug_varnames) }
  /*
   * Optional sections that may only appear when relocating.
   */
  /*
   * Optional sections that may appear regardless of relocating.
   */
  .version_info    0 : { *(.version_info) }
  .boffs           0 : { KEEP (*(.boffs)) }
}
