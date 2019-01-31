module deimos.uv;
public import deimos.uv._d;
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
/* See https://github.com/libuv/libuv#documentation for documentation. */
/* UV_H */
static if( isWindowsOS ) {
	/* Windows - set up dll import/export decorators. */
	/* Building shared library. */
	/* Building static library. */
} else static if( isGnuC ) {
} else {
}
package import deimos.uv.errno; /* include(uv/errno.h); */ 
/* include(uv/version.h); */
public import core.stdc.stdint; /* include(stddef.h); */ 
public import core.stdc.stdio; /* include(stdio.h); */ 
static if( isWindowsOS ) {
	package import deimos.uv.win; /* include(uv/win.h); */ 
} else {
	package import deimos.uv.unix; /* include(uv/unix.h); */ 
}
/* Expand this list if necessary. */
enum uv_errno_t {
	UV_E2BIG = UV__E2BIG ,
	UV_EACCES = UV__EACCES ,
	UV_EADDRINUSE = UV__EADDRINUSE ,
	UV_EADDRNOTAVAIL = UV__EADDRNOTAVAIL ,
	UV_EAFNOSUPPORT = UV__EAFNOSUPPORT ,
	UV_EAGAIN = UV__EAGAIN ,
	UV_EAI_ADDRFAMILY = UV__EAI_ADDRFAMILY ,
	UV_EAI_AGAIN = UV__EAI_AGAIN ,
	UV_EAI_BADFLAGS = UV__EAI_BADFLAGS ,
	UV_EAI_BADHINTS = UV__EAI_BADHINTS ,
	UV_EAI_CANCELED = UV__EAI_CANCELED ,
	UV_EAI_FAIL = UV__EAI_FAIL ,
	UV_EAI_FAMILY = UV__EAI_FAMILY ,
	UV_EAI_MEMORY = UV__EAI_MEMORY ,
	UV_EAI_NODATA = UV__EAI_NODATA ,
	UV_EAI_NONAME = UV__EAI_NONAME ,
	UV_EAI_OVERFLOW = UV__EAI_OVERFLOW ,
	UV_EAI_PROTOCOL = UV__EAI_PROTOCOL ,
	UV_EAI_SERVICE = UV__EAI_SERVICE ,
	UV_EAI_SOCKTYPE = UV__EAI_SOCKTYPE ,
	UV_EALREADY = UV__EALREADY ,
	UV_EBADF = UV__EBADF ,
	UV_EBUSY = UV__EBUSY ,
	UV_ECANCELED = UV__ECANCELED ,
	UV_ECHARSET = UV__ECHARSET ,
	UV_ECONNABORTED = UV__ECONNABORTED ,
	UV_ECONNREFUSED = UV__ECONNREFUSED ,
	UV_ECONNRESET = UV__ECONNRESET ,
	UV_EDESTADDRREQ = UV__EDESTADDRREQ ,
	UV_EEXIST = UV__EEXIST ,
	UV_EFAULT = UV__EFAULT ,
	UV_EFBIG = UV__EFBIG ,
	UV_EHOSTUNREACH = UV__EHOSTUNREACH ,
	UV_EINTR = UV__EINTR ,
	UV_EINVAL = UV__EINVAL ,
	UV_EIO = UV__EIO ,
	UV_EISCONN = UV__EISCONN ,
	UV_EISDIR = UV__EISDIR ,
	UV_ELOOP = UV__ELOOP ,
	UV_EMFILE = UV__EMFILE ,
	UV_EMSGSIZE = UV__EMSGSIZE ,
	UV_ENAMETOOLONG = UV__ENAMETOOLONG ,
	UV_ENETDOWN = UV__ENETDOWN ,
	UV_ENETUNREACH = UV__ENETUNREACH ,
	UV_ENFILE = UV__ENFILE ,
	UV_ENOBUFS = UV__ENOBUFS ,
	UV_ENODEV = UV__ENODEV ,
	UV_ENOENT = UV__ENOENT ,
	UV_ENOMEM = UV__ENOMEM ,
	UV_ENONET = UV__ENONET ,
	UV_ENOPROTOOPT = UV__ENOPROTOOPT ,
	UV_ENOSPC = UV__ENOSPC ,
	UV_ENOSYS = UV__ENOSYS ,
	UV_ENOTCONN = UV__ENOTCONN ,
	UV_ENOTDIR = UV__ENOTDIR ,
	UV_ENOTEMPTY = UV__ENOTEMPTY ,
	UV_ENOTSOCK = UV__ENOTSOCK ,
	UV_ENOTSUP = UV__ENOTSUP ,
	UV_EPERM = UV__EPERM ,
	UV_EPIPE = UV__EPIPE ,
	UV_EPROTO = UV__EPROTO ,
	UV_EPROTONOSUPPORT = UV__EPROTONOSUPPORT ,
	UV_EPROTOTYPE = UV__EPROTOTYPE ,
	UV_ERANGE = UV__ERANGE ,
	UV_EROFS = UV__EROFS ,
	UV_ESHUTDOWN = UV__ESHUTDOWN ,
	UV_ESPIPE = UV__ESPIPE ,
	UV_ESRCH = UV__ESRCH ,
	UV_ETIMEDOUT = UV__ETIMEDOUT ,
	UV_ETXTBSY = UV__ETXTBSY ,
	UV_EXDEV = UV__EXDEV ,
	UV_UNKNOWN = UV__UNKNOWN ,
	UV_EOF = UV__EOF ,
	UV_ENXIO = UV__ENXIO ,
	UV_EMLINK = UV__EMLINK ,
	UV_EHOSTDOWN = UV__EHOSTDOWN ,
	UV_EREMOTEIO = UV__EREMOTEIO ,
	UV_ENOTTY = UV__ENOTTY ,
	UV_EFTYPE = UV__EFTYPE ,
	UV_ERRNO_MAX = UV__EOF - 1
};
enum uv_handle_type {
	UV_UNKNOWN_HANDLE = 0 ,
	UV_ASYNC ,
	UV_CHECK ,
	UV_FS_EVENT ,
	UV_FS_POLL ,
	UV_HANDLE ,
	UV_IDLE ,
	UV_NAMED_PIPE ,
	UV_POLL ,
	UV_PREPARE ,
	UV_PROCESS ,
	UV_STREAM ,
	UV_TCP ,
	UV_TIMER ,
	UV_TTY ,
	UV_UDP ,
	UV_SIGNAL ,
	UV_FILE,
	UV_HANDLE_TYPE_MAX
};
mixin( `enum uv_req_type {
	UV_UNKNOWN_REQ = 0 ,
	UV_REQ ,
	UV_CONNECT ,
	UV_WRITE ,
	UV_SHUTDOWN ,
	UV_UDP_SEND ,
	UV_FS ,
	UV_WORK ,
	UV_GETADDRINFO ,
	UV_GETNAMEINFO ,
	` ~ UV_REQ_TYPE_PRIVATE ~ ` 
	UV_REQ_TYPE_MAX
};` ) ; 
/* Handle types. */
alias uv_loop_t = uv_loop_s ;
alias uv_handle_t = uv_handle_s ;
alias uv_stream_t = uv_stream_s ;
alias uv_tcp_t = uv_tcp_s ;
alias uv_udp_t = uv_udp_s ;
alias uv_pipe_t = uv_pipe_s ;
alias uv_tty_t = uv_tty_s ;
alias uv_poll_t = uv_poll_s ;
alias uv_timer_t = uv_timer_s ;
alias uv_prepare_t = uv_prepare_s ;
alias uv_check_t = uv_check_s ;
alias uv_idle_t = uv_idle_s ;
alias uv_async_t = uv_async_s ;
alias uv_process_t = uv_process_s ;
alias uv_fs_event_t = uv_fs_event_s ;
alias uv_fs_poll_t = uv_fs_poll_s ;
alias uv_signal_t = uv_signal_s ;
/* Request types. */
alias uv_req_t = uv_req_s ;
alias uv_getaddrinfo_t = uv_getaddrinfo_s ;
alias uv_getnameinfo_t = uv_getnameinfo_s ;
alias uv_shutdown_t = uv_shutdown_s ;
alias uv_write_t = uv_write_s ;
alias uv_connect_t = uv_connect_s ;
alias uv_udp_send_t = uv_udp_send_s ;
alias uv_fs_t = uv_fs_s ;
alias uv_work_t = uv_work_s ;
/* None of the above. */
alias uv_cpu_info_t = uv_cpu_info_s ;
alias uv_interface_address_t = uv_interface_address_s ;
alias uv_dirent_t = uv_dirent_s ;
alias uv_passwd_t = uv_passwd_s ;
enum uv_loop_option {
	UV_LOOP_BLOCK_SIGNAL
};
enum uv_run_mode {
	UV_RUN_DEFAULT = 0 ,
	UV_RUN_ONCE,
	UV_RUN_NOWAIT
};
uint uv_version();
const(char)* uv_version_string();
alias uv_malloc_func = ExternC!(void* function(size_t size));
alias uv_realloc_func = ExternC!(void* function(void* ptr, size_t size));
alias uv_calloc_func = ExternC!(void* function(size_t count, size_t size));
alias uv_free_func = ExternC!(void function(void* ptr));
int uv_replace_allocator(uv_malloc_func malloc_func, uv_realloc_func realloc_func, uv_calloc_func calloc_func, uv_free_func free_func);
uv_loop_t* uv_default_loop();
int uv_loop_init(uv_loop_t* loop);
int uv_loop_close(uv_loop_t* loop);
/*
 * NOTE:
 *  This function is DEPRECATED (to be removed after 0.12), users should
 *  allocate the loop manually and use uv_loop_init instead.
 */
