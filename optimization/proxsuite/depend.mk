# robotpkg depend.mk for:	math/proxsuite
# Created:			Guilhem Saurel on Mon, 26 Sep 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PROXSUITE_DEPEND_MK:=		${PROXSUITE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			proxsuite
endif

ifeq (+,$(PROXSUITE_DEPEND_MK)) # ------------------------------------------

PREFER.proxsuite?=		robotpkg

SYSTEM_SEARCH.proxsuite=\
  'include/proxsuite/config.hpp:/PROXSUITE_VERSION /s/[^0-9.]//gp'	\
  'lib/cmake/proxsuite/proxsuiteConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp' \
  'lib/pkgconfig/proxsuite.pc:/Version/s/[^0-9.]//gp'

DEPEND_USE+=			proxsuite

DEPEND_ABI.proxsuite?=		proxsuite>=0.1.0
DEPEND_DIR.proxsuite?=		../../optimization/proxsuite

endif # PROXSUITE_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
