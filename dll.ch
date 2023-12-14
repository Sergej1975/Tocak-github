//////////////////////////////////////////////////////////////////////
//
//  DLL.CH
//
//  Copyright:
//       Alaska Software, (c) 1998-2009. Alle Rechte vorbehalten.         
//  
//  Inhalt:
//       Konstanten fÅr DLL-Aufrufkonventionen
//       Befehl, um Fremd-DLLs dynamisch zu laden und Funktionen daraus
//       aufzurufen
//   
//////////////////////////////////////////////////////////////////////

// Dll.ch ist nicht eingebunden
#ifndef  _DLL_CH

// Konstanten der Aufrufkonventionen
#define  DLL_SYSTEM               4
#define  DLL_CDECL                8
#define  DLL_STDCALL             32
#define  DLL_XPPCALL            128

#ifdef   __OS2__
  #define DLL_OSAPI             DLL_SYSTEM
#else
  #define DLL_OSAPI             DLL_STDCALL
#endif

// Konstanten fÅr Aufrufmodus
#define  DLL_CALLMODE_NORMAL    0x0000
#define  DLL_CALLMODE_COPY      0x2000


// DllInfo() Konstanten
#define DLL_INFO_HANDLE         1
#define DLL_INFO_NAME           2
#define DLL_INFO_PATHNAME       3
#define DLL_INFO_LOADED         4
#define DLL_INFO_TYPE           5
#define DLL_INFO_LIST           6
#define DLL_INFO_PREFIX         7
#define DLL_INFO_UNLOADABLE     8
#define DLL_INFO_USAGELIST      9
#define DLL_INFO_FUNCLIST      10
#define DLL_INFO_CLASSFUNCLIST 11
#define DLL_INFO_IMPORTS       12
#define DLL_TYPE_UNKNOWN        0
#define DLL_TYPE_GENERAL        1
#define DLL_TYPE_XPP_STATIC     2
#define DLL_TYPE_XPP_DYNAMIC    3
#define DLL_TYPE_XPP_DYNAMIC_NOUNLOAD 4

#ifdef  __XPP__                   

// Das DLLFUNCTION Kommando
#command  DLLFUNCTION <Func>([<x,...>]) ;
                USING <sys:CDECL,OSAPI,STDCALL,SYSTEM> ;
                 FROM <(Dll)> ;
       => ;
             FUNCTION <Func>([<x>]);;
                LOCAL nDll:=DllLoad(<(Dll)>);;
                LOCAL xRet:=DllCall(nDll,__Sys(<sys>),<(Func)>[,<x>]);;
                      DllUnLoad(nDll);;
               RETURN xRet

#command  STATIC DLLFUNCTION <Func>([<x,...>]) ;
                USING <sys:CDECL,OSAPI,STDCALL,SYSTEM> ;
                 FROM <(Dll)> ;
       => ;
             STATIC FUNCTION <Func>([<x>]);;
                LOCAL nDll:=DllLoad(<(Dll)>);;
                LOCAL xRet:=DllCall(nDll,__Sys(<sys>),<(Func)>[,<x>]);;
                      DllUnLoad(nDll);;
               RETURN xRet

#xtrans __Sys( CDECL )     =>   DLL_CDECL  
#xtrans __Sys( OSAPI )     =>   DLL_OSAPI  
#xtrans __Sys( STDCALL )   =>   DLL_STDCALL
#xtrans __Sys( SYSTEM )    =>   DLL_SYSTEM 


#xcommand FUNCTION <Func>([<x1,...>] @ [<x2,...>]) ;
       => FUNCTION <Func>([<x1>][<x2>])

#xcommand STATIC FUNCTION <Func>([<x1,...>] @ [<x2,...>]) ;
       => STATIC FUNCTION <Func>([<x1>][<x2>])

#endif // __XPP__

// Konstanten der LoadResource() Funktion - Resource-Typ
#define RES_STRING               6
#define RES_VERSION             16
#define RES_RAWSTRING         1006
#define RES_VERSIONFIXED      1016

// Konstanten der LoadResource() Funktion - Version
#define RES_VERSION_KEY          1
#define RES_VERSION_VALUE        2

#define RES_PRODVER_LS           1
#define RES_PRODVER_MS           2
#define RES_FILEVER_LS           3
#define RES_FILEVER_MS           4
#define RES_FILETIME_LS          5
#define RES_FILETIME_MS          6

// einige vordefinierte Modul-Handles
#define XPP_MOD_EXE      0
#define XPP_MOD_NLS      0xFFFFFFFF
#define XPP_MOD_RT1      0xFFFFFFFE
#define XPP_MOD_UI1      0xFFFFFFFD
#define XPP_MOD_UI2      0xFFFFFFFC

#define _DLL_CH
#endif 


