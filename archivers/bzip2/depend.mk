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
BZIP2_DEPEND_MK:=	${BZIP2_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		bzip2
endif

ifeq (+,$(BZIP2_DEPEND_MK))
PREFER.bzip2?=		system

SYSTEM_SEARCH.bzip2=	\
	bin/bzip2	\
	include/bzlib.h	\
	lib/libbz2.*

  # pull-in the user preferences for bzip2 now
  include ../../mk/robotpkg.prefs.mk

  ifeq (inplace+robotpkg,$(strip $(BZIP2_STYLE)+$(PREFER.bzip2)))
  # This is the "inplace" version of bzip2 package, for bootstrap process
  #
BZIP2_FILESDIR=	${PKGSRCDIR}/archivers/bzip2/dist
BZIP2_SRCDIR=	${WRKDIR}/bzip2

CPPFLAGS+=	-I${BZIP2_SRCDIR}
LDFLAGS+=	-L${BZIP2_SRCDIR}
LIBS+=		-lbz2

post-extract: bzip2-extract
bzip2-extract:
	${CP} -Rp ${BZIP2_FILESDIR} ${BZIP2_SRCDIR}

pre-configure: bzip2-build
bzip2-build:
	${RUN}								\
	cd ${BZIP2_SRCDIR} && 						\
	${SETENV} AWK="${AWK}" CC="${CC}" CFLAGS="${CFLAGS} ${CPPFLAGS}"\
		${MAKE_PROGRAM} libbz2.a
  else
  # This is the regular version of bzip2 package, for normal install
  #
DEPEND_USE+=		bzip2

DEPEND_ABI.bzip2?=	bzip2>=1.0.5
DEPEND_DIR.bzip2?=	../../archivers/bzip2

DEPEND_LIBS.bzip2+=	-lbz2
  endif
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
