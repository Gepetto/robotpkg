# robotpkg depend.mk for:	graphics/ros-geometric-shapes
# Created:			Anthony Mallet on Thu, 14 Aug 2014
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_GEOMETRIC_SHAPES_DEPEND_MK:=${ROS_GEOMETRIC_SHAPES_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-geometric-shapes
endif

ifeq (+,$(ROS_GEOMETRIC_SHAPES_DEPEND_MK)) # -------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-geometric-shapes?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-geometric-shapes?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-geometric-shapes
ROS_DEPEND_USE+=		ros-geometric-shapes

DEPEND_ABI.ros-geometric-shapes?=	ros-geometric-shapes>=0.2
DEPEND_DIR.ros-geometric-shapes?=	../../graphics/ros-geometric-shapes

DEPEND_ABI.ros-geometric-shapes.groovy?=ros-geometric-shapes>=0.2<0.3
DEPEND_ABI.ros-geometric-shapes.hydro?=	ros-geometric-shapes>=0.3<0.4
DEPEND_ABI.ros-geometric-shapes.indigo?=ros-geometric-shapes>=0.4<0.5
DEPEND_ABI.ros-geometric-shapes.jade?=  ros-geometric-shapes>=0.4<0.5
DEPEND_ABI.ros-geometric-shapes.kinetic?=ros-geometric-shapes>=0.5<0.6
DEPEND_ABI.ros-geometric-shapes.lunar?=	ros-geometric-shapes>=0.5<0.6

SYSTEM_SEARCH.ros-geometric-shapes=\
  'include/geometric_shapes/shapes.h'				\
  'lib/libgeometric_shapes.so'					\
  'lib/pkgconfig/geometric_shapes.pc:/Version/s/[^0-9.]//gp'	\
  'share/geometric_shapes/package.xml:/<version>/s/[^0-9.]//gp'

endif # ROS_GEOMETRIC_SHAPES_DEPEND_MK -------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