uv_loop_t* uv_loop_new();
/*
 * NOTE:
 *  This function is DEPRECATED (to be removed after 0.12). Users should use
 *  uv_loop_close and free the memory manually instead.
 */
void uv_loop_delete(uv_loop_t*);
size_t uv_loop_size();
int uv_loop_alive(inout(uv_loop_t)* loop);
int uv_loop_configure(uv_loop_t* loop, uv_loop_option option, ...);
int uv_loop_fork(uv_loop_t* loop);
int uv_run(uv_loop_t*, uv_run_mode mode);
void uv_stop(uv_loop_t*);
void uv_ref(uv_handle_t*);
void uv_unref(uv_handle_t*);
int uv_has_ref(inout(uv_handle_t)*);
void uv_update_time(uv_loop_t*);
uint64_t uv_now(inout(uv_loop_t)*);
int uv_backend_fd(inout(uv_loop_t)*);
int uv_backend_timeout(inout(uv_loop_t)*);
alias uv_alloc_cb = ExternC!(void function(uv_handle_t* handle, size_t suggested_size, uv_buf_t* buf));
alias uv_read_cb = ExternC!(void function(uv_stream_t* stream, ssize_t nread, inout(uv_buf_t)* buf));
alias uv_write_cb = ExternC!(void function(uv_write_t* req, int status));
alias uv_connect_cb = ExternC!(void function(uv_connect_t* req, int status));
alias uv_shutdown_cb = ExternC!(void function(uv_shutdown_t* req, int status));
alias uv_connection_cb = ExternC!(void function(uv_stream_t* server, int status));
alias uv_close_cb = ExternC!(void function(uv_handle_t* handle));
alias uv_poll_cb = ExternC!(void function(uv_poll_t* handle, int status, int events));
alias uv_timer_cb = ExternC!(void function(uv_timer_t* handle));
alias uv_async_cb = ExternC!(void function(uv_async_t* handle));
alias uv_prepare_cb = ExternC!(void function(uv_prepare_t* handle));
alias uv_check_cb = ExternC!(void function(uv_check_t* handle));
alias uv_idle_cb = ExternC!(void function(uv_idle_t* handle));
alias uv_exit_cb = ExternC!(void function(uv_process_t*, int64_t exit_status, int term_signal));
alias uv_walk_cb = ExternC!(void function(uv_handle_t* handle, void* arg));
alias uv_fs_cb = ExternC!(void function(uv_fs_t* req));
alias uv_work_cb = ExternC!(void function(uv_work_t* req));
alias uv_after_work_cb = ExternC!(void function(uv_work_t* req, int status));
alias uv_getaddrinfo_cb = ExternC!(void function(uv_getaddrinfo_t* req, int status, addrinfo* res));
alias uv_getnameinfo_cb = ExternC!(void function(uv_getnameinfo_t* req, int status, inout(char)* hostname, inout(char)* service));
struct uv_timespec_t {
	ptrdiff_t tv_sec;
	ptrdiff_t tv_nsec;
};
struct uv_stat_t {
	uint64_t st_dev;
	uint64_t st_mode;
	uint64_t st_nlink;
	uint64_t st_uid;
	uint64_t st_gid;
	uint64_t st_rdev;
	uint64_t st_ino;
	uint64_t st_size;
	uint64_t st_blksize;
	uint64_t st_blocks;
	uint64_t st_flags;
	uint64_t st_gen;
	uv_timespec_t st_atim;
	uv_timespec_t st_mtim;
	uv_timespec_t st_ctim;
	uv_timespec_t st_birthtim;
};
alias uv_fs_event_cb = ExternC!(void function(uv_fs_event_t* handle, inout(char)* filename, int events, int status));
alias uv_fs_poll_cb = ExternC!(void function(uv_fs_poll_t* handle, int status, inout(uv_stat_t)* prev, inout(uv_stat_t)* curr));
alias uv_signal_cb = ExternC!(void function(uv_signal_t* handle, int signum));
enum uv_membership {
	UV_LEAVE_GROUP = 0 ,
	UV_JOIN_GROUP
};
int uv_translate_sys_error(int sys_errno);
const(char)* uv_strerror(int err);
char* uv_strerror_r(int err, char* buf, size_t buflen);
const(char)* uv_err_name(int err);
char* uv_err_name_r(int err, char* buf, size_t buflen);
template UV_REQ_FIELDS() {
	void* data;
	/* read-only */
	uv_req_type type;
	/* private */
	void*[6] reserved;
	mixin UV_REQ_PRIVATE_FIELDS;
}
/* Abstract base class of all requests. */
struct uv_req_s {
	mixin UV_REQ_FIELDS;
};
/* Platform-specific request types. */
mixin UV_PRIVATE_REQ_TYPES;
int uv_shutdown(uv_shutdown_t* req, uv_stream_t* handle, uv_shutdown_cb cb);
struct uv_shutdown_s {
	mixin UV_REQ_FIELDS;
	uv_stream_t* handle;
	uv_shutdown_cb cb;
	mixin UV_SHUTDOWN_PRIVATE_FIELDS;
};
template UV_HANDLE_FIELDS() {
	void* data;
	/* read-only */
	uv_loop_t* loop;
	uv_handle_type type;
	/* private */
	uv_close_cb close_cb;
	void*[2] handle_queue;
	union u_s {
		int fd;
		void*[4] reserved;
	};
	u_s u;
	mixin UV_HANDLE_PRIVATE_FIELDS;
}
/* The abstract base class of all handles. */
struct uv_handle_s {
	mixin UV_HANDLE_FIELDS;
};
size_t uv_handle_size(uv_handle_type type);
uv_handle_type uv_handle_get_type(inout(uv_handle_t)* handle);
const(char)* uv_handle_type_name(uv_handle_type type);
void* uv_handle_get_data(inout(uv_handle_t)* handle);
uv_loop_t* uv_handle_get_loop(inout(uv_handle_t)* handle);
void uv_handle_set_data(uv_handle_t* handle, void* data);
size_t uv_req_size(uv_req_type type);
void* uv_req_get_data(inout(uv_req_t)* req);
void uv_req_set_data(uv_req_t* req, void* data);
uv_req_type uv_req_get_type(inout(uv_req_t)* req);
const(char)* uv_req_type_name(uv_req_type type);
int uv_is_active(inout(uv_handle_t)* handle);
void uv_walk(uv_loop_t* loop, uv_walk_cb walk_cb, void* arg);
/* Helpers for ad hoc debugging, no API/ABI stability guaranteed. */
void uv_print_all_handles(uv_loop_t* loop, FILE* stream);
void uv_print_active_handles(uv_loop_t* loop, FILE* stream);
void uv_close(uv_handle_t* handle, uv_close_cb close_cb);
int uv_send_buffer_size(uv_handle_t* handle, int* value);
int uv_recv_buffer_size(uv_handle_t* handle, int* value);
int uv_fileno(inout(uv_handle_t)* handle, uv_os_fd_t* fd);
uv_buf_t uv_buf_init(char* base, uint len);
template UV_STREAM_FIELDS() {
	size_t write_queue_size;
	uv_alloc_cb alloc_cb;
	uv_read_cb read_cb;
	/* private */
	mixin UV_STREAM_PRIVATE_FIELDS;
}
/*
 * uv_stream_t is a subclass of uv_handle_t.
 *
 * uv_stream is an abstract class.
 *
 * uv_stream_t is the parent class of uv_tcp_t, uv_pipe_t and uv_tty_t.
 */
