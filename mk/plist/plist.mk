# $NetBSD: plist.mk,v 1.18 2006/11/05 15:10:08 joerg Exp $
#
# This Makefile fragment handles the creation of PLISTs for use by
# pkg_create(8).
#
# The following variables affect the PLIST generation:
#
#    PLIST_TYPE specifies whether the generated PLIST is derived
#	automatically from the installed files, or if the PLIST entries
#	are listed in files.  Valid values are "dynamic" and "static",
#	and the default value is "static".
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

PLIST_TYPE?=	static

######################################################################

# PLIST_SRC is the source file for the generated PLIST file.  If PLIST_SRC
# is not explicitly defined, then build one up from various PLIST.* files
# that are present in the package directory.  The order goes (if the files
# are present):
#
#	PLIST.common
#	PLIST.${OPSYS}			(e.g., PLIST.NetBSD)
#	PLIST.${MACHINE_ARCH}		(e.g,, PLIST.macppc)
#	PLIST.${OPSYS}-${MACHINE_ARCH}	(e.g., PLIST.NetBSD-macppc)
#	PLIST
#	PLIST.common_end
#
ifndef PLIST_SRC
  ifeq (yes,$(call exists,${PKGDIR}/PLIST))
PLIST_SRC+=	${PKGDIR}/PLIST
  endif
endif # !PLIST_SRC

# This is the path to the generated PLIST file.
PLIST=		${WRKDIR}/.PLIST

######################################################################

_LIBTOOL_EXPAND=							\
	${SETENV} ECHO=${TOOLS_ECHO:Q} GREP=${TOOLS_GREP:Q}		\
		SORT=${TOOLS_SORT:Q} TEST=${TOOLS_TEST:Q}		\
	${SH} ${.CURDIR}/../../mk/plist/libtool-expand

# _PLIST_AWK_ENV holds the shell environment passed to the awk script
# that does post-processing of the PLIST.  See the individual *.awk
# scripts for information on each of the variable set in the environment.
#
_PLIST_AWK_ENV+=	PKGLOCALEDIR=${PKGLOCALEDIR:Q}
_PLIST_AWK_ENV+=	USE_PKGLOCALEDIR=${USE_PKGLOCALEDIR:Dyes:Uno}
_PLIST_AWK_ENV+=	IMAKE_MANINSTALL=${_IMAKE_MANINSTALL:Q}
_PLIST_AWK_ENV+=	IGNORE_INFO_PATH=${_IGNORE_INFO_PATH:Q}
_PLIST_AWK_ENV+=	PKGINFODIR=${PKGINFODIR:Q}
_PLIST_AWK_ENV+=	IGNORE_LIBTOOLIZE=${IGNORE_LIBTOOLIZE:Q}
_PLIST_AWK_ENV+=	LIBTOOLIZE_PLIST=${LIBTOOLIZE_PLIST:Q}
_PLIST_AWK_ENV+=	LIBTOOL_EXPAND=${_LIBTOOL_EXPAND:Q}
_PLIST_AWK_ENV+=	LS=${TOOLS_LS:Q}
_PLIST_AWK_ENV+=	MANINSTALL=${MANINSTALL:Q}
_PLIST_AWK_ENV+=	MANZ=${_MANZ:Q}
_PLIST_AWK_ENV+=	PKGMANDIR=${PKGMANDIR:Q}
_PLIST_AWK_ENV+=	PREFIX=${DESTDIR:Q}${PREFIX:Q}
_PLIST_AWK_ENV+=	TEST=${TOOLS_TEST:Q}

