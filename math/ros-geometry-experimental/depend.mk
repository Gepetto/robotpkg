# robotpkg depend.mk for:	math/ros-geometry-experimental
# Created:			Anthony Mallet on Thu, 14 Aug 2014
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
ROS_GEOMETRY_EXPERIMENTAL_DEPEND_MK:=	${ROS_GEOMETRY-EXPERIMENTAL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				ros-geometry-experimental
endif

ifeq (+,$(ROS_GEOMETRY_EXPERIMENTAL_DEPEND_MK)) # --------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-geometry-experimental?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-geometry-experimental?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-geometry-experimental
ROS_DEPEND_USE+=		ros-geometry-experimental

DEPEND_ABI.ros-geometry-experimental?=	ros-geometry-experimental>=0.3
DEPEND_DIR.ros-geometry-experimental=	../../math/ros-geometry-experimental

DEPEND_ABI.ros-geometry-experimental.groovy+=ros-geometry-experimental>=0.3<0.4
DEPEND_ABI.ros-geometry-experimental.hydro+= ros-geometry-experimental>=0.4<0.5
DEPEND_ABI.ros-geometry-experimental.indigo+=ros-geometry-experimental>=0.5<0.6
DEPEND_ABI.ros-geometry-experimental.jade+=  ros-geometry-experimental>=0.5<0.6
DEPEND_ABI.ros-geometry-experimental.kinetic+=ros-geometry-experimental>=0.5<0.6

SYSTEM_SEARCH.ros-geometry-experimental=\
  'include/tf2/convert.h'						\
  'lib/libtf2.so'							\
  'lib/pkgconfig/tf2.pc:/Version/s/[^0-9.]//gp'				\
  'share/tf2/package.xml:/<version>/s/[^0-9.]//gp'

endif # ROS_GEOMETRY_EXPERIMENTAL_DEPEND_MK --------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
