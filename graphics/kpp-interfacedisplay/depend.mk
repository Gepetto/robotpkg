# robotpkg depend.mk for:	graphics/kpp-interfacedisplay
# Created:			florent on Fri, 1 May 2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
KPP_INTERFACEDISPLAY_DEPEND_MK:=	${KPP_INTERFACEDISPLAY_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			kpp-interfacedisplay
endif

ifeq (+,$(KPP_INTERFACEDISPLAY_DEPEND_MK)) # ------------------------------------

PREFER.kpp-interfacedisplay?=	robotpkg

DEPEND_USE+=			kpp-interfacedisplay

DEPEND_ABI.kpp-interfacedisplay?=	kpp-interfacedisplay>=1.0.1
DEPEND_DIR.kpp-interfacedisplay?=	../../graphics/kpp-interfacedisplay

SYSTEM_SEARCH.kpp-interfacedisplay=\
	include/kppInterfaceDisplay/kppInterfaceDisplay.h		\
	'lib/libkppInterfaceDisplay.{a,so}'					\
	'lib/pkgconfig/kppInterfaceDisplay.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