struct uv_stream_s {
	mixin UV_HANDLE_FIELDS;
	mixin UV_STREAM_FIELDS;
};
size_t uv_stream_get_write_queue_size(inout(uv_stream_t)* stream);
int uv_listen(uv_stream_t* stream, int backlog, uv_connection_cb cb);
int uv_accept(uv_stream_t* server, uv_stream_t* client);
int uv_read_start(uv_stream_t*, uv_alloc_cb alloc_cb, uv_read_cb read_cb);
int uv_read_stop(uv_stream_t*);
int uv_write(uv_write_t* req, uv_stream_t* handle, inout(uv_buf_t)* bufs, uint nbufs, uv_write_cb cb);
int uv_write2(uv_write_t* req, uv_stream_t* handle, inout(uv_buf_t)* bufs, uint nbufs, uv_stream_t* send_handle, uv_write_cb cb);
int uv_try_write(uv_stream_t* handle, inout(uv_buf_t)* bufs, uint nbufs);
/* uv_write_t is a subclass of uv_req_t. */
struct uv_write_s {
	mixin UV_REQ_FIELDS;
	uv_write_cb cb;
	uv_stream_t* send_handle;
	/* TODO: make private and unix-only in v2.x. */
	uv_stream_t* handle;
	mixin UV_WRITE_PRIVATE_FIELDS;
};
int uv_is_readable(inout(uv_stream_t)* handle);
int uv_is_writable(inout(uv_stream_t)* handle);
int uv_stream_set_blocking(uv_stream_t* handle, int blocking);
int uv_is_closing(inout(uv_handle_t)* handle);
/*
 * uv_tcp_t is a subclass of uv_stream_t.
 *
 * Represents a TCP stream or TCP server.
 */
struct uv_tcp_s {
	mixin UV_HANDLE_FIELDS;
	mixin UV_STREAM_FIELDS;
	mixin UV_TCP_PRIVATE_FIELDS;
};
int uv_tcp_init(uv_loop_t*, uv_tcp_t* handle);
int uv_tcp_init_ex(uv_loop_t*, uv_tcp_t* handle, uint flags);
int uv_tcp_open(uv_tcp_t* handle, uv_os_sock_t sock);
int uv_tcp_nodelay(uv_tcp_t* handle, int enable);
int uv_tcp_keepalive(uv_tcp_t* handle, int enable, uint delay);
int uv_tcp_simultaneous_accepts(uv_tcp_t* handle, int enable);
enum uv_tcp_flags {
	/* Used with uv_tcp_bind, when an IPv6 address is used. */
	UV_TCP_IPV6ONLY = 1 
};
int uv_tcp_bind(uv_tcp_t* handle, inout(sockaddr)* addr, uint flags);
int uv_tcp_getsockname(inout(uv_tcp_t)* handle, sockaddr* name, int* namelen);
int uv_tcp_getpeername(inout(uv_tcp_t)* handle, sockaddr* name, int* namelen);
int uv_tcp_connect(uv_connect_t* req, uv_tcp_t* handle, inout(sockaddr)* addr, uv_connect_cb cb);
/* uv_connect_t is a subclass of uv_req_t. */
struct uv_connect_s {
	mixin UV_REQ_FIELDS;
	uv_connect_cb cb;
	uv_stream_t* handle;
	mixin UV_CONNECT_PRIVATE_FIELDS;
};
/*
 * UDP support.
 */
