module deimos.libuv._d;

package import deimos.libuv.uv;
package import deimos.libuv.uv_errno;

package import core.stdc.stdio;
package import core.stdc.stdint;

version(Posix) {
	public import core.sys.posix.netdb : addrinfo, sockaddr, sockaddr_storage, sockaddr_in, sockaddr_in6;
	public import core.sys.posix.netinet.in_ : IPPROTO_TCP, IPPROTO_UDP;
	public import core.sys.posix.sys.socket : AF_INET, AF_INET6, SOCK_STREAM;
	package import core.sys.posix.sys.types;
	package import core.sys.posix.termios;
	package import core.sys.posix.dirent : dirent;
	package import core.sys.posix.semaphore : sem_t;
	package import core.sys.posix.net.if_ : IF_NAMESIZE ;
	const UV_IF_NAMESIZE = IF_NAMESIZE + 1 ;
} else {
	const UV_IF_NAMESIZE = 16 + 1 ;
}

version(Windows) {
	enum isWindowsOS	= true ;
	enum isMSVC2008 	= true ;
	public import core.sys.windows.winsock2 : addrinfo, sockaddr, sockaddr_in, sockaddr_in6,  AF_INET, AF_INET6, SOCK_STREAM, IPPROTO_TCP;
	package import core.sys.windows.basetyps;
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
	package import core.sys.osx.mach.semaphore;
} else {
	enum isMacOS	= false ;
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
} else {
	enum isAndroidOS	= false ;
}

enum isOS390 = false ;


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
			alias ExternC = extern(Windows) R function(P) ;
		}
	}
}
