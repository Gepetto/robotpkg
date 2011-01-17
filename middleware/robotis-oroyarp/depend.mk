# robotpkg depend.mk for:	middleware/robotis-oroyarp
# Created:			Arnaud Degroote on Thu, 22 Apr 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROBOTIS_OROYARP_DEPEND_MK:=		${ROBOTIS_OROYARP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		robotis-oroyarp
endif

ifeq (+,$(ROBOTIS_OROYARP_DEPEND_MK)) # ------------------------------------------

PREFER.robotis-oroyarp?=		robotpkg

DEPEND_USE+=		robotis-oroyarp

DEPEND_ABI.robotis-oroyarp?=	robotis-oroyarp>=1.2
DEPEND_DIR.robotis-oroyarp?=	../../middleware/robotis-oroyarp

SYSTEM_SEARCH.robotis-oroyarp=\
	bin/deployer-yarp							\
	include/robotis/oroyarp/Orocos2Yarp.h		\
	lib/librobotis-oroyarp.so

endif # ROBOTIS_OROYARP_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

