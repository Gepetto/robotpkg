# robotpkg depend.mk for:	path/hpp-kwsplus
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
	include/hpp/kwsplus/roadmap/roadmap.hh		\
	include/hpp/kwsplus/direct-path/direct-path.hh	\
	lib/libhpp-kwsplus.so

DEPEND_USE+=		hpp-kwsplus

DEPEND_ABI.hpp-kwsplus?=hpp-kwsplus>=2.3
DEPEND_DIR.hpp-kwsplus?=../../path/hpp-kwsplus

endif # HPP_KWSPLUS_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
