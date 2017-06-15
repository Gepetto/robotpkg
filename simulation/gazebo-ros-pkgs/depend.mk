# robotpkg depend.mk for:	simulation/ros-gazebo-ros-pkgs
# Created:			Anthony Mallet on Thu, 15 Jun 2017
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
GAZEBO_ROS_PKGS_DEPEND_MK:=	${GAZEBO_ROS_PKGS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			gazebo-ros-pkgs
endif

ifeq (+,$(GAZEBO_ROS_PKGS_DEPEND_MK)) # ------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.gazebo-ros-pkgs?=	${PREFER.ros-base}
SYSTEM_PREFIX.gazebo-ros-pkgs?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			gazebo-ros-pkgs
ROS_DEPEND_USE+=		gazebo-ros-pkgs

DEPEND_ABI.ros+=                ros>=hydro

DEPEND_ABI.gazebo-ros-pkgs?=	gazebo-ros-pkgs>=2.3
DEPEND_DIR.gazebo-ros-pkgs?=	../../simulation/gazebo-ros-pkgs

DEPEND_ABI.gazebo-ros-pkgs.hydro?=	gazebo-ros-pkgs>=2.3<2.4
DEPEND_ABI.gazebo-ros-pkgs.indigo?=	gazebo-ros-pkgs>=2.4<2.5
DEPEND_ABI.gazebo-ros-pkgs.jade?=	gazebo-ros-pkgs>=2.5<2.7
DEPEND_ABI.gazebo-ros-pkgs.kinetic?=	gazebo-ros-pkgs>=2.5<2.7

SYSTEM_SEARCH.gazebo-ros-pkgs=\
  'include/gazebo_msgs/WorldState.h'					\
  'include/gazebo_plugins/PubQueue.h'					\
  'include/gazebo_ros/PhysicsConfig.h'					\
  'lib/libgazebo_ros_api_plugin.so'					\
  'share/gazebo_ros_pkgs/package.xml:/<version>/s/[^0-9.]//gp'		\
  $(foreach _,								\
    gazebo_msgs gazebo_plugins gazebo_ros gazebo_ros_control,		\
  'share/$_/cmake/$_Config.cmake'					\
  'lib/pkgconfig/$_.pc:/Version/s/[^0-9.]//gp')

endif # GAZEBO_ROS_PKGS_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
