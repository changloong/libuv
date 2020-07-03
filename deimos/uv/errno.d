module deimos.uv.errno;

version (OSX)
	version = Darwin;
else version (iOS)
	version = Darwin;
else version (TVOS)
	version = Darwin;
else version (WatchOS)
	version = Darwin;

version(linux) public import deimos.uv.errno_linux;
version(Darwin) public import deimos.uv.errno_darwin;
version(FreeBSD) public import deimos.uv.errno_bsd;
version(Windows) public import deimos.uv.errno_win;

enum {
  /* Used by all handles. */
  UV_HANDLE_CLOSING                     = 0x00000001,
  UV_HANDLE_CLOSED                      = 0x00000002,
  UV_HANDLE_ACTIVE                      = 0x00000004,
  UV_HANDLE_REF                         = 0x00000008,
  UV_HANDLE_INTERNAL                    = 0x00000010,
  UV_HANDLE_ENDGAME_QUEUED              = 0x00000020,

  /* Used by streams. */
  UV_HANDLE_LISTENING                   = 0x00000040,
  UV_HANDLE_CONNECTION                  = 0x00000080,
  UV_HANDLE_SHUTTING                    = 0x00000100,
  UV_HANDLE_SHUT                        = 0x00000200,
  UV_HANDLE_READ_PARTIAL                = 0x00000400,
  UV_HANDLE_READ_EOF                    = 0x00000800,

  /* Used by streams and UDP handles. */
  UV_HANDLE_READING                     = 0x00001000,
  UV_HANDLE_BOUND                       = 0x00002000,
  UV_HANDLE_READABLE                    = 0x00004000,
  UV_HANDLE_WRITABLE                    = 0x00008000,
  UV_HANDLE_READ_PENDING                = 0x00010000,
  UV_HANDLE_SYNC_BYPASS_IOCP            = 0x00020000,
  UV_HANDLE_ZERO_READ                   = 0x00040000,
  UV_HANDLE_EMULATE_IOCP                = 0x00080000,
  UV_HANDLE_BLOCKING_WRITES             = 0x00100000,
  UV_HANDLE_CANCELLATION_PENDING        = 0x00200000,

  /* Used by uv_tcp_t and uv_udp_t handles */
  UV_HANDLE_IPV6                        = 0x00400000,

  /* Only used by uv_tcp_t handles. */
  UV_HANDLE_TCP_NODELAY                 = 0x01000000,
  UV_HANDLE_TCP_KEEPALIVE               = 0x02000000,
  UV_HANDLE_TCP_SINGLE_ACCEPT           = 0x04000000,
  UV_HANDLE_TCP_ACCEPT_STATE_CHANGING   = 0x08000000,
  UV_HANDLE_TCP_SOCKET_CLOSED           = 0x10000000,
  UV_HANDLE_SHARED_TCP_SOCKET           = 0x20000000,
  UV_HANDLE_TCP_FASTOPEN                = 0x40000000,

  /* Only used by uv_udp_t handles. */
  UV_HANDLE_UDP_PROCESSING              = 0x01000000,
  UV_HANDLE_UDP_CONNECTED               = 0x02000000,

  /* Only used by uv_pipe_t handles. */
  UV_HANDLE_NON_OVERLAPPED_PIPE         = 0x01000000,
  UV_HANDLE_PIPESERVER                  = 0x02000000,

  /* Only used by uv_tty_t handles. */
  UV_HANDLE_TTY_READABLE                = 0x01000000,
  UV_HANDLE_TTY_RAW                     = 0x02000000,
  UV_HANDLE_TTY_SAVED_POSITION          = 0x04000000,
  UV_HANDLE_TTY_SAVED_ATTRIBUTES        = 0x08000000,

  /* Only used by uv_signal_t handles. */
  UV_SIGNAL_ONE_SHOT_DISPATCHED         = 0x01000000,
  UV_SIGNAL_ONE_SHOT                    = 0x02000000,

  /* Only used by uv_poll_t handles. */
  UV_HANDLE_POLL_SLOW                   = 0x01000000
};

