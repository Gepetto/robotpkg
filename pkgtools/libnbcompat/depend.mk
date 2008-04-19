#
# Copyright (C) 2008 LAAS/CNRS
#
# Authored by Anthony Mallet on Fri Apr 18 2008
# From $NetBSD: inplace.mk,v 1.1 2004/08/13 22:34:28 jlam Exp $
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBNBCOMPAT_DEPEND_MK:=	${LIBNBCOMPAT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libnbcompat
endif

ifeq (+,$(LIBNBCOMPAT_DEPEND_MK))
PREFER.libnbcompat?=		robotpkg

SYSTEM_SEARCH.libnbcompat=	\
	include/nbcompat.h	\
	lib/libnbcompat.a

  # pull-in the user preferences for libnbcompat now
  include ../../mk/robotpkg.prefs.mk

  ifeq (inplace+robotpkg,$(strip $(LIBNBCOMPAT_STYLE)+$(PREFER.libnbcompat)))
  # This is the "inplace" version of libnbcompat package, for bootstrap process
  #
LIBNBCOMPAT_FILESDIR=	${PKGSRCDIR}/pkgtools/libnbcompat/dist
LIBNBCOMPAT_SRCDIR=	${WRKDIR}/libnbcompat

CPPFLAGS+=	-I${LIBNBCOMPAT_SRCDIR}
LDFLAGS+=	-L${LIBNBCOMPAT_SRCDIR}
LIBS+=		 -lnbcompat

post-extract: libnbcompat-extract
libnbcompat-extract:
	@${STEP_MSG} "Extracting libnbcompat in place"
	${CP} -Rp ${LIBNBCOMPAT_FILESDIR} ${LIBNBCOMPAT_SRCDIR}

pre-configure: libnbcompat-build
libnbcompat-build:
	@${STEP_MSG} "Building libnbcompat in place"
	${RUN}								\
	cd ${LIBNBCOMPAT_SRCDIR} && 					\
	${SETENV} AWK="${AWK}" CC="${CC}" CFLAGS="${CFLAGS}"		\
		CPPFLAGS="${CPPFLAGS}" ${CONFIG_SHELL} configure &&	\
	${MAKE_PROGRAM}
  else
  # This is the regular version of libnbcompat package, for normal install
  #
DEPEND_USE+=		libnbcompat

DEPEND_ABI.libnbcompat?=libnbcompat>=20080416
DEPEND_DIR.libnbcompat?=../../pkgtools/libnbcompat

DEPEND_LIBS.libnbcompat+=-lnbcompat
  endif

endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
