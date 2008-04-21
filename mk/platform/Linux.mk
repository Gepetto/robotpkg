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
CHMOD?=			chmod
FIND?=			find
PERL?=			perl
TAR?=			${PKG_TOOLS_BIN}/robotpkg_tar
PAX?=			${PKG_TOOLS_BIN}/robotpkg_pax
CVS?=			cvs
BASENAME?=		basename
PATCH?=			patch
FILE_CMD?=		file

TOOLS_INSTALL=		${PKGSRCDIR}/mk/internal/install-sh
TOOLS_ECHO=		echo
TOOLS_CAT=		cat
TOOLS_TEST=		test
TOOLS_GREP=		grep
TOOLS_SORT=		sort
DEF_UMASK?=		0022
