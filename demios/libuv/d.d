module deimos.libuv.d;

package import deimos.libuv.uv;

package import core.stdc.stdio : FILE ;
package import core.stdc.stdint;

version(Posix) {
	public import core.sys.posix.netdb : addrinfo, sockaddr, sockaddr_storage, sockaddr_in, sockaddr_in6;
	package import core.sys.posix.sys.types;
	package import core.sys.posix.termios ;
	package import core.sys.posix.dirent : dirent ;
	package import core.sys.posix.semaphore : sem_t ;
    version (X86) {
		// @fixme druntime pthread_rwlock_t size is 36, linux is 32
		struct pthread_rwlock_t {
			byte[32] __size;
		}
	}
}

version(Windows) {
	enum isWindowsOS	= true ;
	enum isMSVC2008 	= true ;
	public import core.sys.windows.winsock2 : addrinfo, sockaddr, sockaddr_in, sockaddr_in6;
	package import core.sys.windows.basetyps;
} else {
	enum isWindowsOS	= false ;
	enum isMSVC2008 	= false ;
}

version(linux) {
	enum isLinuxOS	= true ;	
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


package :

enum isDtUnknow = true ;
enum isGnuC	= false ;
enum isEHOSTDOWN = false ;

struct RB_ENTRY(T){ 
	T*	rbe_left;
	T*	rbe_right;
	T*	rbe_parent;
	int rbe_color; 
}

template RB_HEAD(name, type) {
	struct name {
		type* rbh_root;
	};
}
