module deimos.libuv.uv_win;
import deimos.libuv._d;
version(Windows):
extern(C) :
nothrow:
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
enum _WIN32_WINNT = 0x0502;
/* include(winsock2.h); */
struct pollfd {
	SOCKET fd;
	short events;
	short revents;
};
alias WSAPOLLFD = pollfd ;
alias PWSAPOLLFD = pollfd* ;
alias LPWSAPOLLFD = pollfd* ;
enum LOCALE_INVARIANT = 0x007f;
/* include(mswsock.h); */
/* include(ws2tcpip.h); */
/* include(windows.h); */
/* include(process.h); */
/* include(signal.h); */
/* include(sys/stat.h); */
/* include(tree.h); */
package import deimos.libuv.uv_threadpool;
enum MAX_PIPENAME_LEN = 256 ;
/* Additional signals supported by uv_signal and or uv_kill. The CRT defines
 * the following signals already:
 *
 *   #define SIGINT           2
 *   #define SIGILL           4
 *   #define SIGABRT_COMPAT   6
 *   #define SIGFPE           8
 *   #define SIGSEGV         11
 *   #define SIGTERM         15
 *   #define SIGBREAK        21
 *   #define SIGABRT         22
 *
 * The additional signals have values that are common on other Unix
 * variants (Linux and Darwin)
 */
enum S_IFLNK = 0xA000;
enum SIGHUP = 1 ;
enum SIGKILL = 9 ;
/* The CRT defines SIGABRT_COMPAT as 6, which equals SIGABRT on many */
/* unix-like platforms. However MinGW doesn't define it, so we do. */
enum SIGWINCH = 28 ;
/*
 * Guids and typedefs for winsock extension functions
 * Mingw32 doesn't have these :-(
 */
enum SIGABRT_COMPAT = 6;
enum GUID WSAID_ACCEPTEX = {0xb5367df1,0xcbac,0x11cf,[0x95,0xca,0x00,0x80,0x5f,0x48,0xa1,0x92]};
enum GUID WSAID_CONNECTEX = {0x25a207b9,0xddf3,0x4660,[0x8e,0xe9,0x76,0xe5,0x8c,0x74,0x06,0x3e]};
enum GUID WSAID_GETACCEPTEXSOCKADDRS = {0xb5367df2,0xcbac,0x11cf,[0x95,0xca,0x00,0x80,0x5f,0x48,0xa1,0x92]};
enum GUID WSAID_DISCONNECTEX = {0x7fda2e11,0x8630,0x436f,[0xa0,0x31,0xf5,0x36,0xa6,0xee,0xc1,0x57]};
enum GUID WSAID_TRANSMITFILE = {0xb5367df0,0xcbac,0x11cf,[0x95,0xca,0x00,0x80,0x5f,0x48,0xa1,0x92]};
alias LPFN_ACCEPTEX = ExternWindows!(BOOL function(SOCKET sListenSocket, SOCKET sAcceptSocket, PVOID lpOutputBuffer, DWORD dwReceiveDataLength, DWORD dwLocalAddressLength, DWORD dwRemoteAddressLength, LPDWORD lpdwBytesReceived, LPOVERLAPPED lpOverlapped)) ;
alias LPFN_CONNECTEX = ExternWindows!(BOOL function(SOCKET s, const(sockaddr)* name, int namelen, PVOID lpSendBuffer, DWORD dwSendDataLength, LPDWORD lpdwBytesSent, LPOVERLAPPED lpOverlapped)) ;
alias LPFN_GETACCEPTEXSOCKADDRS = ExternWindows!(void function(PVOID lpOutputBuffer, DWORD dwReceiveDataLength, DWORD dwLocalAddressLength, DWORD dwRemoteAddressLength, LPSOCKADDR* LocalSockaddr, LPINT LocalSockaddrLength, LPSOCKADDR* RemoteSockaddr, LPINT RemoteSockaddrLength)) ;
alias LPFN_DISCONNECTEX = ExternWindows!(BOOL function(SOCKET hSocket, LPOVERLAPPED lpOverlapped, DWORD dwFlags, DWORD reserved)) ;
alias LPFN_TRANSMITFILE = ExternWindows!(BOOL function(SOCKET hSocket, HANDLE hFile, DWORD nNumberOfBytesToWrite, DWORD nNumberOfBytesPerSend, LPOVERLAPPED lpOverlapped, LPTRANSMIT_FILE_BUFFERS lpTransmitBuffers, DWORD dwFlags)) ;
alias RTL_SRWLOCK = PVOID ;
alias SRWLOCK = RTL_SRWLOCK ;
alias PSRWLOCK = RTL_SRWLOCK* ;
alias LPFN_WSARECV = ExternWindows!(int function(SOCKET socket, LPWSABUF buffers, DWORD buffer_count, LPDWORD bytes, LPDWORD flags, LPWSAOVERLAPPED overlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE completion_routine)) ;
alias LPFN_WSARECVFROM = ExternWindows!(int function(SOCKET socket, LPWSABUF buffers, DWORD buffer_count, LPDWORD bytes, LPDWORD flags, sockaddr* addr, LPINT addr_len, LPWSAOVERLAPPED overlapped, LPWSAOVERLAPPED_COMPLETION_ROUTINE completion_routine)) ;
alias NTSTATUS = LONG ;
alias PNTSTATUS = NTSTATUS* ;
alias CONDITION_VARIABLE = PVOID ;
alias PCONDITION_VARIABLE = PVOID* ;
struct _AFD_POLL_HANDLE_INFO {
	HANDLE Handle;
	ULONG Events;
	NTSTATUS Status;
};
alias AFD_POLL_HANDLE_INFO = _AFD_POLL_HANDLE_INFO ;
alias PAFD_POLL_HANDLE_INFO = _AFD_POLL_HANDLE_INFO* ;
struct _AFD_POLL_INFO {
	LARGE_INTEGER Timeout;
	ULONG NumberOfHandles;
	ULONG Exclusive;
	AFD_POLL_HANDLE_INFO[1] Handles;
};
alias AFD_POLL_INFO = _AFD_POLL_INFO ;
alias PAFD_POLL_INFO = _AFD_POLL_INFO* ;
/**
 * It should be possible to cast uv_buf_t[] to WSABUF[]
 * see http://msdn.microsoft.com/en-us/library/ms741542(v=vs.85).aspx
 */
