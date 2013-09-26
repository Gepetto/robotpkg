# robotpkg depend.mk for:	path/hpp-constrained-corba
# Created:			Antonio El Khoury on Thu, 26 Sep 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_CONSTRAINED_CORBA_DEPEND_MK:=	${HPP_CONSTRAINED_CORBA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-constrained-corba
endif

ifeq (+,$(HPP_CONSTRAINED_CORBA_DEPEND_MK)) # ------------------------------

PREFER.hpp-constrained-corba?=	robotpkg

DEPEND_USE+=		hpp-constrained-corba

DEPEND_ABI.hpp-constrained-corba?=	hpp-constrained-corba>=1.0
DEPEND_DIR.hpp-constrained-corba?=	../../path/hpp-constrained-corba

SYSTEM_SEARCH.hpp-constrained-corba=			\
	lib/libhpp-constrained-corba.so			\
	include/hpp/corbaserver/constrained/server.hh	\
	'lib/pkgconfig/hpp-constrained-corba.pc:/Version/s/[^0-9.]//gp'

endif # HPP_CONSTRAINED_CORBA_DEPEND_MK ------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
