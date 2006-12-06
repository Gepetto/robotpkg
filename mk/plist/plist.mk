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

# --------------------------------------------------------------------

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
_PLIST_AWK_ENV+=	USE_PKGLOCALEDIR=${USE_PKGLOCALEDIR:Dyes:Uno}
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
	PLIST_OPSYS=$(call quote,${OPSYS})					\
	PLIST_OS_VERSION=$(call quote,${OS_VERSION})				\
	PLIST_MACHINE_ARCH=$(call quote,${MACHINE_ARCH})			\
	PLIST_MACHINE_GNU_ARCH=$(call quote,${MACHINE_GNU_ARCH})		\
	PLIST_MACHINE_GNU_PLATFORM=$(call quote,${MACHINE_GNU_PLATFORM})	\
	PLIST_LN=$(call quote,${LN})						\
	PLIST_LOWER_VENDOR=$(call quote,${LOWER_VENDOR})			\
	PLIST_LOWER_OPSYS=$(call quote,${LOWER_OPSYS})			\
	PLIST_LOWER_OS_VERSION=$(call quote,${LOWER_OS_VERSION})		\
	PLIST_PKGBASE=$(call quote,${PKGBASE})				\
	PLIST_PKGNAME=$(call quote,${PKGNAME_NOREV})				\
	PLIST_PKGLOCALEDIR=$(call quote,${PKGLOCALEDIR})			\
	PLIST_PKGVERSION=$(shell echo ${PKGVERSION} | ${SED} -e 's/r[0-9]*$$//')\
	PLIST_LOCALBASE=$(call quote,${LOCALBASE})				\
	PLIST_CHGRP=$(call quote,${CHGRP})					\
	PLIST_CHMOD=$(call quote,${CHMOD})					\
	PLIST_CHOWN=$(call quote,${CHOWN})					\
	PLIST_MKDIR=$(call quote,${MKDIR})					\
	PLIST_RMDIR=$(call quote,${RMDIR})					\
	PLIST_RM=$(call quote,${RM})						\
	PLIST_TRUE=$(call quote,${TRUE})					\
	PLIST_PKGMANDIR=$(call quote,${PKGMANDIR})

# Pass the PLIST_SUBST substitutions to the subst.awk script by prepending
# PLIST_" to all of the variable names and adding them into the environment.
#
_PLIST_AWK_ENV+=	${PLIST_SUBST}
_PLIST_AWK_ENV+=	PLIST_SUBST_VARS=$(call quote,$(foreach _s_,${PLIST_SUBST},$(firstword $(subst =, ,${_s_}))))

_PLIST_AWK+=		-f ${CURDIR}/../../mk/plist/plist-functions.awk
_PLIST_AWK+=		-f ${CURDIR}/../../mk/plist/plist-subst.awk
_PLIST_AWK+=		-f ${CURDIR}/../../mk/plist/plist-locale.awk
_PLIST_AWK+=		-f ${CURDIR}/../../mk/plist/plist-info.awk
_PLIST_AWK+=		-f ${CURDIR}/../../mk/plist/plist-man.awk
_PLIST_AWK+=		-f ${CURDIR}/../../mk/plist/plist-libtool.awk
_PLIST_AWK+=		-f ${CURDIR}/../../mk/plist/plist-default.awk

_PLIST_INFO_AWK+=	-f ${CURDIR}/../../mk/plist/plist-functions.awk
_PLIST_INFO_AWK+=	-f ${CURDIR}/../../mk/plist/plist-info.awk

#_PLIST_SHLIB_AWK=	-f ${_SHLIB_AWKFILE.${SHLIB_TYPE}}
#_SHLIB_AWKFILE.COFF=	${CURDIR}/../../mk/plist/shlib-none.awk
#_SHLIB_AWKFILE.ELF=	${CURDIR}/../../mk/plist/shlib-elf.awk
#_SHLIB_AWKFILE.aixlib=	${CURDIR}/../../mk/plist/shlib-none.awk
#_SHLIB_AWKFILE.a.out=	${CURDIR}/../../mk/plist/shlib-aout.awk
#_SHLIB_AWKFILE.dylib=	${CURDIR}/../../mk/plist/shlib-dylib.awk
#_SHLIB_AWKFILE.none=	${CURDIR}/../../mk/plist/shlib-none.awk

# SHLIB_TYPE is the type of shared library supported by the platform.
#SHLIB_TYPE=		${_SHLIB_TYPE_cmd:sh}
#_SHLIB_TYPE_cmd=							\
#	${SETENV} ECHO=${TOOLS_ECHO:Q} FILE_CMD=${TOOLS_FILE_CMD:Q}	\
#		TEST=${TOOLS_TEST:Q} PKG_INFO_CMD=${PKG_INFO_CMD:Q}	\
#	${SH} ${CURDIR}/../../mk/plist/shlib-type ${_OPSYS_SHLIB_TYPE:Q}

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
	{ ${_GENERATE_PLIST} } |					\
	${SETENV} ${_PLIST_AWK_ENV} ${AWK} ${_PLIST_AWK} > $@

#	${SETENV} ${_PLIST_AWK_ENV} ${AWK} ${_PLIST_SHLIB_AWK}		\
#		> $@