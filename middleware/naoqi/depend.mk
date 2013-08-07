# robotpkg sysdep/naoqi.mk
# Created:			Séverin Lemaignan on Wed, 07 Aug 2013
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
NAOQI_DEPEND_MK:=	${NAOQI_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		naoqi
endif

ifeq (+,$(NAOQI_DEPEND_MK)) # ----------------------------------------------

include ../../mk/robotpkg.prefs.mk # OPSYS
ifeq (OpenNao,${OPSYS})
  PREFER.naoqi?=	system
endif
PREFER.naoqi?=		robotpkg

DEPEND_USE+=		naoqi

DEPEND_ABI.naoqi?=	naoqi>=1.14
DEPEND_DIR.naoqi?=	../../middleware/naoqi

SYSTEM_SEARCH.naoqi=\
  'include/alcommon/albroker.h'						\
  'include/alproxies/alproxies.h'					\
  'lib/libalcommon.{so,a}'						\
  'lib/libalvalue.{so,a}'						\
  'bin/naoqi-bin:/^Version/s/[^0-9.]//gp:% --version'

endif # NAOQI_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=	${DEPEND_DEPTH:+=}