enum uv_udp_flags {
	/* Disables dual stack mode. */
	UV_UDP_IPV6ONLY = 1 ,
	/*
	   * Indicates message was truncated because read buffer was too small. The
	   * remainder was discarded by the OS. Used in uv_udp_recv_cb.
	   */
	UV_UDP_PARTIAL = 2 ,
	/*
	   * Indicates if SO_REUSEADDR will be set when binding the handle.
	   * This sets the SO_REUSEPORT socket flag on the BSDs and OS X. On other
	   * Unix platforms, it sets the SO_REUSEADDR flag.  What that means is that
	   * multiple threads or processes can bind to the same address without error
	   * (provided they all set the flag) but only the last one to bind will receive
	   * any traffic, in effect "stealing" the port from the previous listener.
	   */
	UV_UDP_REUSEADDR = 4 
};
alias uv_udp_send_cb = ExternC!(void function(uv_udp_send_t* req, int status));
alias uv_udp_recv_cb = ExternC!(void function(uv_udp_t* handle, ssize_t nread, inout(uv_buf_t)* buf, inout(sockaddr)* addr, uint flags));
/* uv_udp_t is a subclass of uv_handle_t. */
struct uv_udp_s {
	mixin UV_HANDLE_FIELDS;
	/* read-only */
	/*
	   * Number of bytes queued for sending. This field strictly shows how much
	   * information is currently queued.
	   */
	size_t send_queue_size;
	/*
	   * Number of send requests currently in the queue awaiting to be processed.
	   */
	size_t send_queue_count;
	mixin UV_UDP_PRIVATE_FIELDS;
};
/* uv_udp_send_t is a subclass of uv_req_t. */
struct uv_udp_send_s {
	mixin UV_REQ_FIELDS;
	uv_udp_t* handle;
	uv_udp_send_cb cb;
	mixin UV_UDP_SEND_PRIVATE_FIELDS;
};
int uv_udp_init(uv_loop_t*, uv_udp_t* handle);
int uv_udp_init_ex(uv_loop_t*, uv_udp_t* handle, uint flags);
int uv_udp_open(uv_udp_t* handle, uv_os_sock_t sock);
int uv_udp_bind(uv_udp_t* handle, inout(sockaddr)* addr, uint flags);
int uv_udp_getsockname(inout(uv_udp_t)* handle, sockaddr* name, int* namelen);
int uv_udp_set_membership(uv_udp_t* handle, inout(char)* multicast_addr, inout(char)* interface_addr, uv_membership membership);
int uv_udp_set_multicast_loop(uv_udp_t* handle, int on);
int uv_udp_set_multicast_ttl(uv_udp_t* handle, int ttl);
int uv_udp_set_multicast_interface(uv_udp_t* handle, inout(char)* interface_addr);
int uv_udp_set_broadcast(uv_udp_t* handle, int on);
int uv_udp_set_ttl(uv_udp_t* handle, int ttl);
int uv_udp_send(uv_udp_send_t* req, uv_udp_t* handle, inout(uv_buf_t)* bufs, uint nbufs, inout(sockaddr)* addr, uv_udp_send_cb send_cb);
int uv_udp_try_send(uv_udp_t* handle, inout(uv_buf_t)* bufs, uint nbufs, inout(sockaddr)* addr);
int uv_udp_recv_start(uv_udp_t* handle, uv_alloc_cb alloc_cb, uv_udp_recv_cb recv_cb);
int uv_udp_recv_stop(uv_udp_t* handle);
size_t uv_udp_get_send_queue_size(inout(uv_udp_t)* handle);
size_t uv_udp_get_send_queue_count(inout(uv_udp_t)* handle);
/*
 * uv_tty_t is a subclass of uv_stream_t.
 *
 * Representing a stream for the console.
 */
struct uv_tty_s {
	mixin UV_HANDLE_FIELDS;
	mixin UV_STREAM_FIELDS;
	mixin UV_TTY_PRIVATE_FIELDS;
};
enum uv_tty_mode_t {
	/* Initial/normal terminal mode */
	UV_TTY_MODE_NORMAL,
	/* Raw input mode (On Windows, ENABLE_WINDOW_INPUT is also enabled) */
	UV_TTY_MODE_RAW,
	/* Binary-safe I/O mode for IPC (Unix-only) */
	UV_TTY_MODE_IO
};
int uv_tty_init(uv_loop_t*, uv_tty_t*, uv_file fd, int readable);
int uv_tty_set_mode(uv_tty_t*, uv_tty_mode_t mode);
int uv_tty_reset_mode();
int uv_tty_get_winsize(uv_tty_t*, int* width, int* height);
uv_handle_type uv_guess_handle(uv_file file);
/*
 * uv_pipe_t is a subclass of uv_stream_t.
 *
 * Representing a pipe stream or pipe server. On Windows this is a Named
 * Pipe. On Unix this is a Unix domain socket.
 */
struct uv_pipe_s {
	mixin UV_HANDLE_FIELDS;
	mixin UV_STREAM_FIELDS;
	int ipc;
	/* non-zero if this pipe is used for passing handles */
	mixin UV_PIPE_PRIVATE_FIELDS;
};
int uv_pipe_init(uv_loop_t*, uv_pipe_t* handle, int ipc);
int uv_pipe_open(uv_pipe_t*, uv_file file);
int uv_pipe_bind(uv_pipe_t* handle, inout(char)* name);
void uv_pipe_connect(uv_connect_t* req, uv_pipe_t* handle, inout(char)* name, uv_connect_cb cb);
int uv_pipe_getsockname(inout(uv_pipe_t)* handle, char* buffer, size_t* size);
int uv_pipe_getpeername(inout(uv_pipe_t)* handle, char* buffer, size_t* size);
void uv_pipe_pending_instances(uv_pipe_t* handle, int count);
int uv_pipe_pending_count(uv_pipe_t* handle);
uv_handle_type uv_pipe_pending_type(uv_pipe_t* handle);
int uv_pipe_chmod(uv_pipe_t* handle, int flags);
struct uv_poll_s {
	mixin UV_HANDLE_FIELDS;
	uv_poll_cb poll_cb;
	mixin UV_POLL_PRIVATE_FIELDS;
};
enum uv_poll_event {
	UV_READABLE = 1 ,
	UV_WRITABLE = 2 ,
	UV_DISCONNECT = 4 ,
	UV_PRIORITIZED = 8 
};
int uv_poll_init(uv_loop_t* loop, uv_poll_t* handle, int fd);
int uv_poll_init_socket(uv_loop_t* loop, uv_poll_t* handle, uv_os_sock_t socket);
int uv_poll_start(uv_poll_t* handle, int events, uv_poll_cb cb);
int uv_poll_stop(uv_poll_t* handle);
struct uv_prepare_s {
	mixin UV_HANDLE_FIELDS;
	mixin UV_PREPARE_PRIVATE_FIELDS;
};
int uv_prepare_init(uv_loop_t*, uv_prepare_t* prepare);
int uv_prepare_start(uv_prepare_t* prepare, uv_prepare_cb cb);
int uv_prepare_stop(uv_prepare_t* prepare);
struct uv_check_s {
	mixin UV_HANDLE_FIELDS;
	mixin UV_CHECK_PRIVATE_FIELDS;
};
int uv_check_init(uv_loop_t*, uv_check_t* check);
int uv_check_start(uv_check_t* check, uv_check_cb cb);
int uv_check_stop(uv_check_t* check);
struct uv_idle_s {
	mixin UV_HANDLE_FIELDS;
	mixin UV_IDLE_PRIVATE_FIELDS;
};
int uv_idle_init(uv_loop_t*, uv_idle_t* idle);
int uv_idle_start(uv_idle_t* idle, uv_idle_cb cb);
int uv_idle_stop(uv_idle_t* idle);
struct uv_async_s {
	mixin UV_HANDLE_FIELDS;
	mixin UV_ASYNC_PRIVATE_FIELDS;
};
int uv_async_init(uv_loop_t*, uv_async_t* async, uv_async_cb async_cb);
int uv_async_send(uv_async_t* async);
/*
 * uv_timer_t is a subclass of uv_handle_t.
 *
 * Used to get woken up at a specified time in the future.
 */
