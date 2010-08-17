# robotpkg depend.mk for:	graphics/kpp-interfacewalk
# Created:			florent on Fri, 1 May 2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
KPP_INTERFACEWALK_DEPEND_MK:=	${KPP_INTERFACEWALK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			kpp-interfacewalk
endif

ifeq (+,$(KPP_INTERFACEWALK_DEPEND_MK)) # ------------------------------------

PREFER.kpp-interfacewalk?=	robotpkg

DEPEND_USE+=			kpp-interfacewalk

DEPEND_ABI.kpp-interfacewalk?=	kpp-interfacewalk>=1.9
DEPEND_DIR.kpp-interfacewalk?=	../../graphics/kpp-interfacewalk

SYSTEM_SEARCH.kpp-interfacewalk=\
	include/kppInterfaceWalk/kppInterfaceWalk.h		\
	'lib/pkgconfig/kppInterfaceWalk.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
