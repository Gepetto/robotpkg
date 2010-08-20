# robotpkg depend.mk for:	path/hpp-walkplanner
# Created:			Anthony Mallet on Wed, 14 May 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_WALKPLANNER_DEPEND_MK:=${HPP_WALKPLANNER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-walkplanner
endif

ifeq (+,$(HPP_WALKPLANNER_DEPEND_MK)) # ------------------------------

PREFER.hpp-walkplanner?=	robotpkg

SYSTEM_SEARCH.hpp-walkplanner=\
	include/hpp/walkplanner/planner.hh	\
	lib/libhpp-walkplanner.so

DEPEND_USE+=		hpp-walkplanner

DEPEND_ABI.hpp-walkplanner?=hpp-walkplanner>=3.2
DEPEND_DIR.hpp-walkplanner?=../../path/hpp-walkplanner

endif # HPP_WALKPLANNER_DEPEND_MK ------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