# PLIST_SUBST contains package-settable "${variable}" to "value"
# substitutions for PLISTs
#
PLIST_SUBST+=	OPSYS=${OPSYS:Q}					\
		OS_VERSION=${OS_VERSION:Q}				\
		MACHINE_ARCH=${MACHINE_ARCH:Q}				\
		MACHINE_GNU_ARCH=${MACHINE_GNU_ARCH:Q}			\
		MACHINE_GNU_PLATFORM=${MACHINE_GNU_PLATFORM:Q}		\
		LN=${LN:Q}						\
		LOWER_VENDOR=${LOWER_VENDOR:Q}				\
		LOWER_OPSYS=${LOWER_OPSYS:Q}				\
		LOWER_OS_VERSION=${LOWER_OS_VERSION:Q}			\
		PKGBASE=${PKGBASE:Q}					\
		PKGNAME=${PKGNAME_NOREV:Q}				\
		PKGLOCALEDIR=${PKGLOCALEDIR:Q}				\
		PKGVERSION=${PKGVERSION:C/nb[0-9]*$//}			\
		LOCALBASE=${LOCALBASE:Q}				\
		VIEWBASE=${VIEWBASE:Q}					\
		X11BASE=${X11BASE:Q}					\
		X11PREFIX=${X11PREFIX:Q}				\
		SVR4_PKGNAME=${SVR4_PKGNAME:Q}				\
		CHGRP=${CHGRP:Q}					\
		CHMOD=${CHMOD:Q}					\
		CHOWN=${CHOWN:Q}					\
		MKDIR=${MKDIR:Q}					\
		RMDIR=${RMDIR:Q}					\
		RM=${RM:Q}						\
		TRUE=${TRUE:Q}						\
		PKGMANDIR=${PKGMANDIR:Q}

# Pass the PLIST_SUBST substitutions to the subst.awk script by prepending
# PLIST_" to all of the variable names and adding them into the environment.
#
_PLIST_AWK_ENV+=	${PLIST_SUBST:S/^/PLIST_/}
_PLIST_AWK_ENV+=	PLIST_SUBST_VARS=${PLIST_SUBST:S/^/PLIST_/:C/=.*//:M*:Q}

_PLIST_AWK+=		-f ${.CURDIR}/../../mk/plist/plist-functions.awk
_PLIST_AWK+=		-f ${.CURDIR}/../../mk/plist/plist-subst.awk
_PLIST_AWK+=		-f ${.CURDIR}/../../mk/plist/plist-locale.awk
_PLIST_AWK+=		-f ${.CURDIR}/../../mk/plist/plist-info.awk
_PLIST_AWK+=		-f ${.CURDIR}/../../mk/plist/plist-man.awk
_PLIST_AWK+=		-f ${.CURDIR}/../../mk/plist/plist-libtool.awk
_PLIST_AWK+=		-f ${.CURDIR}/../../mk/plist/plist-default.awk

_PLIST_INFO_AWK+=	-f ${.CURDIR}/../../mk/plist/plist-functions.awk
_PLIST_INFO_AWK+=	-f ${.CURDIR}/../../mk/plist/plist-info.awk

_PLIST_SHLIB_AWK=	-f ${_SHLIB_AWKFILE.${SHLIB_TYPE}}
_SHLIB_AWKFILE.COFF=	${.CURDIR}/../../mk/plist/shlib-none.awk
_SHLIB_AWKFILE.ELF=	${.CURDIR}/../../mk/plist/shlib-elf.awk
_SHLIB_AWKFILE.aixlib=	${.CURDIR}/../../mk/plist/shlib-none.awk
_SHLIB_AWKFILE.a.out=	${.CURDIR}/../../mk/plist/shlib-aout.awk
_SHLIB_AWKFILE.dylib=	${.CURDIR}/../../mk/plist/shlib-dylib.awk
_SHLIB_AWKFILE.none=	${.CURDIR}/../../mk/plist/shlib-none.awk

# SHLIB_TYPE is the type of shared library supported by the platform.
SHLIB_TYPE=		${_SHLIB_TYPE_cmd:sh}
_SHLIB_TYPE_cmd=							\
	${SETENV} ECHO=${TOOLS_ECHO:Q} FILE_CMD=${TOOLS_FILE_CMD:Q}	\
		TEST=${TOOLS_TEST:Q} PKG_INFO_CMD=${PKG_INFO_CMD:Q}	\
	${SH} ${.CURDIR}/../../mk/plist/shlib-type ${_OPSYS_SHLIB_TYPE:Q}

######################################################################

# GENERATE_PLIST is a sequence of commands, terminating in a semicolon,
#	that outputs contents for a PLIST to stdout and is appended to
#	the contents of ${PLIST_SRC}.
#
GENERATE_PLIST?=	${TRUE};

_BUILD_DEFS+=		_PLIST_IGNORE_FILES

_GENERATE_PLIST=	${CAT} ${PLIST_SRC}; ${GENERATE_PLIST}

.PHONY: plist
plist: ${PLIST}

${PLIST}: ${PLIST_SRC}
	${_PKG_SILENT}${_PKG_DEBUG}${MKDIR} $(dir $@)
	${_PKG_SILENT}${_PKG_DEBUG}					\
	{ ${_GENERATE_PLIST} } > $@

#	${SETENV} ${_PLIST_AWK_ENV} ${AWK} ${_PLIST_AWK} |		\
#	${SETENV} ${_PLIST_AWK_ENV} ${AWK} ${_PLIST_SHLIB_AWK}		\
#		> $@