module deimos.libuv.uv_errno;
import deimos.libuv._d;
import core.stdc.errno;

version(OSX) {
	private enum {
		ECHARSET = 4080 ,
		ENONET = 4056 , 
		ESHUTDOWN = 4042 , 
		EREMOTEIO =	4030 ,
	}
}
version(linux) {
	private enum {
		ECHARSET = 4080 ,
	}
}

extern(C) :
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
/* UV_ERRNO_H_ */
/* include(errno.h); */
enum UV__EOF = -4095;
enum UV__UNKNOWN = -4094;
enum UV__EAI_ADDRFAMILY = -3000;
enum UV__EAI_AGAIN = -3001;
enum UV__EAI_BADFLAGS = -3002;
enum UV__EAI_CANCELED = -3003;
enum UV__EAI_FAIL = -3004;
enum UV__EAI_FAMILY = -3005;
enum UV__EAI_MEMORY = -3006;
enum UV__EAI_NODATA = -3007;
enum UV__EAI_NONAME = -3008;
enum UV__EAI_OVERFLOW = -3009;
enum UV__EAI_SERVICE = -3010;
enum UV__EAI_SOCKTYPE = -3011;
enum UV__EAI_BADHINTS = -3013;
enum UV__EAI_PROTOCOL = -3014;
/* Only map to the system errno on non-Windows platforms. It's apparently
 * a fairly common practice for Windows programmers to redefine errno codes.
 */
