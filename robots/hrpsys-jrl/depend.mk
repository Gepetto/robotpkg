# robotpkg depend.mk for:	architecture/hrpsys-jrl
# Created:			Anthony Mallet on Wed, 22 Oct 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HRPSYS_JRL_DEPEND_MK:=	${HRPSYS_JRL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hrpsys-jrl
endif

ifeq (+,$(HRPSYS_JRL_DEPEND_MK)) # -----------------------------------

PREFER.hrpsys-jrl?=	robotpkg

DEPEND_USE+=		hrpsys-jrl

DEPEND_ABI.hrpsys-jrl?=	hrpsys-jrl>=3.0.1
DEPEND_DIR.hrpsys-jrl?=	../../robots/hrpsys-jrl

SYSTEM_SEARCH.hrpsys-jrl=\
	Controller/IOserver/corba/HRPcontroller.h	\
	Controller/IOserver/robot/HRP2JRL/model/HRP2JRLmain.wrl

endif # HRPSYS_JRL_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
