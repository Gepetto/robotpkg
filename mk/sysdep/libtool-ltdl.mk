#
# Copyright (c) 2009 LAAS/CNRS
# All rights reserved.
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without   fee is hereby granted, provided   that the above  copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS  SOFTWARE INCLUDING ALL  IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR  BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR  ANY DAMAGES WHATSOEVER RESULTING  FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION,   ARISING OUT OF OR IN    CONNECTION WITH THE USE   OR
# PERFORMANCE OF THIS SOFTWARE.
#
#                                             Thomas Moulard on Thu Nov 19 2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
LIBTOOL_LTDL_DEPEND_MK:=	${LIBTOOL_LTDL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
endif

ifeq (+,$(LIBTOOL_LTDL_DEPEND_MK)) # -------------------------------------------

include ../../mk/robotpkg.prefs.mk
PREFER.libtool-ltdl?=		${PREFER.libtool}
ifneq (${PREFER.libtool-ltdl},${PREFER.libtool})
 PKG_FAIL_REASON+=\
       "PREFER.libtool-ltdl and PREFER.libtool must be set to the same value."
endif

DEPEND_USE+=				libtool-ltdl
DEPEND_ABI.libtool-ltdl?=		libtool-ltdl>=1.5.22

SYSTEM_PKG.Linux-fedora.libtool-ltdl=   libtool-ltdl-devel
SYSTEM_PKG.Linux-ubuntu.libtool-ltdl=	libltdl3-dev
SYSTEM_PKG.Linux-debian.libtool-ltdl=	libltdl3-dev
SYSTEM_PKG.NetBSD.libtool-ltdl=         pkgsrc/devel/libltdl

SYSTEM_SEARCH.libtool-ltdl=\
	'bin/libtool:/libtool/{s/^[^0-9]*//;s/[^.0-9].*$$//;p;}:% --version'	\
	'include/ltdl.h'						  	\
	'lib/libltdl.so'

include ../../pkgtools/libtool/depend.mk

endif # LIBTOOL_LTDL_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
