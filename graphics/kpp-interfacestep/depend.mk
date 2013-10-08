# robotpkg depend.mk for:	graphics/kpp-interfacestep
# Created:			Antonio El Khoury on Thu, 26 Sep 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
KPP_INTERFACESTEP_DEPEND_MK:=	${KPP_INTERFACESTEP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			kpp-interfacestep
endif

ifeq (+,$(KPP_INTERFACESTEP_DEPEND_MK)) # ----------------------------------

PREFER.kpp-interfacestep?=	robotpkg

DEPEND_USE+=			kpp-interfacestep

DEPEND_ABI.kpp-interfacestep?=	kpp-interfacestep>=0.3
DEPEND_DIR.kpp-interfacestep?=	../../graphics/kpp-interfacestep

SYSTEM_SEARCH.kpp-interfacestep=\
	include/kpp/interfacestep/interface.hh		\
	'lib/pkgconfig/kpp-interfacestep.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
