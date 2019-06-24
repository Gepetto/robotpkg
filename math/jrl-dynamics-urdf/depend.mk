# robotpkg depend.mk for:	math/jrl-dynamics-urdf
# Created:			Olivier Stasse on Fri, Jun 28
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
JRL_DYNAMICS_URDF_DEPEND_MK:=	${JRL_DYNAMICS_URDF_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			jrl-dynamics-urdf
endif

ifeq (+,$(JRL_DYNAMICS_URDF_DEPEND_MK)) # ---------------------------------

include ../../interfaces/jrl-mal/depend.mk
include ../../graphics/urdfdom/depend.mk
include ../../graphics/urdfdom-headers/depend.mk
include ../../math/jrl-dynamics/depend.mk
include ../../middleware/ros-comm/depend.mk

PREFER.jrl-dynamics-urdf?=	robotpkg

DEPEND_USE+=			jrl-dynamics-urdf

DEPEND_ABI.jrl-dynamics-urdf?=	jrl-dynamics-urdf>=1.0.0
DEPEND_DIR.jrl-dynamics-urdf?=	../../math/jrl-dynamics-urdf

SYSTEM_SEARCH.jrl-dynamics-urdf=\
  'bin/display-robot'			\
  'include/jrl/dynamics/urdf/parser.hh'	\
  'lib/libjrl-dynamics-urdf.so'

endif # JRL_DYNAMICS_URDF_DEPEND_MK ---------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}

# headers needs those dependencies
include ../../graphics/urdfdom-headers/depend.mk

DEPEND_ABI.urdfdom-headers+=	urdfdom-headers<1
