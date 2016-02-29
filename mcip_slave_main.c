#include <c6x.h>
#include <stdio.h>
#include <xdc/std.h>
#include <xdc/runtime/IHeap.h>
#include <ti/ipc/Ipc.h>
#include <ti/ipc/HeapBufMP.h>
#include <ti/sysbios/BIOS.h>
#include <ti/ipc/MultiProc.h>
#include <ti/sysbios/knl/Task.h>

#include "mcip_common.h"

int coreId = 0;

void SlaveDaemon(void);

void SlaveN_Task(proc_msg_t* pMsg);

int main()
{
	coreId = DNUM;

    MultiProc_setLocalId((UInt16)coreId);

	Task_Params task_params;
	Task_Params_init(&task_params);
	task_params.priority = 5;

	Task_create((ti_sysbios_knl_Task_FuncPtr)SlaveDaemon, &task_params, NULL);

    Ipc_start();
	BIOS_start ();
}

void SlaveDaemon(void)
{
    HeapBufMP_Handle heapHandle = NULL;
    int status = -1;

    while(status<0)
    {
    	Task_sleep(1);
        status = HeapBufMP_open(MCIP_HEAP_NAME, &heapHandle);
    }

    MessageQ_registerHeap((IHeap_Handle)heapHandle, MCIP_HEAP_ID);

    MessageQ_Handle hSlaveQueue = MessageQ_create(SLAVE_MSGQ_NAMES[coreId], NULL);

	proc_msg_t* pMsg = NULL;
    MessageQ_QueueId queueId;

	int rc = 0;

	while(rc>=0)
	{
		MessageQ_get(hSlaveQueue, (MessageQ_MsgHeader**)&pMsg, MessageQ_FOREVER);

		SlaveN_Task(pMsg);

		MessageQ_open(MASTER_MSGQ_NAME,&queueId);
        MessageQ_put(queueId, (MessageQ_MsgHeader*)pMsg);
	}

    MessageQ_delete(&hSlaveQueue);
}

void SlaveN_Task(proc_msg_t* pMsg)
{
	int width = pMsg->info.width;
	int height = pMsg->info.height;

	int hx = height/NUM_OF_CORES;

	int h0 = height - hx*(NUM_OF_CORES-coreId);
	int h1 = h0+hx;

	byte* src = pMsg->memr.recvBuf;
	byte* dst = pMsg->memr.sendBuf;

	int i,v;
	int k0 = h0*width;
	int k1 = h1*width;

	for(i=k0;i<k1;++i)
	{
		v=src[i]+64;
		dst[i]=v>255?(byte)255:(byte)v;
	}
}

// EOF
