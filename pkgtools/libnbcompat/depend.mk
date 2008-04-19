#
# Copyright (C) 2008 LAAS/CNRS
#
# Authored by Anthony Mallet on Fri Apr 18 2008
#
# This depend.mk file is special: it builds a working copy of libnbcompat
# inside ${WRKDIR} (of the calling package) and adds the appropriate
# paths to CPPFLAGS and LDFLAGS. No independant libnbcompat package is
# installed.
#
# From $NetBSD: inplace.mk,v 1.1 2004/08/13 22:34:28 jlam Exp $

LIBNBCOMPAT_DEPEND_MK:=	${LIBNBCOMPAT_DEPEND_MK}+

ifeq (+,$(LIBNBCOMPAT_DEPEND_MK))

LIBNBCOMPAT_FILESDIR=	${PKGSRCDIR}/pkgtools/libnbcompat/files
LIBNBCOMPAT_SRCDIR=	${WRKDIR}/libnbcompat

CPPFLAGS+=	-I${LIBNBCOMPAT_SRCDIR}
LDFLAGS+=	-L${LIBNBCOMPAT_SRCDIR} -lnbcompat

post-extract: libnbcompat-extract
libnbcompat-extract:
	${CP} -Rp ${LIBNBCOMPAT_FILESDIR} ${LIBNBCOMPAT_SRCDIR}

pre-configure: libnbcompat-build
libnbcompat-build:
	${RUN}								\
	cd ${LIBNBCOMPAT_SRCDIR} && 					\
	${SETENV} AWK="${AWK}" CC="${CC}" CFLAGS="${CFLAGS}"		\
		CPPFLAGS="${CPPFLAGS}" ${CONFIG_SHELL} configure &&	\
	${MAKE_PROGRAM}

endif
