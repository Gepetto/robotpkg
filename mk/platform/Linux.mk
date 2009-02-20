# $NetBSD: NetBSD.mk,v 1.21 2006/07/20 20:02:23 jlam Exp $
#
# Variable definitions for the Linux operating system.

ECHO_N?=	${ECHO} -n
PKGLOCALEDIR?=	share

CPP_PRECOMP_FLAGS?=	# unset
EXPORT_SYMBOLS_LDFLAGS?=-Wl,-E	# add symbols to the dynamic symbol table

_OPSYS_SHLIB_TYPE=	ELF	# shared lib type
_PATCH_CAN_BACKUP=	yes	# native patch(1) can make backups
_PATCH_BACKUP_ARG?=	-V simple -b -z 	# switch to patch(1) for backup suffix
_USE_RPATH=		yes	# add rpath to LDFLAGS

# x86_64 put system libs in lib64
ifeq (${MACHINE_ARCH},x86_64)
  SYSLIBSUFFIX?=	64
endif

# Standard commands
TRUE?=			:
FALSE?=			false
SETENV?=		env
TEST?=			test
HEAD?=			head
EXPR?=			expr
CMP?=			cmp
LS?=			ls
TEE?=			tee
WC?=			wc
ECHO?=			echo
CAT?=			cat
GZCAT?=			gzcat
BZCAT?=			bzcat
SED?=			sed
CP?=			cp
LN?=			ln
MV?=			mv
RM?=			rm
MKDIR?=			mkdir -p
DATE?=			date
SORT?=			sort
TSORT?=			tsort
AWK?=			awk
XARGS?=			xargs -r
SH?=			/bin/sh
ID?=			id
GREP?=			grep
EGREP?=			egrep
TOUCH?=			touch
CHOWN?=			chown
CHMOD?=			chmod
FIND?=			find
PERL?=			perl
PAGER?=			less
TAR?=			${PKG_TOOLS_BIN}/robotpkg_tar
PAX?=			${PKG_TOOLS_BIN}/robotpkg_pax
CVS?=			cvs
BASENAME?=		basename
PATCH?=			patch
FILE_CMD?=		file

TPUT?=			tput
TPUT_BOLD?=		bold
TPUT_RMBOLD?=		sgr0

TOOLS_INSTALL=		${ROBOTPKG_DIR}/mk/internal/install-sh
TOOLS_ECHO=		echo
TOOLS_CAT=		cat
TOOLS_TEST=		test
TOOLS_GREP=		grep
TOOLS_SORT=		sort
DEF_UMASK?=		0022
