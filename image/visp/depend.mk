# robotpkg depend.mk for:	image/visp
# Created:			Anthony Mallet on Tue, 9 Feb 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
VISP_DEPEND_MK:=	${VISP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		visp
endif

ifeq (+,$(VISP_DEPEND_MK)) # -----------------------------------------------

PREFER.visp?=		robotpkg

DEPEND_USE+=		visp

DEPEND_ABI.visp?=	visp>=2.4.4
DEPEND_DIR.visp?=	../../image/visp

SYSTEM_SEARCH.visp=\
  'bin/visp-config:p:% --dumpversion'					\
  'include{,/visp-*}/visp3/core/vpConfig.h'				\
  'lib/pkgconfig/visp{,-[0-9]*}.pc:/Version/s/[^.0-9]//gp'

endif # VISP_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
