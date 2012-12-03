#
# Copyright (c) 2006-2012 LAAS/CNRS
# Copyright (c) 1994-2006 The NetBSD Foundation, Inc.
# All rights reserved.
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
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
#   3. All  advertising materials  mentioning  features  or  use of  this
#      software must display  the following acknowledgement: This product
#      includes software  developed by  the  NetBSD Foundation, Inc.  and
#      its contributors.
#   4. Neither the  name  of The NetBSD Foundation  nor the names  of its
#      contributors  may be  used to endorse or promote  products derived
#      from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHORS AND CONTRIBUTORS ``AS IS'' AND
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
# From $NetBSD: plist.mk,v 1.18 2006/11/05 15:10:08 joerg Exp $
#
#                                       Anthony Mallet on Thu Dec  7 2006

#
# This Makefile fragment handles the creation of PLISTs for use by
# pkg_create(8).
#
# The following variables affect the PLIST generation:
#
#    PLIST_SRC is the source file(s) for the generated PLIST file.  By
#	default, its value is constructed from the PLIST.* files within
#	the package directory.
#
#    GENERATE_PLIST is a sequence of commands, terminating in a semicolon,
#	that outputs contents for a PLIST to stdout and is appended to
#	the contents of ${PLIST_SRC}.
#
#    IGNORE_INFO_DIRS is a list of ${PREFIX}-relative paths that do
#	*not* contain info files.
#

# --------------------------------------------------------------------

# PLIST_SRC is the source file for the generated PLIST file.  If PLIST_SRC
# is not explicitly defined, then build one up from various PLIST.* files
# that are present in the package directory.  The order goes (if the files
# are present):
#
#	PLIST.${OPSYS}			(e.g., PLIST.NetBSD)
#	PLIST.${MACHINE_ARCH}		(e.g,, PLIST.macppc)
#	PLIST.${OPSYS}-${MACHINE_ARCH}	(e.g., PLIST.NetBSD-macppc)
#	PLIST
#
ifndef PLIST_SRC
  ifneq (${OS_KERNEL},${OPSYS})
    ifeq (yes,$(call exists,${PKGDIR}/PLIST.${OS_KERNEL}))
      PLIST_SRC+=	${PKGDIR}/PLIST.${OS_KERNEL}
    endif
  endif
  ifeq (yes,$(call exists,${PKGDIR}/PLIST.${OPSYS}))
    PLIST_SRC+=	${PKGDIR}/PLIST.${OPSYS}
  endif
  ifeq (yes,$(call exists,${PKGDIR}/PLIST.${MACHINE_ARCH}))
    PLIST_SRC+=	${PKGDIR}/PLIST.${MACHINE_ARCH}
  endif
  ifeq (yes,$(call exists,${PKGDIR}/PLIST.${OPSYS}-${MACHINE_ARCH}))
    PLIST_SRC+=	${PKGDIR}/PLIST.${OPSYS}-${MACHINE_ARCH}
  endif
  ifeq (yes,$(call exists,${PKGDIR}/PLIST))
    PLIST_SRC+=	${PKGDIR}/PLIST
  endif
endif # !PLIST_SRC

# --------------------------------------------------------------------

_LIBTOOL_EXPAND=							\
	${SETENV} ECHO=$(call quote,${TOOLS_ECHO})			\
		GREP=$(call quote,${TOOLS_GREP})			\
		SORT=$(call quote,${TOOLS_SORT})			\
		TEST=$(call quote,${TOOLS_TEST})			\
	${SH} ${CURDIR}/../../mk/plist/libtool-expand

# _PLIST_AWK_ENV holds the shell environment passed to the awk script
# that does post-processing of the PLIST.  See the individual *.awk
# scripts for information on each of the variable set in the environment.
#
_PLIST_AWK_ENV+=	PKGLOCALEDIR=$(call quote,${PKGLOCALEDIR})
_PLIST_AWK_ENV+=	USE_PKGLOCALEDIR=${USE_PKGLOCALEDIR}
_PLIST_AWK_ENV+=	IMAKE_MANINSTALL=$(call quote,${_IMAKE_MANINSTALL})
_PLIST_AWK_ENV+=	IGNORE_INFO_PATH=$(call quote,${_IGNORE_INFO_PATH})
_PLIST_AWK_ENV+=	PKGINFODIR=$(call quote,${PKGINFODIR})
_PLIST_AWK_ENV+=	IGNORE_LIBTOOLIZE=$(call quote,${IGNORE_LIBTOOLIZE})
_PLIST_AWK_ENV+=	LIBTOOLIZE_PLIST=$(call quote,${LIBTOOLIZE_PLIST})
_PLIST_AWK_ENV+=	LIBTOOL_EXPAND=$(call quote,${_LIBTOOL_EXPAND})
_PLIST_AWK_ENV+=	LS=$(call quote,${TOOLS_LS})
_PLIST_AWK_ENV+=	MANINSTALL=$(call quote,${MANINSTALL})
_PLIST_AWK_ENV+=	MANZ=$(call quote,${_MANZ})
_PLIST_AWK_ENV+=	PKGMANDIR=$(call quote,${PKGMANDIR})
_PLIST_AWK_ENV+=	PREFIX=$(call quote,${PREFIX})
_PLIST_AWK_ENV+=	TEST=$(call quote,${TOOLS_TEST})

