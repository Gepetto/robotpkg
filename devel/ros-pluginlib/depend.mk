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

DEPEND_ABI.ros-pluginlib?=	ros-pluginlib>=1.9
DEPEND_DIR.ros-pluginlib?=	../../devel/ros-pluginlib

DEPEND_ABI.ros-pluginlib.groovy?=	ros-pluginlib>=1.9<1.10
DEPEND_ABI.ros-pluginlib.hydro?=	ros-pluginlib>=1.9<1.10
DEPEND_ABI.ros-pluginlib.indigo?=	ros-pluginlib>=1.10<1.11
DEPEND_ABI.ros-pluginlib.jade?=		ros-pluginlib>=1.10<1.11
DEPEND_ABI.ros-pluginlib.kinetic?=	ros-pluginlib>=1.10<1.12
DEPEND_ABI.ros-pluginlib.lunar?=	ros-pluginlib>=1.10<1.12

SYSTEM_SEARCH.ros-pluginlib=\
  '{bin,lib/pluginlib}/plugin_macro_update'			\
  'include/pluginlib/class_loader.h'				\
  'share/pluginlib/package.xml:/<version>/s/[^0-9.]//gp'	\
  'lib/pkgconfig/pluginlib.pc:/Version/s/[^0-9.]//gp'

endif # ROS_PLUGINLIB_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
