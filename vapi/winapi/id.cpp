
#include <windows.h>
#include <tlhelp32.h>

namespace winapi{
	DWORD get_ppid(DWORD pid);
	DWORD enum_tid(DWORD pid,bool enum_func(DWORD tid,LPARAM lp),LPARAM lp);

}

//get parent `pid`
DWORD winapi::get_ppid(DWORD pid) {
	DWORD ppid = 0;

	//进程快照
	HANDLE hSnapshot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, pid);
	PROCESSENTRY32 pe = {.dwSize = sizeof(pe)};

	if (hSnapshot == INVALID_HANDLE_VALUE) return 0;

	//获取头
	if (Process32First(hSnapshot, &pe))   return 0;

	do {
		//访问,到`pid`的快照
		if (pe.th32ProcessID == pid) {
			ppid = pe.th32ParentProcessID;
			break;
		}
	}while(Process32Next(hSnapshot, &pe));

	CloseHandle(hSnapshot);

	return ppid;
}


//枚举`pid`的`tids`,每次用`func`处理`tid`,枚举不到返回0
//`enum_func`返回false停止,true继续
DWORD winapi::enum_tid(DWORD pid,bool enum_func(DWORD tid,LPARAM lp),LPARAM lp){

	//线程快照
	HANDLE hThreadSnap = CreateToolhelp32Snapshot(TH32CS_SNAPTHREAD, pid);
	THREADENTRY32 te ={.dwSize = sizeof(te)};

	if (hThreadSnap == INVALID_HANDLE_VALUE) return 0;

	//获取头
	if (Thread32First(hThreadSnap, &te))     return 0;

	//访问
	while(te.th32OwnerProcessID == pid){
		if (enum_func(te.th32ThreadID,lp) == 0) break;

		//获取
		if (Thread32Next(hThreadSnap, &te)) break;
	}

	return 1;
}