struct uv_timer_s {
	mixin UV_HANDLE_FIELDS;
	mixin UV_TIMER_PRIVATE_FIELDS;
};
int uv_timer_init(uv_loop_t*, uv_timer_t* handle);
int uv_timer_start(uv_timer_t* handle, uv_timer_cb cb, uint64_t timeout, uint64_t repeat);
int uv_timer_stop(uv_timer_t* handle);
int uv_timer_again(uv_timer_t* handle);
void uv_timer_set_repeat(uv_timer_t* handle, uint64_t repeat);
uint64_t uv_timer_get_repeat(inout(uv_timer_t)* handle);
/*
 * uv_getaddrinfo_t is a subclass of uv_req_t.
 *
 * Request object for uv_getaddrinfo.
 */
struct uv_getaddrinfo_s {
	mixin UV_REQ_FIELDS;
	/* read-only */
	uv_loop_t* loop;
	/* struct addrinfo* addrinfo is marked as private, but it really isn't. */
	mixin UV_GETADDRINFO_PRIVATE_FIELDS;
};
int uv_getaddrinfo(uv_loop_t* loop, uv_getaddrinfo_t* req, uv_getaddrinfo_cb getaddrinfo_cb, inout(char)* node, inout(char)* service, inout(addrinfo)* hints);
void uv_freeaddrinfo(addrinfo* ai);
/*
* uv_getnameinfo_t is a subclass of uv_req_t.
*
* Request object for uv_getnameinfo.
*/
struct uv_getnameinfo_s {
	mixin UV_REQ_FIELDS;
	/* read-only */
	uv_loop_t* loop;
	/* host and service are marked as private, but they really aren't. */
	mixin UV_GETNAMEINFO_PRIVATE_FIELDS;
};
int uv_getnameinfo(uv_loop_t* loop, uv_getnameinfo_t* req, uv_getnameinfo_cb getnameinfo_cb, inout(sockaddr)* addr, int flags);
/* uv_spawn() options. */
enum uv_stdio_flags {
	UV_IGNORE = 0x00 ,
	UV_CREATE_PIPE = 0x01 ,
	UV_INHERIT_FD = 0x02 ,
	UV_INHERIT_STREAM = 0x04 ,
	/*
	   * When UV_CREATE_PIPE is specified, UV_READABLE_PIPE and UV_WRITABLE_PIPE
	   * determine the direction of flow, from the child process' perspective. Both
	   * flags may be specified to create a duplex data stream.
	   */
	UV_READABLE_PIPE = 0x10 ,
	UV_WRITABLE_PIPE = 0x20 ,
	/*
	   * Open the child pipe handle in overlapped mode on Windows.
	   * On Unix it is silently ignored.
	   */
	UV_OVERLAPPED_PIPE = 0x40 
};
struct uv_stdio_container_s {
	uv_stdio_flags flags;
	union data_s {
		uv_stream_t* stream;
		int fd;
	};
	data_s data;
};
alias uv_stdio_container_t = uv_stdio_container_s ;
struct uv_process_options_s {
	uv_exit_cb exit_cb;
	/* Called after the process exits. */
	const(char)* file;
	/* Path to program to execute. */
	/*
	   * Command line arguments. args[0] should be the path to the program. On
	   * Windows this uses CreateProcess which concatenates the arguments into a
	   * string this can cause some strange errors. See the note at
	   * windows_verbatim_arguments.
	   */
	char** args;
	/*
	   * This will be set as the environ variable in the subprocess. If this is
	   * NULL then the parents environ will be used.
	   */
	char** env;
	/*
	   * If non-null this represents a directory the subprocess should execute
	   * in. Stands for current working directory.
	   */
	const(char)* cwd;
	/*
	   * Various flags that control how uv_spawn() behaves. See the definition of
	   * `enum uv_process_flags` below.
	   */
	uint flags;
	/*
	   * The `stdio` field points to an array of uv_stdio_container_t structs that
	   * describe the file descriptors that will be made available to the child
	   * process. The convention is that stdio[0] points to stdin, fd 1 is used for
	   * stdout, and fd 2 is stderr.
	   *
	   * Note that on windows file descriptors greater than 2 are available to the
	   * child process only if the child processes uses the MSVCRT runtime.
	   */
	int stdio_count;
	uv_stdio_container_t* stdio;
	/*
	   * Libuv can change the child process' user/group id. This happens only when
	   * the appropriate bits are set in the flags fields. This is not supported on
	   * windows; uv_spawn() will fail and set the error to UV_ENOTSUP.
	   */
	uv_uid_t uid;
	uv_gid_t gid;
};
alias uv_process_options_t = uv_process_options_s ;
/*
 * These are the flags that can be used for the uv_process_options.flags field.
 */
enum uv_process_flags {
	/*
	   * Set the child process' user id. The user id is supplied in the `uid` field
	   * of the options struct. This does not work on windows; setting this flag
	   * will cause uv_spawn() to fail.
	   */
	UV_PROCESS_SETUID = ( 1 << 0 ),
	/*
	   * Set the child process' group id. The user id is supplied in the `gid`
	   * field of the options struct. This does not work on windows; setting this
	   * flag will cause uv_spawn() to fail.
	   */
	UV_PROCESS_SETGID = ( 1 << 1 ),
	/*
	   * Do not wrap any arguments in quotes, or perform any other escaping, when
	   * converting the argument list into a command line string. This option is
	   * only meaningful on Windows systems. On Unix it is silently ignored.
	   */
	UV_PROCESS_WINDOWS_VERBATIM_ARGUMENTS = ( 1 << 2 ),
	/*
	   * Spawn the child process in a detached state - this will make it a process
	   * group leader, and will effectively enable the child to keep running after
	   * the parent exits.  Note that the child process will still keep the
	   * parent's event loop alive unless the parent process calls uv_unref() on
	   * the child's process handle.
	   */
	UV_PROCESS_DETACHED = ( 1 << 3 ),
	/*
	   * Hide the subprocess window that would normally be created. This option is
	   * only meaningful on Windows systems. On Unix it is silently ignored.
	   */
	UV_PROCESS_WINDOWS_HIDE = ( 1 << 4 ),
	/*
	   * Hide the subprocess console window that would normally be created. This 
	   * option is only meaningful on Windows systems. On Unix it is silently
	   * ignored.
	   */
	UV_PROCESS_WINDOWS_HIDE_CONSOLE = ( 1 << 5 ),
	/*
	   * Hide the subprocess GUI window that would normally be created. This 
	   * option is only meaningful on Windows systems. On Unix it is silently
	   * ignored.
	   */
	UV_PROCESS_WINDOWS_HIDE_GUI = ( 1 << 6 )
};
/*
 * uv_process_t is a subclass of uv_handle_t.
 */
