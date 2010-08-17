# robotpkg depend.mk for:	devel/hpp-kwsplus
# Created:			Anthony Mallet on Thu, 24 Apr 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_KWSPLUS_DEPEND_MK:=	${HPP_KWSPLUS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-kwsplus
endif

ifeq (+,$(HPP_KWSPLUS_DEPEND_MK)) # ----------------------------------

PREFER.hpp-kwsplus?=	robotpkg

SYSTEM_SEARCH.hpp-kwsplus=\
	include/kwsPlus/kwsPlusRoadmap.h	\
	lib/libkwsPlus.la

DEPEND_USE+=		hpp-kwsplus

DEPEND_ABI.hpp-kwsplus?=hpp-kwsplus>=1.8
DEPEND_DIR.hpp-kwsplus?=../../devel/hpp-kwsplus

include ../../path/kineo-pp/depend.mk

endif # HPP_KWSPLUS_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
