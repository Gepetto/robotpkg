# $NetBSD: NetBSD.mk,v 1.21 2006/07/20 20:02:23 jlam Exp $
#
# Variable definitions for the Linux operating system.

ECHO_N?=	${ECHO} -n
PKGLOCALEDIR?=	share

CPP_PRECOMP_FLAGS?=	# unset
EXPORT_SYMBOLS_LDFLAGS?=-Wl,-E	# add symbols to the dynamic symbol table

_OPSYS_SHLIB_TYPE=	ELF	# shared lib type
_USE_RPATH=		yes	# add rpath to LDFLAGS

# x86_64 put system libs in lib64
ifeq (${MACHINE_ARCH},x86_64)
  SYSLIBSUFFIX?=	64
endif

# Standard commands
$(call setdefault, TRUE,	:)
$(call setdefault, FALSE,	false)
$(call setdefault, TEST,	test)
$(call setdefault, ECHO,	echo)
$(call setdefault, SH,		/bin/sh)
$(call setdefault, CAT,		/bin/cat)
$(call setdefault, SETENV,	/usr/bin/env)
$(call setdefault, EXPR,	/usr/bin/expr)
$(call setdefault, CMP,		/usr/bin/cmp)
$(call setdefault, LS,		/bin/ls)
$(call setdefault, WC,		/usr/bin/wc)
$(call setdefault, TOUCH,	/bin/touch)
$(call setdefault, CHOWN,	/bin/chown)
$(call setdefault, CHMOD,	/bin/chmod)
$(call setdefault, CP,		/bin/cp)
$(call setdefault, LN,		/bin/ln)
$(call setdefault, MV,		/bin/mv)
$(call setdefault, RM,		/bin/rm)
$(call setdefault, RMDIR,	/bin/rmdir)
$(call setdefault, MKDIR,	/bin/mkdir -p)
$(call setdefault, DATE,	/bin/date)
$(call setdefault, ID,		/usr/bin/id)
$(call setdefault, GREP,	/bin/grep)
$(call setdefault, EGREP,	/bin/egrep)
$(call setdefault, FIND,	/usr/bin/find)
$(call setdefault, SED,		/bin/sed)
$(call setdefault, SORT,\
	$(firstword $(realpath $(addsuffix /sort,/bin /usr/bin))))
$(call setdefault, TSORT,	/usr/bin/tsort)
$(call setdefault, AWK,		/usr/bin/awk)
$(call setdefault, BASENAME,\
	$(firstword $(realpath $(addsuffix /basename,/bin /usr/bin))))
$(call setdefault, XARGS,	/usr/bin/xargs -r)
$(call setdefault, TPUT,	/usr/bin/tput)
$(call setdefault, PAGER,	/usr/bin/less)
$(call setdefault, TAR,		${PKG_TOOLS_BIN}/robotpkg_tar)

PATCH?=			patch
FILE_CMD?=		file

GZCAT?=			gzcat
BZCAT?=			bzcat

TOOLS_INSTALL=		${ROBOTPKG_DIR}/mk/internal/install-sh
TOOLS_ECHO=		echo
TOOLS_CAT=		cat
TOOLS_TEST=		test
TOOLS_GREP=		grep
TOOLS_SORT=		sort
DEF_UMASK?=		0022

TPUT_BOLD?=		bold
TPUT_RMBOLD?=		sgr0
