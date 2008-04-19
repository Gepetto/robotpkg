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
ZLIB_DEPEND_MK:=	${ZLIB_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		zlib
endif

ifeq (+,$(ZLIB_DEPEND_MK))
PREFER.zlib?=		system

SYSTEM_SEARCH.zlib=	\
	include/zlib.h	\
	include/zconf.h	\
	lib/libz.*

  # pull-in the user preferences for zlib now
  include ../../mk/robotpkg.prefs.mk

  ifeq (inplace+robotpkg,$(strip $(ZLIB_STYLE)+$(PREFER.zlib)))
  # This is the "inplace" version of zlib package, for bootstrap process
  #
ZLIB_FILESDIR=	${PKGSRCDIR}/archivers/zlib/dist
ZLIB_SRCDIR=	${WRKDIR}/zlib

CPPFLAGS+=	-I${ZLIB_SRCDIR}
LDFLAGS+=	-L${ZLIB_SRCDIR} -lz

post-extract: zlib-extract
zlib-extract:
	${CP} -Rp ${ZLIB_FILESDIR} ${ZLIB_SRCDIR}

pre-configure: zlib-build
zlib-build:
	${RUN}								\
	cd ${ZLIB_SRCDIR} && 						\
	${SETENV} AWK="${AWK}" CC="${CC}" CFLAGS="${CFLAGS} ${CPPFLAGS}"\
		${MAKE_PROGRAM} libz.a
  else
  # This is the regular version of zlib package, for normal install
  #
DEPEND_USE+=		zlib

DEPEND_ABI.zlib?=	zlib>=1.2.3
DEPEND_DIR.zlib?=	../../archivers/zlib

DEPEND_LIBS.zlib+=	-lz
  endif
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
