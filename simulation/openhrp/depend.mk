# robotpkg depend.mk for:	simulation/OpenHRP
# Created:			Anthony Mallet on Wed, 22 Oct 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENHRP_DEPEND_MK:=	${OPENHRP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		OpenHRP
endif

ifeq (+,$(OPENHRP_DEPEND_MK)) # --------------------------------------

PREFER.OpenHRP?=	robotpkg

DEPEND_USE+=		OpenHRP

DEPEND_ABI.OpenHRP?=	OpenHRP>=3.0.1
DEPEND_DIR.OpenHRP?=	../../simulation/openhrp

SYSTEM_SEARCH.OpenHRP=\
	bin/unix/GrxUI.sh			\
	Common/corba/OpenHRPCommon.idl

endif # --- OPENHRP_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
