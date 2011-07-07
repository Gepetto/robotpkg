# robotpkg depend.mk for:	middleware/hpp-template-corba
# Created:			Thomas Moulard on Wed, 8 Sep 2010
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
HPP_TEMPLATE_CORBA_DEPEND_MK:=	${HPP_TEMPLATE_CORBA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			hpp-template-corba
endif

ifeq (+,$(HPP_TEMPLATE_CORBA_DEPEND_MK)) # ------------------------------------

PREFER.hpp-template-corba?=	robotpkg

DEPEND_USE+=			hpp-template-corba

DEPEND_ABI.hpp-template-corba?=	hpp-template-corba>=0.4
DEPEND_DIR.hpp-template-corba?=	../../middleware/hpp-template-corba

SYSTEM_SEARCH.hpp-template-corba=\
	include/hpp/corba/template/server.hh				\
	'lib/pkgconfig/hpp-template-corba.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
