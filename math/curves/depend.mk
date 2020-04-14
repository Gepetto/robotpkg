# robotpkg depend.mk for:	math/curves
# Created:			Guilhem Saurel on Tue, 14 Apr 2020
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
CURVES_DEPEND_MK:=	${CURVES_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		curves
endif

ifeq (+,$(CURVES_DEPEND_MK)) # ---------------------------------------------

PREFER.curves?=		robotpkg

DEPEND_USE+=		curves

DEPEND_ABI.curves?=	curves>=0.3.3
DEPEND_DIR.curves?=	../../math/curves

SYSTEM_SEARCH.curves=\
  'include/curves/config.hh:/CURVES_VERSION /s/[^0-9.]//gp'		\
  'lib/cmake/curves/curvesConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp' \
  'lib/pkgconfig/curves.pc:/Version/s/[^0-9.]//gp'

endif # CURVES_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
