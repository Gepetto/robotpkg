# robotpkg depend.mk for:	math/ros-geometry
# Created:			Séverin Lemaignan on Mon, 5 Aug 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_GEOMETRY_DEPEND_MK:=	${ROS_GEOMETRY_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-geometry
endif

ifeq (+,$(ROS_GEOMETRY_DEPEND_MK)) # ---------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-geometry?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-geometry?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-geometry
ROS_DEPEND_USE+=		ros-geometry

DEPEND_ABI.ros-geometry?=	ros-geometry>=1.9
DEPEND_DIR.ros-geometry=	../../math/ros-geometry

DEPEND_ABI.ros-geometry.groovy+=	ros-geometry>=1.9<1.10
DEPEND_ABI.ros-geometry.hydro+=		ros-geometry>=1.10<1.11
DEPEND_ABI.ros-geometry.indigo+=	ros-geometry>=1.11<1.12
DEPEND_ABI.ros-geometry.jade+=		ros-geometry>=1.11<1.12
DEPEND_ABI.ros-geometry.kinetic+=	ros-geometry>=1.11<1.12
DEPEND_ABI.ros-geometry.lunar+=		ros-geometry>=1.11<1.12
DEPEND_ABI.ros-geometry.melodic+=	ros-geometry>=1.12<1.13

SYSTEM_SEARCH.ros-geometry=\
  'include/eigen_conversions/eigen_kdl.h'				\
  'include/kdl_conversions/kdl_msg.h'					\
  'include/tf/tf.h'							\
  'lib/libeigen_conversions.so'						\
  'lib/libkdl_conversions.so'						\
  'lib/libtf.so'							\
  'lib/libtf_conversions.so'						\
  'share/eigen_conversions/package.xml:/<version>/s/[^0-9.]//gp'	\
  'share/kdl_conversions/package.xml:/<version>/s/[^0-9.]//gp'		\
  'share/tf/package.xml:/<version>/s/[^0-9.]//gp'			\
  'share/tf_conversions/package.xml:/<version>/s/[^0-9.]//gp'		\
  'lib/pkgconfig/eigen_conversions.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/kdl_conversions.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/tf.pc:/Version/s/[^0-9.]//gp'				\
  'lib/pkgconfig/tf_conversions.pc:/Version/s/[^0-9.]//gp'

include ../../math/eigen3/depend.mk

endif # ROS_GEOMETRY_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
