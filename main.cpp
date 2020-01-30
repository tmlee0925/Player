#include <QApplication>

#ifdef GST_USE
#include <QGst/Init>
#endif

#include <stdio.h>


void main_usage(void)
{
    printf("SMRT7CTM\n");
    printf("SMRT7CTM -v  : Print Version Information\n");
}

int main(int argc, char **argv)
{
    if (argc > 1)
    {
        printf("argv %s\n", argv[0]);
        main_usage();
        return 0;
    }

    printf("main start\n");
/*
    // Dev 생성 및 초기화
    SMRTCTM *pCTMDev = new SMRTCTM();

	uint32_t devid = DEVID_CTM;
	CCTMEnv	*pAppEnv = new CCTMEnv( pCTMDev, _T( "SMRT7CTM.ini" ) );	//	CCTMEnv 생성

	// Dev 생성 전에 ENV 생성 및 초기화.
	pAppEnv->Init( devid );

    //#define OM_MONITORING_USE
    #ifdef OM_MONITORING_USE
        pCTMDev->setOperMode(ISMRTDev::OM_MONITORING);
        pCTMDev->setMonIP(inet_addr( "10.128.0.209" ));
    #elif defined OM_EMULATING_USE
        pCTMDev->setOperMode(ISMRTDev::OM_EMULATING);
    else
        pCTMDev->setOperMode(ISMRTDev::OM_NORMAL);
    #endif

    //printf("%s %d\n", __FUNCTION__, __LINE__);
    pCTMDev->InitDev(devid, pAppEnv, (ISMRTDev *)NULL);


	uint32_t ulIP = 0;
	
	for (int i = 0; i < 20; i++)
	{
		ulIP = pAppEnv->getCamIdx2IPAddr(i);
		pSMRTPingMgr->new_Target(inet_ntoa(*(in_addr *)&ulIP), &pAppEnv->pingResult[i]);
		
	}
#define _MAX_PATH 260	
	TCHAR buff[_MAX_PATH] = { 0, };
#ifdef WIN32

	GetCurrentDirectory(_MAX_PATH, buff);
#else
	getcwd(buff, _MAX_PATH);
#endif

	_tprintf(_T("current working dir %s\n"), buff);

    pCTMDev->Run();		// for QT App
    printf("main end\n");
	
	
	
	//delete 네트워크 인스턴스	



	delete pCTMDev;

	delete pAppEnv;		//	CCTMEnv 소멸자 호출되면서 ini 파일에 변수 자동저장.
    */
}