struct uv_process_s {
	mixin UV_HANDLE_FIELDS;
	uv_exit_cb exit_cb;
	int pid;
	mixin UV_PROCESS_PRIVATE_FIELDS;
};
int uv_spawn(uv_loop_t* loop, uv_process_t* handle, inout(uv_process_options_t)* options);
int uv_process_kill(uv_process_t*, int signum);
int uv_kill(int pid, int signum);
uv_pid_t uv_process_get_pid(inout(uv_process_t)*);
/*
 * uv_work_t is a subclass of uv_req_t.
 */
struct uv_work_s {
	mixin UV_REQ_FIELDS;
	uv_loop_t* loop;
	uv_work_cb work_cb;
	uv_after_work_cb after_work_cb;
	mixin UV_WORK_PRIVATE_FIELDS;
};
int uv_queue_work(uv_loop_t* loop, uv_work_t* req, uv_work_cb work_cb, uv_after_work_cb after_work_cb);
int uv_cancel(uv_req_t* req);
struct uv_cpu_times_s {
	uint64_t user;
	uint64_t nice;
	uint64_t sys;
	uint64_t idle;
	uint64_t irq;
};
struct uv_cpu_info_s {
	char* model;
	int speed;
	uv_cpu_times_s cpu_times;
};
struct uv_interface_address_s {
	char* name;
	char[6] phys_addr;
	int is_internal;
	union address_s {
		sockaddr_in address4;
		sockaddr_in6 address6;
	};
	address_s address;
	union netmask_s {
		sockaddr_in netmask4;
		sockaddr_in6 netmask6;
	};
	netmask_s netmask;
};
struct uv_passwd_s {
	char* username;
	ptrdiff_t uid;
	ptrdiff_t gid;
	char* shell;
	char* homedir;
};
enum uv_dirent_type_t {
	UV_DIRENT_UNKNOWN,
	UV_DIRENT_FILE,
	UV_DIRENT_DIR,
	UV_DIRENT_LINK,
	UV_DIRENT_FIFO,
	UV_DIRENT_SOCKET,
	UV_DIRENT_CHAR,
	UV_DIRENT_BLOCK
};
struct uv_dirent_s {
	const(char)* name;
	uv_dirent_type_t type;
};
char** uv_setup_args(int argc, char** argv);
int uv_get_process_title(char* buffer, size_t size);
int uv_set_process_title(inout(char)* title);
int uv_resident_set_memory(size_t* rss);
int uv_uptime(double* uptime);
uv_os_fd_t uv_get_osfhandle(int fd);
int uv_open_osfhandle(uv_os_fd_t os_fd);
struct uv_timeval_t {
	ptrdiff_t tv_sec;
	ptrdiff_t tv_usec;
};
struct uv_rusage_t {
	uv_timeval_t ru_utime;
	/* user CPU time used */
	uv_timeval_t ru_stime;
	/* system CPU time used */
	uint64_t ru_maxrss;
	/* maximum resident set size */
	uint64_t ru_ixrss;
	/* integral shared memory size */
	uint64_t ru_idrss;
	/* integral unshared data size */
	uint64_t ru_isrss;
	/* integral unshared stack size */
	uint64_t ru_minflt;
	/* page reclaims (soft page faults) */
	uint64_t ru_majflt;
	/* page faults (hard page faults) */
	uint64_t ru_nswap;
	/* swaps */
	uint64_t ru_inblock;
	/* block input operations */
	uint64_t ru_oublock;
	/* block output operations */
	uint64_t ru_msgsnd;
	/* IPC messages sent */
	uint64_t ru_msgrcv;
	/* IPC messages received */
	uint64_t ru_nsignals;
	/* signals received */
	uint64_t ru_nvcsw;
	/* voluntary context switches */
	uint64_t ru_nivcsw;
	/* involuntary context switches */
};
int uv_getrusage(uv_rusage_t* rusage);
int uv_os_homedir(char* buffer, size_t* size);
int uv_os_tmpdir(char* buffer, size_t* size);
int uv_os_get_passwd(uv_passwd_t* pwd);
void uv_os_free_passwd(uv_passwd_t* pwd);
uv_pid_t uv_os_getpid();
uv_pid_t uv_os_getppid();
enum UV_PRIORITY_LOW = 19 ;
enum UV_PRIORITY_BELOW_NORMAL = 10 ;
enum UV_PRIORITY_NORMAL = 0 ;
enum UV_PRIORITY_ABOVE_NORMAL = -7 ;
enum UV_PRIORITY_HIGH = -14 ;
enum UV_PRIORITY_HIGHEST = -20 ;
int uv_os_getpriority(uv_pid_t pid, int* priority);
int uv_os_setpriority(uv_pid_t pid, int priority);
int uv_cpu_info(uv_cpu_info_t** cpu_infos, int* count);
void uv_free_cpu_info(uv_cpu_info_t* cpu_infos, int count);
int uv_interface_addresses(uv_interface_address_t** addresses, int* count);
void uv_free_interface_addresses(uv_interface_address_t* addresses, int count);
int uv_os_getenv(inout(char)* name, char* buffer, size_t* size);
int uv_os_setenv(inout(char)* name, inout(char)* value);
int uv_os_unsetenv(inout(char)* name);
int uv_os_gethostname(char* buffer, size_t* size);
enum uv_fs_type {
	UV_FS_UNKNOWN = - 1,
	UV_FS_CUSTOM,
	UV_FS_OPEN,
	UV_FS_CLOSE,
	UV_FS_READ,
	UV_FS_WRITE,
	UV_FS_SENDFILE,
	UV_FS_STAT,
	UV_FS_LSTAT,
	UV_FS_FSTAT,
	UV_FS_FTRUNCATE,
	UV_FS_UTIME,
	UV_FS_FUTIME,
	UV_FS_ACCESS,
	UV_FS_CHMOD,
	UV_FS_FCHMOD,
	UV_FS_FSYNC,
	UV_FS_FDATASYNC,
	UV_FS_UNLINK,
	UV_FS_RMDIR,
	UV_FS_MKDIR,
	UV_FS_MKDTEMP,
	UV_FS_RENAME,
	UV_FS_SCANDIR,
	UV_FS_LINK,
	UV_FS_SYMLINK,
	UV_FS_READLINK,
	UV_FS_CHOWN,
	UV_FS_FCHOWN,
	UV_FS_REALPATH,
	UV_FS_COPYFILE,
	UV_FS_LCHOWN
};
/* uv_fs_t is a subclass of uv_req_t. */
struct uv_fs_s {
	mixin UV_REQ_FIELDS;
	uv_fs_type fs_type;
	uv_loop_t* loop;
	uv_fs_cb cb;
	ssize_t result;
	void* ptr;
	const(char)* path;
	uv_stat_t statbuf;
	/* Stores the result of uv_fs_stat() and uv_fs_fstat(). */
	mixin UV_FS_PRIVATE_FIELDS;
};
uv_fs_type uv_fs_get_type(inout(uv_fs_t)*);
ssize_t uv_fs_get_result(inout(uv_fs_t)*);
void* uv_fs_get_ptr(inout(uv_fs_t)*);
const(char)* uv_fs_get_path(inout(uv_fs_t)*);
uv_stat_t* uv_fs_get_statbuf(uv_fs_t*);
void uv_fs_req_cleanup(uv_fs_t* req);
int uv_fs_close(uv_loop_t* loop, uv_fs_t* req, uv_file file, uv_fs_cb cb);
int uv_fs_open(uv_loop_t* loop, uv_fs_t* req, inout(char)* path, int flags, int mode, uv_fs_cb cb);
int uv_fs_read(uv_loop_t* loop, uv_fs_t* req, uv_file file, inout(uv_buf_t)* bufs, uint nbufs, int64_t offset, uv_fs_cb cb);
int uv_fs_unlink(uv_loop_t* loop, uv_fs_t* req, inout(char)* path, uv_fs_cb cb);
int uv_fs_write(uv_loop_t* loop, uv_fs_t* req, uv_file file, inout(uv_buf_t)* bufs, uint nbufs, int64_t offset, uv_fs_cb cb);
/*
 * This flag can be used with uv_fs_copyfile() to return an error if the
 * destination already exists.
 */