version(Windows) {
	enum UV__E2BIG = -4093;
	enum UV__EACCES = -4092;
	enum UV__EADDRINUSE = -4091;
	enum UV__EADDRNOTAVAIL = -4090;
	enum UV__EAFNOSUPPORT = -4089;
	enum UV__EAGAIN = -4088;
	enum UV__EALREADY = -4084;
	enum UV__EBADF = -4083;
	enum UV__EBUSY = -4082;
	enum UV__ECANCELED = -4081;
	enum UV__ECHARSET = -4080;
	enum UV__ECONNABORTED = -4079;
	enum UV__ECONNREFUSED = -4078;
	enum UV__ECONNRESET = -4077;
	enum UV__EDESTADDRREQ = -4076;
	enum UV__EEXIST = -4075;
	enum UV__EFAULT = -4074;
	enum UV__EHOSTUNREACH = -4073;
	enum UV__EINTR = -4072;
	enum UV__EINVAL = -4071;
	enum UV__EIO = -4070;
	enum UV__EISCONN = -4069;
	enum UV__EISDIR = -4068;
	enum UV__ELOOP = -4067;
	enum UV__EMFILE = -4066;
	enum UV__EMSGSIZE = -4065;
	enum UV__ENAMETOOLONG = -4064;
	enum UV__ENETDOWN = -4063;
	enum UV__ENETUNREACH = -4062;
	enum UV__ENFILE = -4061;
	enum UV__ENOBUFS = -4060;
	enum UV__ENODEV = -4059;
	enum UV__ENOENT = -4058;
	enum UV__ENOMEM = -4057;
	enum UV__ENONET = -4056;
	enum UV__ENOSPC = -4055;
	enum UV__ENOSYS = -4054;
	enum UV__ENOTCONN = -4053;
	enum UV__ENOTDIR = -4052;
	enum UV__ENOTEMPTY = -4051;
	enum UV__ENOTSOCK = -4050;
	enum UV__ENOTSUP = -4049;
	enum UV__EPERM = -4048;
	enum UV__EPIPE = -4047;
	enum UV__EPROTO = -4046;
	enum UV__EPROTONOSUPPORT = -4045;
	enum UV__EPROTOTYPE = -4044;
	enum UV__EROFS = -4043;
	enum UV__ESHUTDOWN = -4042;
	enum UV__ESPIPE = -4041;
	enum UV__ESRCH = -4040;
	enum UV__EREMOTEIO = -4030;
	enum UV__ETIMEDOUT = -4039;
	enum UV__ETXTBSY = -4038;
	enum UV__EXDEV = -4037;
	enum UV__EFBIG = -4036;
	enum UV__ENOPROTOOPT = -4035;
	enum UV__ERANGE = -4034;
	enum UV__ENXIO = -4033;
	enum UV__EMLINK = -4032;
	enum UV__ENOTTY = -4029;
} else {
	enum UV__E2BIG = 0 - E2BIG;
	enum UV__EACCES = 0 - EACCES;
	enum UV__EADDRINUSE = 0 - EADDRINUSE;
	enum UV__EADDRNOTAVAIL = 0 - EADDRNOTAVAIL;
	enum UV__EAFNOSUPPORT = 0 - EAFNOSUPPORT;
	enum UV__EAGAIN = 0 - EAGAIN;
	enum UV__EALREADY = 0 - EALREADY;
	enum UV__EBADF = 0 - EBADF;
	enum UV__EBUSY = 0 - EBUSY;
	enum UV__ECANCELED = 0 - ECANCELED;
	enum UV__ECHARSET = 0 - ECHARSET;
	enum UV__ECONNABORTED = 0 - ECONNABORTED;
	enum UV__ECONNREFUSED = 0 - ECONNREFUSED;
	enum UV__ECONNRESET = 0 - ECONNRESET;
	enum UV__EDESTADDRREQ = 0 - EDESTADDRREQ;
	enum UV__EEXIST = 0 - EEXIST;
	enum UV__EFAULT = 0 - EFAULT;
	enum UV__EHOSTUNREACH = 0 - EHOSTUNREACH;
	enum UV__EINTR = 0 - EINTR;
	enum UV__EINVAL = 0 - EINVAL;
	enum UV__EIO = 0 - EIO;
	enum UV__EISCONN = 0 - EISCONN;
	enum UV__EISDIR = 0 - EISDIR;
	enum UV__ELOOP = 0 - ELOOP;
	enum UV__EMFILE = 0 - EMFILE;
	enum UV__EMSGSIZE = 0 - EMSGSIZE;
	enum UV__ENAMETOOLONG = 0 - ENAMETOOLONG;
	enum UV__ENETDOWN = 0 - ENETDOWN;
	enum UV__ENETUNREACH = 0 - ENETUNREACH;
	enum UV__ENFILE = 0 - ENFILE;
	enum UV__ENOBUFS = 0 - ENOBUFS;
	enum UV__ENODEV = 0 - ENODEV;
	enum UV__ENOENT = 0 - ENOENT;
	enum UV__ENOMEM = 0 - ENOMEM;
	enum UV__ENONET = 0 - ENONET;
	enum UV__ENOSPC = 0 - ENOSPC;
	enum UV__ENOSYS = 0 - ENOSYS;
	enum UV__ENOTCONN = 0 - ENOTCONN;
	enum UV__ENOTDIR = 0 - ENOTDIR;
	enum UV__ENOTEMPTY = 0 - ENOTEMPTY;
	enum UV__ENOTSOCK = 0 - ENOTSOCK;
	enum UV__ENOTSUP = 0 - ENOTSUP;
	enum UV__EPERM = 0 - EPERM;
	enum UV__EPIPE = 0 - EPIPE;
	enum UV__EPROTO = 0 - EPROTO;
	enum UV__EPROTONOSUPPORT = 0 - EPROTONOSUPPORT;
	enum UV__EPROTOTYPE = 0 - EPROTOTYPE;
	enum UV__EROFS = 0 - EROFS;
	enum UV__ESHUTDOWN = 0 - ESHUTDOWN;
	enum UV__ESPIPE = 0 - ESPIPE;
	enum UV__ESRCH = 0 - ESRCH;
	enum UV__EREMOTEIO = 0 - EREMOTEIO;
	enum UV__ETIMEDOUT = 0 - ETIMEDOUT;
	enum UV__ETXTBSY = -0 - ETXTBSY;
	enum UV__EXDEV = 0 - EXDEV;
	enum UV__EFBIG = 0 - EFBIG;
	enum UV__ENOPROTOOPT = 0 - ENOPROTOOPT;
	enum UV__ERANGE = 0 - ERANGE;
	enum UV__ENXIO = 0 - ENXIO;
	enum UV__EMLINK = 0 - EMLINK;
	enum UV__ENOTTY = 0 - ENOTTY;
}

/* EHOSTDOWN is not visible on BSD-like systems when _POSIX_C_SOURCE is
 * defined. Fortunately, its value is always 64 so it's possible albeit
 * icky to hard-code it.
 */
version( linux ) {
	enum UV__EHOSTDOWN = -EHOSTDOWN;
} else static if( isMacOS || isBsdOS ) {
	enum UV__EHOSTDOWN = -64;
} else {
	enum UV__EHOSTDOWN = -4031;
}
