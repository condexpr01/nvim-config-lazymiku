
#include <cstdio>
#include <fstream>
#include <utility>
#include <windows.h>

namespace winapi{
	void enum_all_window_name(void);
	BOOL enum_window_proc(HWND h,LPARAM p);
	BOOL enum_child_window_proc(HWND h,LPARAM p);
}

BOOL winapi::enum_child_window_proc(HWND h,LPARAM p){
	if (h == nullptr){
		return false;
	}

	wchar_t title[4096];
	GetWindowTextW(h,title,sizeof(title));

	if (title[0] != L'\0'){
		*reinterpret_cast<std::wfstream*>(p) << L"sub: " << title << std::endl;
	}

	return true;
}



BOOL winapi::enum_window_proc(HWND h,LPARAM p){

	if (h == nullptr){
		return false;
	}


	wchar_t title[4096];
	GetWindowTextW(h,title,sizeof(title));

	EnumChildWindows(h, enum_child_window_proc, p);

	if (title[0] != L'\0'){
		*reinterpret_cast<std::wfstream*>(p) << title << std::endl;
	}

	return true;
}

void winapi::enum_all_window_name(void){
	std::wfstream p;
	p.open("windows_list.txt",std::ios::out);

	EnumWindows(enum_window_proc, (LPARAM)&p);
}