enum UV_FS_COPYFILE_EXCL = 0x0001 ;
/*
 * This flag can be used with uv_fs_copyfile() to attempt to create a reflink.
 * If copy-on-write is not supported, a fallback copy mechanism is used.
 */
enum UV_FS_COPYFILE_FICLONE = 0x0002 ;
/*
 * This flag can be used with uv_fs_copyfile() to attempt to create a reflink.
 * If copy-on-write is not supported, an error is returned.
 */
enum UV_FS_COPYFILE_FICLONE_FORCE = 0x0004 ;
int uv_fs_copyfile(uv_loop_t* loop, uv_fs_t* req, inout(char)* path, inout(char)* new_path, int flags, uv_fs_cb cb);
int uv_fs_mkdir(uv_loop_t* loop, uv_fs_t* req, inout(char)* path, int mode, uv_fs_cb cb);
int uv_fs_mkdtemp(uv_loop_t* loop, uv_fs_t* req, inout(char)* tpl, uv_fs_cb cb);
int uv_fs_rmdir(uv_loop_t* loop, uv_fs_t* req, inout(char)* path, uv_fs_cb cb);
int uv_fs_scandir(uv_loop_t* loop, uv_fs_t* req, inout(char)* path, int flags, uv_fs_cb cb);
int uv_fs_scandir_next(uv_fs_t* req, uv_dirent_t* ent);
int uv_fs_stat(uv_loop_t* loop, uv_fs_t* req, inout(char)* path, uv_fs_cb cb);
int uv_fs_fstat(uv_loop_t* loop, uv_fs_t* req, uv_file file, uv_fs_cb cb);
int uv_fs_rename(uv_loop_t* loop, uv_fs_t* req, inout(char)* path, inout(char)* new_path, uv_fs_cb cb);
int uv_fs_fsync(uv_loop_t* loop, uv_fs_t* req, uv_file file, uv_fs_cb cb);
int uv_fs_fdatasync(uv_loop_t* loop, uv_fs_t* req, uv_file file, uv_fs_cb cb);
int uv_fs_ftruncate(uv_loop_t* loop, uv_fs_t* req, uv_file file, int64_t offset, uv_fs_cb cb);
int uv_fs_sendfile(uv_loop_t* loop, uv_fs_t* req, uv_file out_fd, uv_file in_fd, int64_t in_offset, size_t length, uv_fs_cb cb);
int uv_fs_access(uv_loop_t* loop, uv_fs_t* req, inout(char)* path, int mode, uv_fs_cb cb);
int uv_fs_chmod(uv_loop_t* loop, uv_fs_t* req, inout(char)* path, int mode, uv_fs_cb cb);
int uv_fs_utime(uv_loop_t* loop, uv_fs_t* req, inout(char)* path, double atime, double mtime, uv_fs_cb cb);
int uv_fs_futime(uv_loop_t* loop, uv_fs_t* req, uv_file file, double atime, double mtime, uv_fs_cb cb);
int uv_fs_lstat(uv_loop_t* loop, uv_fs_t* req, inout(char)* path, uv_fs_cb cb);
int uv_fs_link(uv_loop_t* loop, uv_fs_t* req, inout(char)* path, inout(char)* new_path, uv_fs_cb cb);
/*
 * This flag can be used with uv_fs_symlink() on Windows to specify whether
 * path argument points to a directory.
 */
enum UV_FS_SYMLINK_DIR = 0x0001 ;
/*
 * This flag can be used with uv_fs_symlink() on Windows to specify whether
 * the symlink is to be created using junction points.
 */
enum UV_FS_SYMLINK_JUNCTION = 0x0002 ;
int uv_fs_symlink(uv_loop_t* loop, uv_fs_t* req, inout(char)* path, inout(char)* new_path, int flags, uv_fs_cb cb);
int uv_fs_readlink(uv_loop_t* loop, uv_fs_t* req, inout(char)* path, uv_fs_cb cb);
int uv_fs_realpath(uv_loop_t* loop, uv_fs_t* req, inout(char)* path, uv_fs_cb cb);
int uv_fs_fchmod(uv_loop_t* loop, uv_fs_t* req, uv_file file, int mode, uv_fs_cb cb);
int uv_fs_chown(uv_loop_t* loop, uv_fs_t* req, inout(char)* path, uv_uid_t uid, uv_gid_t gid, uv_fs_cb cb);
int uv_fs_fchown(uv_loop_t* loop, uv_fs_t* req, uv_file file, uv_uid_t uid, uv_gid_t gid, uv_fs_cb cb);
int uv_fs_lchown(uv_loop_t* loop, uv_fs_t* req, inout(char)* path, uv_uid_t uid, uv_gid_t gid, uv_fs_cb cb);
enum uv_fs_event {
	UV_RENAME = 1 ,
	UV_CHANGE = 2 
};
struct uv_fs_event_s {
	mixin UV_HANDLE_FIELDS;
	/* private */
	char* path;
	mixin UV_FS_EVENT_PRIVATE_FIELDS;
};
/*
 * uv_fs_stat() based polling file watcher.
 */
struct uv_fs_poll_s {
	mixin UV_HANDLE_FIELDS;
	/* Private, don't touch. */
	void* poll_ctx;
};
int uv_fs_poll_init(uv_loop_t* loop, uv_fs_poll_t* handle);
int uv_fs_poll_start(uv_fs_poll_t* handle, uv_fs_poll_cb poll_cb, inout(char)* path, uint interval);
int uv_fs_poll_stop(uv_fs_poll_t* handle);
int uv_fs_poll_getpath(uv_fs_poll_t* handle, char* buffer, size_t* size);
struct uv_signal_s {
	mixin UV_HANDLE_FIELDS;
	uv_signal_cb signal_cb;
	int signum;
	mixin UV_SIGNAL_PRIVATE_FIELDS;
};
int uv_signal_init(uv_loop_t* loop, uv_signal_t* handle);
int uv_signal_start(uv_signal_t* handle, uv_signal_cb signal_cb, int signum);
int uv_signal_start_oneshot(uv_signal_t* handle, uv_signal_cb signal_cb, int signum);
int uv_signal_stop(uv_signal_t* handle);
void uv_loadavg(double[3] avg);
/*
 * Flags to be passed to uv_fs_event_start().
 */
