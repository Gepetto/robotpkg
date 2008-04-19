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
LIBARCHIVE_DEPEND_MK:=	${LIBARCHIVE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libarchive
endif

ifeq (+,$(LIBARCHIVE_DEPEND_MK))
PREFER.libarchive?=		system

SYSTEM_SEARCH.libarchive=	\
	include/archive.h	\
	lib/libarchive.*

  # pull-in the user preferences for libarchive now
  include ../../mk/robotpkg.prefs.mk

  ifeq (inplace+robotpkg,$(strip $(LIBARCHIVE_STYLE)+$(PREFER.libarchive)))
  # This is the "inplace" version of libarchive package, for bootstrap process
  #
LIBARCHIVE_FILESDIR=	${PKGSRCDIR}/archivers/libarchive/dist
LIBARCHIVE_SRCDIR=	${WRKDIR}/libarchive

CPPFLAGS+=	-I${LIBARCHIVE_SRCDIR}/libarchive
LDFLAGS+=	-L${LIBARCHIVE_SRCDIR}/.libs
LIBS+=		-larchive

post-extract: libarchive-extract
libarchive-extract:
	@${STEP_MSG} "Extracting libarchive in place"
	${CP} -Rp ${LIBARCHIVE_FILESDIR} ${LIBARCHIVE_SRCDIR}
	${TOUCH} ${LIBARCHIVE_SRCDIR}/aclocal.m4

pre-configure: libarchive-build
libarchive-build:
	@${STEP_MSG} "Building libarchive in place"
	${RUN}								\
	cd ${LIBARCHIVE_SRCDIR} && 					\
	${SETENV} AWK="${AWK}" CC="${CC}" CFLAGS="${CFLAGS}"		\
		CPPFLAGS="${CPPFLAGS}"					\
		${CONFIG_SHELL} ./configure -C --disable-shared		\
		--disable-bsdtar --disable-dependency-tracking		\
	&& ${MAKE_PROGRAM}
  else
  # This is the regular version of libarchive package, for normal install
  #
DEPEND_USE+=		libarchive

DEPEND_ABI.libarchive?=	libarchive>=2.5.0b
DEPEND_DIR.libarchive?=	../../archivers/libarchive

DEPEND_LIBS.libarchive+=-larchive
  endif

  include ../../archivers/bzip2/depend.mk
  include ../../archivers/zlib/depend.mk
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
