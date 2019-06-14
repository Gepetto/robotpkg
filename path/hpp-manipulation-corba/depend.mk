# robotpkg depend.mk for:	path/hpp-manipulation-corba
# Created:			Florent Lamiraux on Sat, 7 Mar 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPPMANIPULATIONCORBA_DEPEND_MK:=	${HPPMANIPULATIONCORBA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-manipulation-corba
endif

ifeq (+,$(HPPMANIPULATIONCORBA_DEPEND_MK)) # ---------------------------

PREFER.hpp-manipulation-corba?=	robotpkg

DEPEND_USE+=		hpp-manipulation-corba

DEPEND_ABI.hpp-manipulation-corba?=	hpp-manipulation-corba>=4.6.1
DEPEND_DIR.hpp-manipulation-corba?=	../../path/hpp-manipulation-corba

SYSTEM_SEARCH.hpp-manipulation-corba=			\
	include/hpp/corbaserver/manipulation/server.hh  \
	lib/libhpp-manipulation-corba.so		\
	'lib/pkgconfig/hpp-manipulation-corba.pc:/Version/s/[^0-9.]//gp'

endif # HPPMANIPULATIONCORBA_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
