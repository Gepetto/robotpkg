# $NetBSD: bsd.configure-vars.mk,v 1.1 2006/07/05 06:09:15 jlam Exp $
#
# CONFIGURE_DIRS is the list of directories in which to run the
#	configure process.  If the directories are relative paths,
#	then they are assumed to be relative to ${WRKSRC}.
#
# SCRIPTS_ENV is the shell environment passed to scripts invoked
#	by pkgsrc.
#
CONFIGURE_DIRS?=	${WRKSRC}
SCRIPTS_ENV?=		# empty

SCRIPTS_ENV+=	${ALL_ENV}
SCRIPTS_ENV+=	_PKGSRCDIR=${_PKGSRCDIR}
ifdef BATCH
SCRIPTS_ENV+=	BATCH=yes
endif
SCRIPTS_ENV+=	CURDIR=${CURDIR}
SCRIPTS_ENV+=	DEPENDS=$(call quote,${DEPENDS})
SCRIPTS_ENV+=	DISTDIR=${DISTDIR}
SCRIPTS_ENV+=	FILESDIR=${FILESDIR}
SCRIPTS_ENV+=	LOCALBASE=${LOCALBASE}
SCRIPTS_ENV+=	PATCHDIR=${PATCHDIR}
SCRIPTS_ENV+=	PKGSRCDIR=${PKGSRCDIR}
SCRIPTS_ENV+=	SCRIPTDIR=${SCRIPTDIR}
SCRIPTS_ENV+=	WRKDIR=${WRKDIR}
SCRIPTS_ENV+=	WRKSRC=${WRKSRC}

# The following are the "public" targets provided by this module:
#
#    configure
#
# The following targets may be overridden in a package Makefile:
#
#    pre-configure, do-configure, post-configure
#

_COOKIE.configure=      ${WRKDIR}/.configure_done


# --- configure (PUBLIC) ---------------------------------------------
#
# configure is a public target to configure the software for building.
#
.PHONY: configure
ifndef NO_CONFIGURE
  include ${PKGSRCDIR}/mk/configure/configure.mk
else
  ifeq (yes,$(call exists,${_COOKIE.configure}))
configure:
	@${DO_NADA}
  else
    ifdef _PKGSRC_BARRIER
configure: patch configure-cookie
    else
configure: barrier
    endif
  endif
endif


# --- configure-cookie (PRIVATE) -------------------------------------
#
# configure-cookie creates the "configure" cookie file.
#
.PHONY: configure-cookie
configure-cookie:
	${_PKG_SILENT}${_PKG_DEBUG}${TEST} ! -f ${_COOKIE.configure} || ${FALSE}
	${_PKG_SILENT}${_PKG_DEBUG}${MKDIR} $(dir ${_COOKIE.configure})
	${_PKG_SILENT}${_PKG_DEBUG}${ECHO} ${PKGNAME} > ${_COOKIE.configure}