enum uv_fs_event_flags {
	/*
	   * By default, if the fs event watcher is given a directory name, we will
	   * watch for all events in that directory. This flags overrides this behavior
	   * and makes fs_event report only changes to the directory entry itself. This
	   * flag does not affect individual files watched.
	   * This flag is currently not implemented yet on any backend.
	   */
	UV_FS_EVENT_WATCH_ENTRY = 1 ,
	/*
	   * By default uv_fs_event will try to use a kernel interface such as inotify
	   * or kqueue to detect events. This may not work on remote filesystems such
	   * as NFS mounts. This flag makes fs_event fall back to calling stat() on a
	   * regular interval.
	   * This flag is currently not implemented yet on any backend.
	   */
	UV_FS_EVENT_STAT = 2 ,
	/*
	   * By default, event watcher, when watching directory, is not registering
	   * (is ignoring) changes in it's subdirectories.
	   * This flag will override this behaviour on platforms that support it.
	   */
	UV_FS_EVENT_RECURSIVE = 4 
};
int uv_fs_event_init(uv_loop_t* loop, uv_fs_event_t* handle);
int uv_fs_event_start(uv_fs_event_t* handle, uv_fs_event_cb cb, inout(char)* path, uint flags);
int uv_fs_event_stop(uv_fs_event_t* handle);
int uv_fs_event_getpath(uv_fs_event_t* handle, char* buffer, size_t* size);
int uv_ip4_addr(inout(char)* ip, int port, sockaddr_in* addr);
int uv_ip6_addr(inout(char)* ip, int port, sockaddr_in6* addr);
int uv_ip4_name(inout(sockaddr_in)* src, char* dst, size_t size);
int uv_ip6_name(inout(sockaddr_in6)* src, char* dst, size_t size);
int uv_inet_ntop(int af, inout(void)* src, char* dst, size_t size);
int uv_inet_pton(int af, inout(char)* src, void* dst);
int uv_if_indextoname(uint ifindex, char* buffer, size_t* size);
int uv_if_indextoiid(uint ifindex, char* buffer, size_t* size);
int uv_exepath(char* buffer, size_t* size);
int uv_cwd(char* buffer, size_t* size);
int uv_chdir(inout(char)* dir);
uint64_t uv_get_free_memory();
uint64_t uv_get_total_memory();
uint64_t uv_hrtime();
void uv_disable_stdio_inheritance();
int uv_dlopen(inout(char)* filename, uv_lib_t* lib);
void uv_dlclose(uv_lib_t* lib);
int uv_dlsym(uv_lib_t* lib, inout(char)* name, void** ptr);
const(char)* uv_dlerror(inout(uv_lib_t)* lib);
int uv_mutex_init(uv_mutex_t* handle);
int uv_mutex_init_recursive(uv_mutex_t* handle);
void uv_mutex_destroy(uv_mutex_t* handle);
void uv_mutex_lock(uv_mutex_t* handle);
int uv_mutex_trylock(uv_mutex_t* handle);
void uv_mutex_unlock(uv_mutex_t* handle);
int uv_rwlock_init(uv_rwlock_t* rwlock);
void uv_rwlock_destroy(uv_rwlock_t* rwlock);
void uv_rwlock_rdlock(uv_rwlock_t* rwlock);
int uv_rwlock_tryrdlock(uv_rwlock_t* rwlock);
void uv_rwlock_rdunlock(uv_rwlock_t* rwlock);
void uv_rwlock_wrlock(uv_rwlock_t* rwlock);
int uv_rwlock_trywrlock(uv_rwlock_t* rwlock);
void uv_rwlock_wrunlock(uv_rwlock_t* rwlock);
int uv_sem_init(uv_sem_t* sem, uint value);
void uv_sem_destroy(uv_sem_t* sem);
void uv_sem_post(uv_sem_t* sem);
void uv_sem_wait(uv_sem_t* sem);
int uv_sem_trywait(uv_sem_t* sem);
int uv_cond_init(uv_cond_t* cond);
void uv_cond_destroy(uv_cond_t* cond);
void uv_cond_signal(uv_cond_t* cond);
void uv_cond_broadcast(uv_cond_t* cond);
int uv_barrier_init(uv_barrier_t* barrier, uint count);
void uv_barrier_destroy(uv_barrier_t* barrier);
int uv_barrier_wait(uv_barrier_t* barrier);
void uv_cond_wait(uv_cond_t* cond, uv_mutex_t* mutex);
int uv_cond_timedwait(uv_cond_t* cond, uv_mutex_t* mutex, uint64_t timeout);
void uv_once(uv_once_t* guard, ExternC!(void function()) callback);
int uv_key_create(uv_key_t* key);
void uv_key_delete(uv_key_t* key);
void* uv_key_get(uv_key_t* key);
void uv_key_set(uv_key_t* key, void* value);
alias uv_thread_cb = ExternC!(void function(void* arg));
int uv_thread_create(uv_thread_t* tid, uv_thread_cb entry, void* arg);
uv_thread_t uv_thread_self();
int uv_thread_join(uv_thread_t* tid);
int uv_thread_equal(inout(uv_thread_t)* t1, inout(uv_thread_t)* t2);
/* The presence of these unions force similar struct layout. */
union uv_any_handle {
	uv_async_t async ;
	uv_check_t check ;
	uv_fs_event_t fs_event ;
	uv_fs_poll_t fs_poll ;
	uv_handle_t handle ;
	uv_idle_t idle ;
	uv_pipe_t pipe ;
	uv_poll_t poll ;
	uv_prepare_t prepare ;
	uv_process_t process ;
	uv_stream_t stream ;
	uv_tcp_t tcp ;
	uv_timer_t timer ;
	uv_tty_t tty ;
	uv_udp_t udp ;
	uv_signal_t signal ;
};
union uv_any_req {
	uv_req_t req ;
	uv_connect_t connect ;
	uv_write_t write ;
	uv_shutdown_t shutdown ;
	uv_udp_send_t udp_send ;
	uv_fs_t fs ;
	uv_work_t work ;
	uv_getaddrinfo_t getaddrinfo ;
	uv_getnameinfo_t getnameinfo ;
};
struct uv_loop_s {
	/* User data - use this for whatever. */
	void* data;
	/* Loop reference counting. */
	uint active_handles;
	void*[2] handle_queue;
	union active_reqs_s {
		void*[2] unused;
		uint count;
	};
	active_reqs_s active_reqs;
	/* Internal flag to signal loop stop. */
	uint stop_flag;
	mixin UV_LOOP_PRIVATE_FIELDS;
};
void* uv_loop_get_data(inout(uv_loop_t)*);
void uv_loop_set_data(uv_loop_t*, void* data);
/* Don't export the private CPP symbols. */
