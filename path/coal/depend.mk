# robotpkg depend.mk for:	path/coal
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
COAL_DEPEND_MK:=	${COAL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		coal
endif

ifeq (+,$(COAL_DEPEND_MK)) # --------------------------------------------

PREFER.coal?=	robotpkg

DEPEND_USE+=		coal

DEPEND_ABI.coal?=	coal>=3
DEPEND_DIR.coal?=	../../path/coal

SYSTEM_SEARCH.coal=\
  'include/coal/config.hh:/COAL_VERSION /s/[^0-9.]//gp'				\
  'lib/cmake/coal/coalConfigVersion.cmake:/PACKAGE_VERSION /s/[^0-9.]//gp'	\
  'lib/libcoal.so'									\
  'lib/pkgconfig/coal.pc:/Version/s/[^0-9.]//gp'					\
  'share/coal/package.xml:/<version>/s/[^0-9.]//gp'

include ../../math/eigen3/depend.mk

endif # COAL_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
