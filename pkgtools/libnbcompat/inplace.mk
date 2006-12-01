# $NetBSD: inplace.mk,v 1.1 2004/08/13 22:34:28 jlam Exp $
#
# This Makefile fragment builds a working copy of libnbcompat inside
# ${WRKDIR} and adds the appropriate paths to CPPFLAGS and LDFLAGS.

LIBNBCOMPAT_FILESDIR=	${PKGSRCDIR}/pkgtools/libnbcompat/files
LIBNBCOMPAT_SRCDIR=	${WRKDIR}/libnbcompat

CPPFLAGS+=		-I${LIBNBCOMPAT_SRCDIR}
LDFLAGS+=		-L${LIBNBCOMPAT_SRCDIR}
LIBS+=			-lnbcompat

do-extract: libnbcompat-extract
libnbcompat-extract:
	${_PKG_SILENT}${_PKG_DEBUG}					\
	${CP} -Rp ${LIBNBCOMPAT_FILESDIR} ${LIBNBCOMPAT_SRCDIR}

pre-configure: libnbcompat-build
libnbcompat-build:
	${_PKG_SILENT}${_PKG_DEBUG}${_ULIMIT_CMD}			\
	cd ${LIBNBCOMPAT_SRCDIR} && ${SETENV}				\
		AWK="${AWK}" CC="${CC}" CFLAGS="${CFLAGS}"		\
		CPPFLAGS="${CPPFLAGS}"					\
		$(filter-out LIBS=%,${CONFIGURE_ENV}) ${CONFIG_SHELL}	\
		${CONFIGURE_SCRIPT} && ${MAKE_PROGRAM}
