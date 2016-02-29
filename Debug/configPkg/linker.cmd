/*
 * Do not modify this file; it is automatically generated from the template
 * linkcmd.xdt in the ti.targets.elf package and will be overwritten.
 */

/*
 * put '"'s around paths because, without this, the linker
 * considers '-' as minus operator, not a file name character.
 */


-l"E:\Studio\TICCS\mcip_slave\Debug\configPkg\package\cfg\mcip_slave_pe66.oe66"
-l"D:\Program\Texas\MCSDK\ipc_1_24_03_32\packages\ti\sdo\ipc\lib\instrumented_e66\ipc\ipc.lib"
-l"D:\Program\Texas\MCSDK\bios_6_33_06_50\packages\ti\sysbios\lib\instrumented_e66\sysbios\sysbios.lib"
-l"D:\Program\Texas\MCSDK\xdctools_3_23_04_60\packages\ti\targets\rts6000\lib\ti.targets.rts6000.ae66"
-l"D:\Program\Texas\MCSDK\xdctools_3_23_04_60\packages\ti\targets\rts6000\lib\boot.ae66"

--retain="*(xdc.meta)"


--args 0x0
-heap  0x0
-stack 0x1000

MEMORY
{
    L2SRAM (RWX) : org = 0x800000, len = 0x40000
    MSMCSRAM_MASTER (RWX) : org = 0xc000000, len = 0x100000
    MSMCSRAM_SLAVE (RWX) : org = 0xc100000, len = 0x100000
    MSMCSRAM_IPC (RWX) : org = 0xc200000, len = 0x200000
    DDR3 (RWX) : org = 0x80000000, len = 0x10000000
}

/*
 * Linker command file contributions from all loaded packages:
 */

/* Content from xdc.services.global (null): */

/* Content from xdc (null): */

/* Content from xdc.corevers (null): */

/* Content from xdc.shelf (null): */

/* Content from xdc.services.spec (null): */

/* Content from xdc.services.intern.xsr (null): */

/* Content from xdc.services.intern.gen (null): */

/* Content from xdc.services.intern.cmd (null): */

/* Content from xdc.bld (null): */

/* Content from ti.targets (null): */

/* Content from ti.targets.elf (null): */

/* Content from xdc.rov (null): */

/* Content from xdc.runtime (null): */

/* Content from ti.targets.rts6000 (null): */

/* Content from ti.sysbios.interfaces (null): */

/* Content from ti.sysbios.family (null): */

/* Content from ti.sysbios (null): */

/* Content from xdc.services.getset (null): */

/* Content from ti.sysbios.hal (null): */

/* Content from ti.sysbios.knl (null): */

/* Content from ti.sysbios.family.c66 (null): */

/* Content from ti.sysbios.family.c64p (null): */

/* Content from ti.sysbios.gates (null): */

/* Content from ti.sysbios.heaps (null): */

/* Content from xdc.runtime.knl (null): */

/* Content from ti.sdo.ipc.interfaces (null): */

/* Content from ti.sysbios.syncs (null): */

/* Content from ti.sdo.ipc.family (null): */

/* Content from ti.sdo.utils (null): */

/* Content from ti.sysbios.utils (null): */

/* Content from ti.sysbios.xdcruntime (null): */

/* Content from ti.sysbios.family.c62 (null): */

/* Content from ti.sysbios.timers.timer64 (null): */

/* Content from ti.sysbios.family.c64p.tci6488 (null): */

/* Content from ti.catalog.c6000 (null): */

/* Content from ti.catalog (null): */

/* Content from ti.catalog.peripherals.hdvicp2 (null): */

/* Content from xdc.platform (null): */

/* Content from xdc.cfg (null): */

/* Content from ti.platforms.generic (null): */

/* Content from demos.image_processing.ipc.evmc6678l.platform (null): */

/* Content from ti.sdo.ipc.heaps (null): */

/* Content from ti.sdo.ipc (ti/sdo/ipc/linkcmd.xdt): */

SECTIONS
{
    ti.sdo.ipc.SharedRegion_0:  { . += 0x200000;} run > 0xc200000, type = NOLOAD
}


/* Content from ti.sdo.ipc.family.c647x (null): */

/* Content from ti.sdo.ipc.notifyDrivers (null): */

/* Content from ti.sdo.ipc.transports (null): */

/* Content from ti.sdo.ipc.nsremote (null): */

/* Content from ti.sdo.ipc.gates (null): */

/* Content from configPkg (null): */


/*
 * symbolic aliases for static instance objects
 */
xdc_runtime_Startup__EXECFXN__C = 1;
xdc_runtime_Startup__RESETFXN__C = 1;
TSK_idle = ti_sysbios_knl_Task_Object__table__V + 0;

SECTIONS
{
    .text: load >> MSMCSRAM_SLAVE
    .ti.decompress: load > L2SRAM
    .stack: load > L2SRAM
    GROUP: load > L2SRAM
    {
        .bss:
        .neardata:
        .rodata:
    }
    .cinit: load > MSMCSRAM_SLAVE
    .pinit: load >> L2SRAM
    .init_array: load > L2SRAM
    .const: load >> MSMCSRAM_SLAVE
    .data: load >> L2SRAM
    .fardata: load >> L2SRAM
    .switch: load >> MSMCSRAM_SLAVE align = 0x8
    .sysmem: load > L2SRAM
    .far: load >> L2SRAM
    .args: load > L2SRAM align = 0x4, fill = 0 {_argsize = 0x0; }
    .cio: load >> L2SRAM align = 0x8
    .ti.handler_table: load > L2SRAM
    .vecs: load >> MSMCSRAM_SLAVE align = 0x400
    systemHeap: load >> L2SRAM
    .code: load >> L2SRAM
    .defaultStackSection: load >> L2SRAM
    .plt: load >> L2SRAM
    xdc.meta: load >> MSMCSRAM_SLAVE, type = COPY

}
