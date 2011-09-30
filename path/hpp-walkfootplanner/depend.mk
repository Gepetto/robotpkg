# robotpkg depend.mk for:	path/hpp-walkfootplanner
# Created:			Anthony Mallet on Wed, 17 Sep 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPPWALKFOOTPLANNER_DEPEND_MK:=${HPPWALKFOOTPLANNER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-walkfootplanner
endif

ifeq (+,$(HPPWALKFOOTPLANNER_DEPEND_MK)) # ---------------------------

PREFER.hpp-walkfootplanner?=	robotpkg

DEPEND_USE+=			hpp-walkfootplanner

DEPEND_ABI.hpp-walkfootplanner?=hpp-walkfootplanner>=2.2
DEPEND_DIR.hpp-walkfootplanner?=../../path/hpp-walkfootplanner

SYSTEM_SEARCH.hpp-walkfootplanner=\
	include/hpp/walkfootplanner/planner.hh	\
	lib/libhpp-walkfootplanner.la		\
	'lib/pkgconfig/hpp-walkfootplanner.pc:/Version/s/[^0-9]//gp'

endif # HPPWALKFOOTPLANNER_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
