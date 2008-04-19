#
# Copyright (c) 2008 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice,  this list of  conditions and  the following disclaimer in
#      the  documentation   and/or  other  materials   provided with  the
#      distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE  AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY  EXPRESS OR IMPLIED WARRANTIES, INCLUDING,  BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES   OF MERCHANTABILITY AND  FITNESS  FOR  A PARTICULAR
# PURPOSE ARE DISCLAIMED.  IN NO  EVENT SHALL THE AUTHOR OR  CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT,  INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING,  BUT  NOT LIMITED TO, PROCUREMENT  OF
# SUBSTITUTE  GOODS OR SERVICES;  LOSS   OF  USE,  DATA, OR PROFITS;   OR
# BUSINESS  INTERRUPTION) HOWEVER CAUSED AND  ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE  USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

# Authored by Anthony Mallet on Sat Apr 19 2008

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBFETCH_DEPEND_MK:=	${LIBFETCH_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libfetch
endif

ifeq (+,$(LIBFETCH_DEPEND_MK))
  ifeq (inplace,$(LIBFETCH_STYLE))
# This is the "inplace" version of libfetch package, for bootstrap process
#
LIBFETCH_FILESDIR=	${PKGSRCDIR}/net/libfetch/dist
LIBFETCH_SRCDIR=	${WRKDIR}/libfetch

CPPFLAGS+=	-I${LIBFETCH_SRCDIR}
LDFLAGS+=	-L${LIBFETCH_SRCDIR} -lfetch

post-extract: libfetch-extract
libfetch-extract:
	${CP} -Rp ${LIBFETCH_FILESDIR} ${LIBFETCH_SRCDIR}

pre-configure: libfetch-build
libfetch-build:
	${RUN}								\
	cd ${LIBFETCH_SRCDIR} && 					\
	${SETENV} AWK="${AWK}" CC="${CC}" CFLAGS="${CFLAGS}"		\
		CPPFLAGS="${CPPFLAGS}" ${MAKE_PROGRAM} depend all
  else
# This is the regular version of libfetch package, for normal install
#
PREFER.libfetch?=	robotpkg

DEPEND_USE+=		libfetch

DEPEND_ABI.libfetch?=	libfetch>=2.4
DEPEND_DIR.libfetch?=	../../net/libfetch

DEPEND_LIBS.libfetch+=	-lfetch

SYSTEM_SEARCH.libfetch=	\
	include/fetch.h	\
	lib/libfetch.a
  endif
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
