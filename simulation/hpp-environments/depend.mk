# robotpkg depend.mk for:	simulation/hpp-environments
# Created:			Guilhem Saurel on Mon,  4 May 2020
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
HPP_ENVIRONMENTS_DEPEND_MK:=	${HPP_ENVIRONMENTS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			hpp-environments
endif

ifeq (+,$(HPP_ENVIRONMENTS_DEPEND_MK)) # --------------------------------

PREFER.hpp-environments?=	robotpkg

DEPEND_USE+=			hpp-environments

DEPEND_ABI.hpp-environments?=	hpp-environments>=4.9.0
DEPEND_DIR.hpp-environments?=	../../simulation/hpp-environments

SYSTEM_SEARCH.hpp-environments=										\
  'include/hpp/environments/config.hh'									\
  'lib/cmake/hpp-environments/hpp-environmentsConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
  'lib/pkgconfig/hpp-environments.pc:/Version/s/[^0-9.]//gp'

endif # HPP_ENVIRONMENTS_DEPEND_MK --------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
