#
# Variable definitions for the NetBSD operating system.

ECHO_N?=	${ECHO} -n
PKGLOCALEDIR?=	share

CPP_PRECOMP_FLAGS?=	# unset
EXPORT_SYMBOLS_LDFLAGS?=-Wl,-E	# add symbols to the dynamic symbol table

_OPSYS_SHLIB_TYPE=	ELF	# shared lib type
_USE_RPATH=		yes	# add rpath to LDFLAGS

# Standard commands
$(call setdefault, TRUE,	:)
$(call setdefault, FALSE,	false)
$(call setdefault, TEST,	test)
$(call setdefault, ECHO,	echo)
$(call setdefault, SH,		/bin/sh)
$(call setdefault, CAT,		/bin/cat)
$(call setdefault, SETENV,	/usr/bin/env)
$(call setdefault, EXPR,	/bin/expr)
$(call setdefault, CMP,		/usr/bin/cmp)
$(call setdefault, LS,		/bin/ls)
$(call setdefault, WC,		/usr/bin/wc)
$(call setdefault, TOUCH,	/usr/bin/touch)
$(call setdefault, CHOWN,	/usr/sbin/chown)
$(call setdefault, CHMOD,	/bin/chmod)
$(call setdefault, CP,		/bin/cp)
$(call setdefault, LN,		/bin/ln)
$(call setdefault, MV,		/bin/mv)
$(call setdefault, RM,		/bin/rm)
$(call setdefault, RMDIR,	/bin/rmdir)
$(call setdefault, MKDIR,	/bin/mkdir -p)
$(call setdefault, DATE,	/bin/date)
$(call setdefault, ID,		/usr/bin/id)
$(call setdefault, GREP,	/usr/bin/grep)
$(call setdefault, EGREP,	/usr/bin/egrep)
$(call setdefault, FIND,	/usr/bin/find)
$(call setdefault, SED,		/usr/bin/sed)
$(call setdefault, SORT,	/usr/bin/sort)
$(call setdefault, TSORT,	/usr/bin/tsort)
$(call setdefault, AWK,		/usr/bin/awk)
$(call setdefault, BASENAME,	/usr/bin/basename)
$(call setdefault, XARGS,	/usr/bin/xargs)
$(call setdefault, TPUT,	/usr/bin/tput)
$(call setdefault, PAGER,	/usr/bin/less)
$(call setdefault, TAR,		${PKG_TOOLS_BIN}/robotpkg_tar)
$(call setdefault, PAX,		${PKG_TOOLS_BIN}/robotpkg_pax)

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

TPUT_BOLD?=		md
TPUT_RMBOLD?=		me
