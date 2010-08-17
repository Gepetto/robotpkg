# robotpkg depend.mk for:	graphics/kpp-interface
# Created:			florent on Fri, 1 May 2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
KPP_INTERFACE_DEPEND_MK:=	${KPP_INTERFACE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			kpp-interface
endif

ifeq (+,$(KPP_INTERFACE_DEPEND_MK)) # ------------------------------------

PREFER.kpp-interface?=	robotpkg

DEPEND_USE+=			kpp-interface

DEPEND_ABI.kpp-interface?=	kpp-interface>=1.6
DEPEND_DIR.kpp-interface?=	../../graphics/kpp-interface

SYSTEM_SEARCH.kpp-interface=\
	include/kppInterface/kppInterface.h		\
	'lib/pkgconfig/kppInterface.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
