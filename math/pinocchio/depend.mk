# robotpkg depend.mk for:	math/pinocchio
# Created:			Olivier Stasse on Thu, 4 Feb 2016
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PINOCCHIO_DEPEND_MK:=	${PINOCCHIO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		pinocchio
endif

ifeq (+,$(PINOCCHIO_DEPEND_MK)) # ------------------------------------------

PREFER.pinocchio?=	robotpkg

SYSTEM_SEARCH.pinocchio=\
  'include/pinocchio/config.h{h,pp}:/PINOCCHIO_VERSION /s/[^0-9.]//gp'	\
  'lib/libpinocchio.so'							\
  'lib/pkgconfig/pinocchio.pc:/Version/s/[^0-9.]//gp'

DEPEND_USE+=		pinocchio

DEPEND_ABI.pinocchio?=	pinocchio>=2.0.0<3.0.0
DEPEND_DIR.pinocchio?=	../../math/pinocchio

endif # PINOCCHIO_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

# pulled by the package public headers
include ../../graphics/urdfdom/depend.mk
include ../../math/eigen3/depend.mk
include ../../path/hpp-fcl/depend.mk
