module deimos.libuv.uv_errno;
import deimos.libuv._d;
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
enum UV__ETIMEDOUT = -4039;
enum UV__ETXTBSY = -4038;
enum UV__EXDEV = -4037;
enum UV__EFBIG = -4036;
enum UV__ENOPROTOOPT = -4035;
enum UV__ERANGE = -4034;
enum UV__ENXIO = -4033;
enum UV__EMLINK = -4032;
/* EHOSTDOWN is not visible on BSD-like systems when _POSIX_C_SOURCE is
 * defined. Fortunately, its value is always 64 so it's possible albeit
 * icky to hard-code it.
 */
static if( isEHOSTDOWN ) {
	enum UV__EHOSTDOWN = -EHOSTDOWN;
} else static if( isMacOS || isBsdOS ) {
	enum UV__EHOSTDOWN = -64;
} else {
	enum UV__EHOSTDOWN = -4031;
}
