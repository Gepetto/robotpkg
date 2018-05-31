# robotpkg depend.mk for:	path/hpp-wholebody-step-corba
# Created:			Antonio El Khoury on Thu, 26 Sep 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_WHOLEBODY_STEP_CORBA_DEPEND_MK:=	${HPP_WHOLEBODY_STEP_CORBA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-wholebody-step-corba
endif

ifeq (+,$(HPP_WHOLEBODY_STEP_CORBA_DEPEND_MK)) # ---------------------------

PREFER.hpp-wholebody-step-corba?=	robotpkg

DEPEND_USE+=		hpp-wholebody-step-corba

DEPEND_ABI.hpp-wholebody-step-corba?=	hpp-wholebody-step-corba>=4.1
DEPEND_DIR.hpp-wholebody-step-corba?=	../../path/hpp-wholebody-step-corba

SYSTEM_SEARCH.hpp-wholebody-step-corba=			\
	lib/libhpp-wholebody-step-corba.so			\
	include/hpp/corbaserver/wholebody-step/server.hh	\
	'lib/pkgconfig/hpp-wholebody-step-corba.pc:/Version/s/[^0-9.]//gp'

endif # HPP_WHOLEBODY_STEP_CORBA_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