enum UV_MSAFD_PROVIDER_COUNT = 3 ;
struct uv_buf_t {
	ULONG len;
	char* base;
};
alias uv_file = int ;
alias uv_os_sock_t = SOCKET ;
alias uv_os_fd_t = HANDLE ;
alias uv_thread_t = HANDLE ;
alias uv_sem_t = HANDLE ;
/* This condition variable implementation is based on the SetEvent solution
 * (section 3.2) at http://www.cs.wustl.edu/~schmidt/win32-cv-1.html
 * We could not use the SignalObjectAndWait solution (section 3.4) because
 * it want the 2nd argument (type uv_mutex_t) of uv_cond_wait() and
 * uv_cond_timedwait() to be HANDLEs, but we use CRITICAL_SECTIONs.
 */
alias uv_mutex_t = CRITICAL_SECTION ;
union uv_cond_t {
	CONDITION_VARIABLE cond_var;
	struct fallback_s {
		uint waiters_count;
		CRITICAL_SECTION waiters_count_lock;
		HANDLE signal_event;
		HANDLE broadcast_event;
	};
	fallback_s fallback;
};
union uv_rwlock_t {
	struct state__s {
		uint num_readers_;
		CRITICAL_SECTION num_readers_lock_;
		HANDLE write_semaphore_;
	};
	state__s state_;
	/* TODO: remove me in v2.x. */
	struct unused1__s {
		SRWLOCK unused_;
	};
	unused1__s unused1_;
	/* TODO: remove me in v2.x. */
	struct unused2__s {
		uv_mutex_t unused1_;
		uv_mutex_t unused2_;
	};
	unused2__s unused2_;
};
struct uv_barrier_t {
	uint n;
	uint count;
	uv_mutex_t mutex;
	uv_sem_t turnstile1;
	uv_sem_t turnstile2;
};
struct uv_key_t {
	DWORD tls_index;
};
/* Platform-specific definitions for uv_spawn support. */
struct uv_once_s {
	ubyte ran;
	HANDLE event;
};
alias uv_once_t = uv_once_s ;
alias uv_uid_t = ubyte ;
alias uv_gid_t = ubyte ;
struct uv__dirent_s {
	int d_type;
	char[1] d_name;
};
alias uv__dirent_t = uv__dirent_s ;
template HAVE_DIRENT_TYPES() {};
alias UV__DT_DIR = UV_DIRENT_DIR ;
alias UV__DT_FILE = UV_DIRENT_FILE ;
alias UV__DT_LINK = UV_DIRENT_LINK ;
alias UV__DT_FIFO = UV_DIRENT_FIFO ;
alias UV__DT_SOCKET = UV_DIRENT_SOCKET ;
alias UV__DT_CHAR = UV_DIRENT_CHAR ;
/* Platform-specific definitions for uv_dlopen support. */
alias UV__DT_BLOCK = UV_DIRENT_BLOCK ;
alias uv_timer_tree_s = RB_HEAD!(uv_timer_s);
struct uv_lib_t {
	HMODULE handle;
	char* errmsg;
};
template UV_LOOP_PRIVATE_FIELDS() {
	HANDLE iocp;
	/* The current time according to the event loop. in msecs. */
	uint64_t time;
	/* Tail of a single-linked circular queue of pending reqs. If the queue */
	/* is empty, tail_ is NULL. If there is only one item, */
	/* tail_->next_req == tail_ */
	uv_req_t* pending_reqs_tail;
	/* Head of a single-linked list of closed handles */
	uv_handle_t* endgame_handles;
	/* The head of the timers tree */
	uv_timer_tree_s timers;
	/* Lists of active loop (prepare / check / idle) watchers */
	uv_prepare_t* prepare_handles;
	uv_check_t* check_handles;
	uv_idle_t* idle_handles;
	/* This pointer will refer to the prepare/check/idle handle whose */
	/* callback is scheduled to be called next. This is needed to allow */
	/* safe removal from one of the lists above while that list being */
	/* iterated over. */
	uv_prepare_t* next_prepare_handle;
	uv_check_t* next_check_handle;
	uv_idle_t* next_idle_handle;
	/* This handle holds the peer sockets for the fast variant of uv_poll_t */
	SOCKET[UV_MSAFD_PROVIDER_COUNT] poll_peer_sockets;
	/* Counter to keep track of active tcp streams */
	uint active_tcp_streams;
	/* Counter to keep track of active udp streams */
	uint active_udp_streams;
	/* Counter to started timer */
	uint64_t timer_counter;
	/* Threadpool */
	void*[2] wq;
	uv_mutex_t wq_mutex;
	uv_async_t wq_async;
}
enum UV_REQ_TYPE_PRIVATE = `UV_ACCEPT,UV_FS_EVENT_REQ,UV_POLL_REQ,UV_PROCESS_EXIT,UV_READ,UV_UDP_RECV,UV_WAKEUP,UV_SIGNAL_REQ,`;
template UV_REQ_PRIVATE_FIELDS() {
	union u_s {
		/* Used by I/O operations */
		struct io_s {
			OVERLAPPED overlapped;
			size_t queued_bytes;
		};
		io_s io;
	};
	u_s u;
	uv_req_s* next_req;
}
template UV_WRITE_PRIVATE_FIELDS() {
	int ipc_header;
	uv_buf_t write_buffer;
	HANDLE event_handle;
	HANDLE wait_handle;
}
template UV_CONNECT_PRIVATE_FIELDS() {};
template UV_SHUTDOWN_PRIVATE_FIELDS() {};
template UV_UDP_SEND_PRIVATE_FIELDS() {};
template UV_PRIVATE_REQ_TYPES() {
	struct uv_pipe_accept_s {
		mixin UV_REQ_FIELDS;
		HANDLE pipeHandle;
		uv_pipe_accept_s* next_pending;
	};
	uv_pipe_accept_s uv_pipe_accept_s;
	struct uv_tcp_accept_s {
		mixin UV_REQ_FIELDS;
		SOCKET accept_socket;
		char[sockaddr_storage.sizeof*2+32] accept_buffer;
		HANDLE event_handle;
		HANDLE wait_handle;
		uv_tcp_accept_s* next_pending;
	};
	uv_tcp_accept_s uv_tcp_accept_s;
	struct uv_read_s {
		mixin UV_REQ_FIELDS;
		HANDLE event_handle;
		HANDLE wait_handle;
	};
	uv_read_s uv_read_s;
}
template uv_stream_connection_fields() {
	uint write_reqs_pending;
	uv_shutdown_t* shutdown_req;
}
template uv_stream_server_fields() {
	uv_connection_cb connection_cb;
}
template UV_STREAM_PRIVATE_FIELDS() {
	uint reqs_pending;
	int activecnt;
	uv_read_t read_req;
	union stream_s {
		struct conn_s {
			mixin uv_stream_connection_fields;
		};
		conn_s conn;
		struct serv_s {
			mixin uv_stream_server_fields;
		};
		serv_s serv;
	};
	stream_s stream;
}
template uv_tcp_server_fields() {
	uv_tcp_accept_t* accept_reqs;
	uint processed_accepts;
	uv_tcp_accept_t* pending_accepts;
	LPFN_ACCEPTEX func_acceptex;
}
template uv_tcp_connection_fields() {
	uv_buf_t read_buffer;
	LPFN_CONNECTEX func_connectex;
}
template UV_TCP_PRIVATE_FIELDS() {
	SOCKET socket;
	int delayed_error;
	union tcp_s {
		struct serv_s {
			mixin uv_tcp_server_fields;
		};
		serv_s serv;
		struct conn_s {
			mixin uv_tcp_connection_fields;
		};
		conn_s conn;
	};
	tcp_s tcp;
}
template UV_UDP_PRIVATE_FIELDS() {
	SOCKET socket;
	uint reqs_pending;
	int activecnt;
	uv_req_t recv_req;
	uv_buf_t recv_buffer;
	sockaddr_storage recv_from;
	int recv_from_len;
	uv_udp_recv_cb recv_cb;
	uv_alloc_cb alloc_cb;
	LPFN_WSARECV func_wsarecv;
	LPFN_WSARECVFROM func_wsarecvfrom;
}
template uv_pipe_server_fields() {
	int pending_instances;
	uv_pipe_accept_t* accept_reqs;
	uv_pipe_accept_t* pending_accepts;
}
template uv_pipe_connection_fields() {
	uv_timer_t* eof_timer;
	uv_write_t ipc_header_write_req;
	int ipc_pid;
	uint64_t remaining_ipc_rawdata_bytes;
	struct pending_ipc_info_s {
		void*[2] queue;
		int queue_len;
	};
	pending_ipc_info_s pending_ipc_info;
	uv_write_t* non_overlapped_writes_tail;
	uv_mutex_t readfile_mutex;
	HANDLE readfile_thread;
}
/* TODO: put the parser states in an union - TTY handles are always */
/* half-duplex so read-state can safely overlap write-state. */
template UV_PIPE_PRIVATE_FIELDS() {
	HANDLE handle;
	WCHAR* name;
	union pipe_s {
		struct serv_s {
			mixin uv_pipe_server_fields;
		};
		serv_s serv;
		struct conn_s {
			mixin uv_pipe_connection_fields;
		};
		conn_s conn;
	};
	pipe_s pipe;
}
template UV_TTY_PRIVATE_FIELDS() {
	HANDLE handle;
	union tty_s {
		struct rd_s {
			/* Used for readable TTY handles */
			/* TODO: remove me in v2.x. */
			HANDLE unused_;
			uv_buf_t read_line_buffer;
			HANDLE read_raw_wait;
			/* Fields used for translating win keystrokes into vt100 characters */
			char[8] last_key;
			ubyte last_key_offset;
			ubyte last_key_len;
			WCHAR last_utf16_high_surrogate;
			INPUT_RECORD last_input_record;
		};
		rd_s rd;
		struct wr_s {
			/* Used for writable TTY handles */
			/* utf8-to-utf16 conversion state */
			uint utf8_codepoint;
			ubyte utf8_bytes_left;
			/* eol conversion state */
			ubyte previous_eol;
			/* ansi parser state */
			ubyte ansi_parser_state;
			ubyte ansi_csi_argc;
			ushort[4] ansi_csi_argv;
			COORD saved_position;
			WORD saved_attributes;
		};
		wr_s wr;
	};
	tty_s tty;
}
template UV_POLL_PRIVATE_FIELDS() {
	SOCKET socket;
	/* Used in fast mode */
	SOCKET peer_socket;
	AFD_POLL_INFO afd_poll_info_1;
	AFD_POLL_INFO afd_poll_info_2;
	/* Used in fast and slow mode. */
	uv_req_t poll_req_1;
	uv_req_t poll_req_2;
	ubyte submitted_events_1;
	ubyte submitted_events_2;
	ubyte mask_events_1;
	ubyte mask_events_2;
	ubyte events;
}
template UV_TIMER_PRIVATE_FIELDS() {
	RB_ENTRY!(uv_timer_s) tree_entry;
	uint64_t due;
	uint64_t repeat;
	uint64_t start_id;
	uv_timer_cb timer_cb;
}
template UV_ASYNC_PRIVATE_FIELDS() {
	uv_req_s async_req;
	uv_async_cb async_cb;
	/* char to avoid alignment issues */
	char async_sent;
}
template UV_PREPARE_PRIVATE_FIELDS() {
	uv_prepare_t* prepare_prev;
	uv_prepare_t* prepare_next;
	uv_prepare_cb prepare_cb;
}
template UV_CHECK_PRIVATE_FIELDS() {
	uv_check_t* check_prev;
	uv_check_t* check_next;
	uv_check_cb check_cb;
}
template UV_IDLE_PRIVATE_FIELDS() {
	uv_idle_t* idle_prev;
	uv_idle_t* idle_next;
	uv_idle_cb idle_cb;
}
template UV_HANDLE_PRIVATE_FIELDS() {
	uv_handle_t* endgame_next;
	uint flags;
}
template UV_GETADDRINFO_PRIVATE_FIELDS() {
	uv__work work_req;
	uv_getaddrinfo_cb getaddrinfo_cb;
	void* alloc;
	WCHAR* node;
	WCHAR* service;
	/* The addrinfoW field is used to store a pointer to the hints, and    */
	/* later on to store the result of GetAddrInfoW. The final result will */
	/* be converted to struct addrinfo* and stored in the addrinfo field.  */
	addrinfoW* addrinfow;
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
	struct exit_req_s {
		mixin UV_REQ_FIELDS;
	};
	exit_req_s exit_req;
	BYTE* child_stdio_buffer;
	int exit_signal;
	HANDLE wait_handle;
	HANDLE process_handle;
	char exit_cb_pending;
}
template UV_FS_PRIVATE_FIELDS() {
	uv__work work_req;
	int flags;
	DWORD sys_errno_;
	union file_s {
		/* TODO: remove me in 0.9. */
		WCHAR* pathw;
		int fd;
	};
	file_s file;
	union fs_s {
		struct info_s {
			int mode;
			WCHAR* new_pathw;
			int file_flags;
			int fd_out;
			uint nbufs;
			uv_buf_t* bufs;
			int64_t offset;
			uv_buf_t[4] bufsml;
		};
		info_s info;
		struct time_s {
			double atime;
			double mtime;
		};
		time_s time;
	};
	fs_s fs;
}
template UV_WORK_PRIVATE_FIELDS() {
	uv__work work_req;
}
template UV_FS_EVENT_PRIVATE_FIELDS() {
	struct req_s {
		mixin UV_REQ_FIELDS;
	};
	req_s req;
	HANDLE dir_handle;
	int req_pending;
	uv_fs_event_cb cb;
	WCHAR* filew;
	WCHAR* short_filew;
	WCHAR* dirw;
	char* buffer;
}
template UV_SIGNAL_PRIVATE_FIELDS() {
	RB_ENTRY!(uv_signal_s) tree_entry;
	uv_req_s signal_req;
	size_t pending_signum;
}
enum F_OK = 0;
enum R_OK = 4;
enum W_OK = 2;
enum X_OK = 1;
