# robotpkg depend.mk for:	devel/orocos-logcpp
# Created:			Arnaud Degroote on Wed, 21 Aug 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OROCOS_LOG4CPP_DEPEND_MK:=		${OROCOS_LOG4CPP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		orocos-log4cpp
endif

ifeq (+,$(OROCOS_LOG4CPP_DEPEND_MK)) # ------------------------------------------

PREFER.orocos-log4cpp?=		robotpkg

DEPEND_USE+=		orocos-log4cpp

DEPEND_ABI.orocos-log4cpp?=	orocos-log4cpp>=2.6.0
DEPEND_DIR.orocos-log4cpp?=	../../devel/orocos-log4cpp

SYSTEM_SEARCH.orocos-log4cpp=\
	include/log4cpp/config.h \
	lib/liblog4cpp.so \
	lib/pkgconfig/log4cpp.pc

endif # OROCOS_LOG4CPP_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

