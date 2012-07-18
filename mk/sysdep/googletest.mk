# robotpkg sysdep/googletest.mk
# Created:			Anthony Mallet on Sun Jul 15 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GOOGLETEST_DEPEND_MK:=	${GOOGLETEST_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		googletest
endif

ifeq (+,$(GOOGLETEST_DEPEND_MK)) # -----------------------------------------

PREFER.googletest?=	system

DEPEND_USE+=		googletest

DEPEND_ABI.googletest?=	googletest>=1

SYSTEM_SEARCH.googletest=\
  'bin/gtest-config:p:% --version'	\
  'include/gtest/gtest.h'		\
  'lib/libgtest.{so,a}'

SYSTEM_PKG.Debian.googletest=	libgtest-dev
SYSTEM_PKG.Fedora.googletest=	gtest-devel
SYSTEM_PKG.NetBSD.googletest=	devel/googletest
SYSTEM_PKG.Ubuntu.googletest=	libgtest-dev

endif # GOOGLETEST_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