# PLIST_SUBST contains package-settable "${variable}" to "value"
# substitutions for PLISTs
#
PLIST_SUBST+=	\
	PLIST_OPSYS=$(call quote,${OPSYS})				\
	PLIST_OS_VERSION=$(call quote,${OS_VERSION})			\
	PLIST_OS_KERNEL=$(call quote,${OS_KERNEL})			\
	PLIST_OS_KERNEL_VERSION=$(call quote,${OS_KERNEL_VERSION})	\
	PLIST_NODENAME=$(call quote,${NODENAME})			\
	PLIST_MACHINE_ARCH=$(call quote,${MACHINE_ARCH})		\
	PLIST_MACHINE_GNU_ARCH=$(call quote,${MACHINE_GNU_ARCH})	\
	PLIST_MACHINE_GNU_PLATFORM=$(call quote,${MACHINE_GNU_PLATFORM})\
	PLIST_LN=$(call quote,${LN})					\
	PLIST_LOWER_VENDOR=$(call quote,${LOWER_VENDOR})		\
	PLIST_LOWER_OPSYS=$(call quote,${LOWER_OPSYS})			\
	PLIST_LOWER_OS_VERSION=$(call quote,${LOWER_OS_VERSION})	\
	PLIST_PKGBASE=$(call quote,${PKGBASE})				\
	PLIST_PKGNAME=$(call quote,${PKGNAME_NOREV})			\
	PLIST_PKGLOCALEDIR=$(call quote,${PKGLOCALEDIR})		\
	PLIST_PKGMANDIR=$(call quote,${PKGMANDIR})			\
	PLIST_PKGINFODIR=$(call quote,${PKGINFODIR})			\
	PLIST_PKGVERSION=$(call quote,${PKGVERSION_NOREV})		\
	PLIST_LOCALBASE=$(call quote,${LOCALBASE})			\
	PLIST_CHGRP=$(call quote,${CHGRP})				\
	PLIST_CHMOD=$(call quote,${CHMOD})				\
	PLIST_CHOWN=$(call quote,${CHOWN})				\
	PLIST_MKDIR=$(call quote,${MKDIR})				\
	PLIST_RMDIR=$(call quote,${RMDIR})				\
	PLIST_RM=$(call quote,${RM})					\
	PLIST_TRUE=$(call quote,${TRUE})				\
	PLIST_PKGMANDIR=$(call quote,${PKGMANDIR})

PLIST_SUBST+=$(foreach \
	_v_,${PLIST_VARS},PLIST.${_v_}=$(call quote,${PLIST.${_v_}}))
PLIST_SUBST+=$(foreach \
	_v_,${PLIST_VARS},PLIST.no${_v_}=$(call quote,${PLIST.no${_v_}}))


# Pass the PLIST_SUBST substitutions to the subst.awk script by prepending
# PLIST_" to all of the variable names and adding them into the environment.
#
_PLIST_AWK_ENV+=	${PLIST_SUBST}
_PLIST_AWK_ENV+=	PLIST_SUBST_VARS=$(call quote,$(foreach _s_,${PLIST_SUBST},$(firstword $(subst =, ,${_s_}))))

_PLIST_AWK+=		-f ${ROBOTPKG_DIR}/mk/plist/plist-functions.awk
_PLIST_AWK+=		-f ${ROBOTPKG_DIR}/mk/plist/plist-subst.awk
_PLIST_AWK+=		-f ${ROBOTPKG_DIR}/mk/plist/plist-locale.awk
_PLIST_AWK+=		-f ${ROBOTPKG_DIR}/mk/plist/plist-info.awk
_PLIST_AWK+=		-f ${ROBOTPKG_DIR}/mk/plist/plist-libtool.awk
_PLIST_AWK+=		-f ${ROBOTPKG_DIR}/mk/plist/plist-cleanpath.awk
_PLIST_AWK+=		-f ${ROBOTPKG_DIR}/mk/plist/plist-default.awk

_SHLIB_AWKFILE.ELF=	${ROBOTPKG_DIR}/mk/plist/shlib-elf.awk
_SHLIB_AWKFILE.dylib=	${ROBOTPKG_DIR}/mk/plist/shlib-dylib.awk
ifdef _OPSYS_SHLIB_TYPE
  _PLIST_SHLIB_AWK=	-f ${_SHLIB_AWKFILE.$(strip ${_OPSYS_SHLIB_TYPE})}
else
  _PLIST_SHLIB_AWK=	-f ${_SHLIB_AWKFILE.ELF}
endif


# --- plist ----------------------------------------------------------------

# GENERATE_PLIST is a sequence of commands, terminating in a semicolon,
#	that outputs contents for a PLIST to stdout and is appended to
#	the contents of ${PLIST_SRC}.
#
ifneq (,$(strip ${DYNAMIC_PLIST_DIRS}))
  GENERATE_PLIST+=							\
	${FIND} $(addprefix ${PREFIX}/,${DYNAMIC_PLIST_DIRS})		\
		 \( -type f -o -type l \) -print | ${SORT}		\
		| ${SED} -e "s,${PREFIX}/,,g";
endif

ifeq (,$(strip $(PLIST_SRC)))
GENERATE_PLIST?=  ${ECHO} "@comment "$(call quote,${PKGNAME})" has no files.";
else
GENERATE_PLIST?=  ${TRUE};
endif

_GENERATE_PLIST=	${CAT} /dev/null ${PLIST_SRC}; ${GENERATE_PLIST}

_PLIST_TARGETS+=	${PLIST}
_PLIST_TARGETS+=	post-plist

.PHONY: plist
plist: ${_PLIST_TARGETS}

${PLIST}: ${PLIST_SRC}
	${RUN}${MKDIR} $(dir $@);				\
	{ ${_GENERATE_PLIST} } >$@.src;				\
	${SETENV} ${_PLIST_AWK_ENV} ${AWK} ${_PLIST_AWK}	\
		<$@.src >$@.p1;					\
	${SETENV} ${_PLIST_AWK_ENV} ${AWK} ${_PLIST_SHLIB_AWK}	\
		<$@.p1 >$@

.PHONY: post-plist
post-plist:

${PLIST_SRC}:;
