# robotpkg depend.mk for:	math/eiquadprog
# Created:			Guilhem Saurel on Tue, 17 Sep 2019
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
EIQUADPROG_DEPEND_MK:=		${EIQUADPROG_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			eiquadprog
endif

ifeq (+,$(EIQUADPROG_DEPEND_MK)) # ------------------------------------------

PREFER.eiquadprog?=		robotpkg

#TODO
SYSTEM_SEARCH.eiquadprog=\
  'include/eiquadprog/config.hpp:/EIQUADPROG_VERSION /s/[^0-9.]//gp'			\
  'lib/cmake/eiquadprog/eiquadprogConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
  'lib/pkgconfig/eiquadprog.pc:/Version/s/[^0-9.]//gp'

DEPEND_USE+=			eiquadprog

DEPEND_ABI.eiquadprog?=		eiquadprog>=1.2.0
DEPEND_DIR.eiquadprog?=		../../math/eiquadprog

endif # EIQUADPROG_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
