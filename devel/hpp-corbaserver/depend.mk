# robotpkg depend.mk for:	devel/hpp-corbaserver
# Created:			Anthony Mallet on Thu, 9 Apr 2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
HPP_CORBASERVER_DEPEND_MK:=	${HPP_CORBASERVER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			hpp-corbaserver
endif

ifeq (+,$(HPP_CORBASERVER_DEPEND_MK)) # ------------------------------------

PREFER.hpp-corbaserver?=	robotpkg

DEPEND_USE+=			hpp-corbaserver

DEPEND_ABI.hpp-corbaserver?=	hpp-corbaserver>=1.7.1
DEPEND_DIR.hpp-corbaserver?=	../../devel/hpp-corbaserver

SYSTEM_SEARCH.hpp-corbaserver=\
	include/hppCorbaServer/hppciServer.h				\
	'lib/libhppCorbaServer.{a,so}'					\
	'lib/pkgconfig/hppCorbaServer.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
