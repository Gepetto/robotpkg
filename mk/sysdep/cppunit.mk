# robotpkg sysdep/cppunit.mk
# Created:			Anthony Mallet on Thu Jul  4 2013
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
CPPUNIT_DEPEND_MK:=	${CPPUNIT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		cppunit
endif

ifeq (+,$(CPPUNIT_DEPEND_MK)) # --------------------------------------------

PREFER.cppunit?=	system
DEPEND_USE+=		cppunit
DEPEND_ABI.cppunit?=	cppunit>=1

SYSTEM_SEARCH.cppunit=	\
  'include/cppunit/Test.h'				\
  'lib/libcppunit.{so,a}'				\
  'lib/pkgconfig/cppunit.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.cppunit=cppunit-devel
SYSTEM_PKG.Ubuntu.cppunit=libcppunit-dev
SYSTEM_PKG.Debian.cppunit=libcppunit-dev
SYSTEM_PKG.NetBSD.cppunit=devel/cppunit
SYSTEM_PKG.Gentoo.cppunit=dev-util/cppunit

endif # CPPUNIT_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
