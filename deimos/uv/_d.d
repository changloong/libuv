module deimos.uv._d;

package import core.stdc.stdint;

version(Posix) {
	private import core.sys.posix.config;
	public import core.sys.posix.netdb : addrinfo, sockaddr, sockaddr_storage, sockaddr_in, sockaddr_in6;
	public import core.sys.posix.netinet.in_ : IPPROTO_TCP, IPPROTO_UDP;
	public import core.sys.posix.sys.socket : AF_INET, AF_INET6, SOCK_STREAM;
	package import core.sys.posix.sys.types;
	package import core.sys.posix.termios;
	package import core.sys.posix.dirent : dirent;
	package import core.sys.posix.semaphore : sem_t;
	version( CRuntime_Musl ) {
		struct pthread_barrier_t { 
			void*[4] __p;
		} 
    	alias ubyte cc_t;
    	alias uint  speed_t;   
    	alias uint  tcflag_t;  
		const NCCS = 32 ;
		struct termios {
        		tcflag_t c_iflag;
        		tcflag_t c_oflag;
        		tcflag_t c_cflag;
        		tcflag_t c_lflag;
        		cc_t 	c_line;
        		cc_t[NCCS] 	c_cc;
        		speed_t __c_ispeed;
        		speed_t __c_ospeed;
		};
	} else {
		package import core.sys.posix.net.if_ : IF_NAMESIZE ;
		const UV_IF_NAMESIZE = IF_NAMESIZE + 1 ;
	}
} else {
	const UV_IF_NAMESIZE = 16 + 1 ;
}

version(Windows) {
	enum isWindowsOS	= true ;
	enum isMSVC2008 	= true ;
	public import core.sys.windows.winsock2 : addrinfo, sockaddr, sockaddr_in, sockaddr_in6,  AF_INET, AF_INET6, SOCK_STREAM, IPPROTO_TCP;
	package import core.sys.windows.mswsock : LPTRANSMIT_FILE_BUFFERS, LPWSABUF ;
	package import core.sys.windows.wincon ;
	package import 
			core.stdc.stdio,
			core.sys.windows.basetyps, 	// GUID
			core.sys.windows.basetsd, 
			core.sys.windows.winnt,	  // BOOL, PVOID, DWORD, LPINT
			core.sys.windows.winsock2,	// SOCKET	
			core.sys.windows.winbase;	// CRITICAL_SECTION
	package enum {
		_O_RANDOM  = 0x0010 ,
		_O_SEQUENTIAL = 0x0020 ,
		_O_TEMPORARY = 0x0040 ,
		_O_SHORT_LIVED = 0x1000 ,
	};
	package enum {
		UV_DIRENT_UNKNOWN,
		UV_DIRENT_FILE,
		UV_DIRENT_DIR,
		UV_DIRENT_LINK,
		UV_DIRENT_FIFO,
		UV_DIRENT_SOCKET,
		UV_DIRENT_CHAR,
		UV_DIRENT_BLOCK
	};
	alias sockaddr_storage = SOCKADDR_STORAGE ;
	static if( size_t.sizeof == 8 )
	    	alias ssize_t = long;
    	else
    		alias ssize_t = int;
	struct addrinfoW {
		int              ai_flags;
		int              ai_family;
		int              ai_socktype;
		int              ai_protocol;
		size_t           ai_addrlen;
		PWSTR            ai_canonname;
		sockaddr  *ai_addr;
		addrinfoW  *ai_next;
    } ;
    alias ADDRINFOW = addrinfoW;
    alias PADDRINFOW = ADDRINFOW*;
    struct WSABUF {
        ULONG len;
        CHAR* buf;
    }
} else {
	enum isWindowsOS	= false ;
	enum isMSVC2008 	= false ;
}

enum isCygWin = false ;
enum isMSYS	= false ;

version(linux) {
	enum isLinuxOS	= true ;
	version (X86) {
		// @fixme druntime pthread_rwlock_t size is (36, 64), linux is (32, 56)
		struct pthread_rwlock_t {
			byte[32] __size;
		}
	} else {
		struct pthread_rwlock_t {
			byte[56] __size;
		}
	}
} else {
	enum isLinuxOS	= false ;
}

version(OSX) {
	enum isMacOS	= true ;
	enum hasPTHREAD_BARRIER = false ;
	package import core.sys.osx.mach.semaphore;
	struct pthread_barrier_t {
		void* data;
	}
} else {
	enum isMacOS	= false ;
	enum hasPTHREAD_BARRIER = true ;
}

version(Solaris) {
	enum isSunOS	= true ;
} else {
	enum isSunOS	= false ;
}

version(FreeBSD) {
	enum isBsdOS	= true ;
} else {
	enum isBsdOS	= false ;
}

version(AIXOS) {
	enum isAixOS	= true ;
} else {
	enum isAixOS	= false ;
}

version(Android) {
	enum isAndroidOS	= true ;
	enum EFTYPE = 79;
	alias ifa_dstaddr	= sockaddr*;
	private {
		alias ubyte cc_t;
		alias uint  speed_t;
		alias uint  tcflag_t;
		enum NCCS   = 8;
	}
	struct termios {
		tcflag_t   c_iflag;
		tcflag_t   c_oflag;
		tcflag_t   c_cflag;
		tcflag_t   c_lflag;
		cc_t       c_line;
		cc_t[NCCS] c_cc;
		speed_t    c_ispeed;
		speed_t    c_ospeed;
	}
} else {
	enum isAndroidOS	= false ;
}

enum isOS390 = false ;
enum isOS400 = false ;


package:

enum isDtUnknow = true ;
enum isGnuC	= false ;
version(linux) {
	enum isEHOSTDOWN = true ;
} else {
	enum isEHOSTDOWN = false ;
}

struct RB_ENTRY(T) { 
	T*	rbe_left;
	T*	rbe_right;
	T*	rbe_parent;
	int rbe_color; 
}

struct RB_HEAD(T) {
	T* rbh_root;
}

template ExternC(T) if (is(typeof(*(T.init)) P == function)) {
	static if (is(typeof(*(T.init)) R == return)) {
		static if (is(typeof(*(T.init)) P == function)) {
			alias ExternC = extern(C) R function(P) ;
		}
	}
}

template ExternWindows(T) if (is(typeof(*(T.init)) P == function)) {
	static if (is(typeof(*(T.init)) R == return)) {
		static if (is(typeof(*(T.init)) P == function)) {
			alias ExternWindows = extern(Windows) R function(P) ;
		}
	}
}

import  deimos.uv : uv_loop_s;
