# robotpkg depend.mk for:	image/viam-libs
# Created:			Anthony Mallet on Fri, 14 Mar 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
VIAMLIBS_DEPEND_MK:=	${VIAMLIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		viam-libs
endif

ifeq (+,$(VIAMLIBS_DEPEND_MK)) # -------------------------------------------

PREFER.viam-libs?=	robotpkg

DEPEND_USE+=		viam-libs

DEPEND_ABI.viam-libs?=	viam-libs>=1.12
DEPEND_DIR.viam-libs?=	../../image/viam-libs

SYSTEM_SEARCH.viam-libs=\
  'include/viam/viamlib.h'						\
  'lib/pkgconfig/viam-libs.pc:/Version/s/[^0-9.]//gp'			\
  'lib/pkgconfig/viam-libs-cv.pc:/Version/s/[^0-9.]//gp::~opencv'

endif # VIAMLIBS_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
