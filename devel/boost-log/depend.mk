# robotpkg depend.mk for:	devel/boost-log
# Created:			Jan Paulus on 29 Sep 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
BOOST-LOG_DEPEND_MK:=	${BOOST-LOG_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		boost-log
endif

ifeq (+,$(BOOST-LOG_DEPEND_MK)) # ------------------------------------------

PREFER.boost-log?=	robotpkg

DEPEND_USE+=		boost-log

DEPEND_ABI.boost-log?=	boost-log>=1.0
DEPEND_DIR.boost-log?=	../../devel/boost-log

SYSTEM_SEARCH.boost-log=\
	include/boost/log/core.hpp

endif # BOOST-LOG_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
