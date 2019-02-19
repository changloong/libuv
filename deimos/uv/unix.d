module deimos.uv.unix;
public import deimos.uv._d;
version(Posix):
extern(C):
pure:
nothrow:
@nogc:
/* Copyright Joyent, Inc. and other Node contributors. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 */
/* UV_UNIX_H */
/* include(sys/types.h); */
/* include(sys/stat.h); */
/* include(fcntl.h); */
/* include(dirent.h); */
/* include(sys/socket.h); */
/* include(netinet/in.h); */
/* include(netinet/tcp.h); */
/* include(arpa/inet.h); */
/* include(netdb.h); */
/* MAXHOSTNAMELEN on Solaris */
/* include(termios.h); */
/* include(pwd.h); */
static if( isOS390 ) {
	/* include(semaphore.h); */
	/* include(sys/param.h); */
	/* MAXHOSTNAMELEN on Linux and the BSDs */
}
/* include(pthread.h); */
/* include(signal.h); */
package import deimos.uv.threadpool; /* include(uv/threadpool.h); */ 
static if( isLinuxOS ) {
	package import deimos.uv.linux; /* include(uv/linux.h); */ 
} else static if( isOS390 ) {
	package import deimos.uv.os390; /* include(uv/os390.h); */ 
} else static if( isOS400 ) {
	package import deimos.uv.posix; /* include(uv/posix.h); */ 
} else static if( isAixOS ) {
	package import deimos.uv.aix; /* include(uv/aix.h); */ 
} else static if( isSunOS ) {
	package import deimos.uv.sunos; /* include(uv/sunos.h); */ 
} else static if( isMacOS ) {
	package import deimos.uv.darwin; /* include(uv/darwin.h); */ 
} else static if( isBsdOS ) {
	package import deimos.uv.bsd; /* include(uv/bsd.h); */ 
} else static if( isCygWin ) {
	package import deimos.uv.posix; /* include(uv/posix.h); */ 
}
enum NI_MAXHOST = 1025;
enum NI_MAXSERV = 32;
static if( isLinuxOS  || isAixOS || isSunOS ) {
	template UV_IO_PRIVATE_PLATFORM_FIELDS() {};
}
alias uv__io_cb = ExternC!(void function(uv_loop_s* loop, uv__io_s* w, uint events));
alias uv__io_t = uv__io_s ;
struct uv__io_s {
	uv__io_cb cb;
	void*[2] pending_queue;
	void*[2] watcher_queue;
	uint pevents;
	/* Pending event mask i.e. mask at next tick. */
	uint events;
	/* Current event mask. */
	int fd;
	mixin UV_IO_PRIVATE_PLATFORM_FIELDS;
};
static if( !isMacOS ) {
	alias UV_PLATFORM_SEM_T = sem_t;
}
static if( isBsdOS ) {
	template UV_PLATFORM_LOOP_FIELDS() {};
}
static if( !isMacOS ) {
	template UV_STREAM_PRIVATE_PLATFORM_FIELDS() {};
}
/* Note: May be cast to struct iovec. See writev(2). */
struct uv_buf_t {
	char* base;
	size_t len;
};
alias uv_file = int ;
alias uv_os_sock_t = int ;
alias uv_os_fd_t = int ;
alias uv_pid_t = pid_t ;
alias uv_once_t = pthread_once_t ;
alias uv_thread_t = pthread_t ;
alias uv_mutex_t = pthread_mutex_t ;
alias uv_rwlock_t = pthread_rwlock_t ;
alias uv_sem_t = UV_PLATFORM_SEM_T ;
alias uv_cond_t = pthread_cond_t ;
alias uv_key_t = pthread_key_t ;
/* Note: guard clauses should match uv_barrier_init's in src/unix/thread.c. */
static if( isAixOS ) {
	/* TODO(bnoordhuis) Merge into uv_barrier_t in v2. */
	struct _uv_barrier {
		uv_mutex_t mutex;
		uv_cond_t cond;
		uint threshold;
		uint in_;
		uint out_;
	};
	struct uv_barrier_t {
		_uv_barrier* b;
		static if( hasPTHREAD_BARRIER ) {
			/* TODO(bnoordhuis) Remove padding in v2. */
			char[pthread_barrier_t.sizeof-(_uv_barrier*).sizeof] pad;
		}
	};
} else {
alias uv_barrier_t = pthread_barrier_t ;
}
/* Platform-specific definitions for uv_spawn support. */
alias uv_gid_t = gid_t ;
alias uv_uid_t = uid_t ;
alias uv__dirent_t = dirent ;
static if( isDtUnknow ) {
	template HAVE_DIRENT_TYPES() {};
	enum UV__DT_FILE = -1 ;
	enum UV__DT_DIR = -2 ;
	enum UV__DT_LINK = -3 ;
	enum UV__DT_FIFO = -4 ;
	enum UV__DT_SOCKET = -5 ;
	enum UV__DT_CHAR = -6 ;
	enum UV__DT_BLOCK = -7 ;
}
/* Platform-specific definitions for uv_dlopen support. */
struct uv_lib_t {
	void* handle;
	char* errmsg;
};
template UV_LOOP_PRIVATE_FIELDS() {
	size_t flags;
	int backend_fd;
	void*[2] pending_queue;
	void*[2] watcher_queue;
	uv__io_t** watchers;
	uint nwatchers;
	uint nfds;
	void*[2] wq;
	uv_mutex_t wq_mutex;
	uv_async_t wq_async;
	uv_rwlock_t cloexec_lock;
	uv_handle_t* closing_handles;
	void*[2] process_handles;
	void*[2] prepare_handles;
	void*[2] check_handles;
	void*[2] idle_handles;
	void*[2] async_handles;
	void function() async_unused;
	uv__io_t async_io_watcher;
	int async_wfd;
	struct timer_heap_s {
		void* min;
		uint nelts;
	};
	timer_heap_s timer_heap;
	uint64_t timer_counter;
	uint64_t time;
	int[2] signal_pipefd;
	uv__io_t signal_io_watcher;
	uv_signal_t child_watcher;
	int emfile_fd;
	mixin UV_PLATFORM_LOOP_FIELDS;
}
enum UV_REQ_TYPE_PRIVATE = ``;
template UV_REQ_PRIVATE_FIELDS() {};
template UV_PRIVATE_REQ_TYPES() {};
template UV_WRITE_PRIVATE_FIELDS() {
	void*[2] queue;
	uint write_index;
	uv_buf_t* bufs;
	uint nbufs;
	int error;
	uv_buf_t[4] bufsml;
}
template UV_CONNECT_PRIVATE_FIELDS() {
	void*[2] queue;
}
template UV_SHUTDOWN_PRIVATE_FIELDS() {};
template UV_UDP_SEND_PRIVATE_FIELDS() {
	void*[2] queue;
	sockaddr_storage addr;
	uint nbufs;
	uv_buf_t* bufs;
	ssize_t status;
	uv_udp_send_cb send_cb;
	uv_buf_t[4] bufsml;
}
template UV_HANDLE_PRIVATE_FIELDS() {
	uv_handle_t* next_closing;
	uint flags;
}
template UV_STREAM_PRIVATE_FIELDS() {
	uv_connect_t* connect_req;
	uv_shutdown_t* shutdown_req;
	uv__io_t io_watcher;
	void*[2] write_queue;
	void*[2] write_completed_queue;
	uv_connection_cb connection_cb;
	int delayed_error;
	int accepted_fd;
	void* queued_fds;
	mixin UV_STREAM_PRIVATE_PLATFORM_FIELDS;
}
template UV_TCP_PRIVATE_FIELDS() {};
template UV_UDP_PRIVATE_FIELDS() {
	uv_alloc_cb alloc_cb;
	uv_udp_recv_cb recv_cb;
	uv__io_t io_watcher;
	void*[2] write_queue;
	void*[2] write_completed_queue;
}
template UV_PIPE_PRIVATE_FIELDS() {
	const(char)* pipe_fname;
}
template UV_POLL_PRIVATE_FIELDS() {
	uv__io_t io_watcher;
}
template UV_PREPARE_PRIVATE_FIELDS() {
	uv_prepare_cb prepare_cb;
	void*[2] queue;
}
template UV_CHECK_PRIVATE_FIELDS() {
	uv_check_cb check_cb;
	void*[2] queue;
}
template UV_IDLE_PRIVATE_FIELDS() {
	uv_idle_cb idle_cb;
	void*[2] queue;
}
template UV_ASYNC_PRIVATE_FIELDS() {
	uv_async_cb async_cb;
	void*[2] queue;
	int pending;
}
template UV_TIMER_PRIVATE_FIELDS() {
	uv_timer_cb timer_cb;
	void*[3] heap_node;
	uint64_t timeout;
	uint64_t repeat;
	uint64_t start_id;
}
template UV_GETADDRINFO_PRIVATE_FIELDS() {
	uv__work work_req;
	uv_getaddrinfo_cb cb;
	addrinfo* hints;
	char* hostname;
	char* service;
	addrinfo* addrinfo_;
	int retcode;
}
template UV_GETNAMEINFO_PRIVATE_FIELDS() {
	uv__work work_req;
	uv_getnameinfo_cb getnameinfo_cb;
	sockaddr_storage storage;
	int flags;
	char[NI_MAXHOST] host;
	char[NI_MAXSERV] service;
	int retcode;
}
template UV_PROCESS_PRIVATE_FIELDS() {
	void*[2] queue;
	int status;
}
template UV_FS_PRIVATE_FIELDS() {
	const(char)* new_path;
	uv_file file;
	int flags;
	mode_t mode;
	uint nbufs;
	uv_buf_t* bufs;
	ptrdiff_t off;
	uv_uid_t uid;
	uv_gid_t gid;
	double atime;
	double mtime;
	uv__work work_req;
	uv_buf_t[4] bufsml;
}
template UV_WORK_PRIVATE_FIELDS() {
	uv__work work_req;
}
template UV_TTY_PRIVATE_FIELDS() {
	termios orig_termios;
	int mode;
}
template UV_SIGNAL_PRIVATE_FIELDS() {
	struct tree_entry_s {
		uv_signal_s* rbe_left;
		uv_signal_s* rbe_right;
		uv_signal_s* rbe_parent;
		int rbe_color;
	};
	tree_entry_s tree_entry;
	/* Use two counters here so we don have to fiddle with atomics. */
	uint caught_signals;
	uint dispatched_signals;
}
template UV_FS_EVENT_PRIVATE_FIELDS() {
	uv_fs_event_cb cb;
	mixin UV_PLATFORM_FS_EVENT_FIELDS;
}
/* fs open() flags supported on this platform: */
enum UV_FS_O_APPEND = 0 ;
enum UV_FS_O_CREAT = 0 ;
enum UV_FS_O_DIRECT = 0 ;
enum UV_FS_O_DIRECTORY = 0 ;
enum UV_FS_O_DSYNC = 0 ;
enum UV_FS_O_EXCL = 0 ;
enum UV_FS_O_EXLOCK = 0 ;
enum UV_FS_O_NOATIME = 0 ;
enum UV_FS_O_NOCTTY = 0 ;
enum UV_FS_O_NOFOLLOW = 0 ;
enum UV_FS_O_NONBLOCK = 0 ;
enum UV_FS_O_RDONLY = 0 ;
enum UV_FS_O_RDWR = 0 ;
enum UV_FS_O_SYMLINK = 0 ;
enum UV_FS_O_SYNC = 0 ;
enum UV_FS_O_TRUNC = 0 ;
enum UV_FS_O_WRONLY = 0 ;
/* fs open() flags supported on other platforms: */
enum UV_FS_O_RANDOM = 0 ;
enum UV_FS_O_SHORT_LIVED = 0 ;
enum UV_FS_O_SEQUENTIAL = 0 ;
enum UV_FS_O_TEMPORARY = 0 ;
