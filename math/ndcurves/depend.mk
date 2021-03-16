# robotpkg depend.mk for:	math/ndcurves
# Created:			Guilhem Saurel on Tue, 16 Mar 2021
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
NDCURVES_DEPEND_MK:=	${NDCURVES_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ndcurves
endif

ifeq (+,$(NDCURVES_DEPEND_MK)) # ---------------------------------------------

PREFER.ndcurves?=	robotpkg

DEPEND_USE+=		ndcurves

DEPEND_ABI.ndcurves?=	ndcurves>=0.3.3
DEPEND_DIR.ndcurves?=	../../math/ndcurves

SYSTEM_SEARCH.ndcurves=	\
  'include/{nd,}curves/config.hh:/CURVES_VERSION /s/[^0-9.]//gp'			\
  'lib/cmake/{nd,}curves/{nd,}curvesConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
  'lib/pkgconfig/{nd,}curves.pc:/Version/s/[^0-9.]//gp'					\
  'share/ndcurves/package.xml:/<version>/s/[^0-9.]//gp'

endif # NDCURVES_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
