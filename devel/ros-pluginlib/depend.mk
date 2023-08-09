# robotpkg depend.mk for:	devel/ros-pluginlib
# Created:			Anthony Mallet on Thu, 27 Jun 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_PLUGINLIB_DEPEND_MK:=	${ROS_PLUGINLIB_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-pluginlib
endif

ifeq (+,$(ROS_PLUGINLIB_DEPEND_MK)) # --------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-pluginlib?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-pluginlib?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-pluginlib
ROS_DEPEND_USE+=		ros-pluginlib

DEPEND_DIR.ros-pluginlib?=	../../devel/ros-pluginlib
DEPEND_ABI.ros-pluginlib?=	ros-pluginlib>=1.10

SYSTEM_SEARCH.ros-pluginlib=\
  'include/pluginlib/class_loader.h'				\
  'share/pluginlib/package.xml:/<version>/s/[^0-9.]//gp'	\
  'share/pluginlib/cmake/pluginlibConfig.cmake'			\
  'lib/pkgconfig/pluginlib.pc:/Version/s/[^0-9.]//gp'

include ../../devel/ros-class-loader/depend.mk

endif # ROS_PLUGINLIB_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
