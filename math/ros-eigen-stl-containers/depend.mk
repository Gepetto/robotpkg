# robotpkg depend.mk for:	math/ros-eigen-stl-containers
# Created:			Anthony Mallet on Thu, 14 Aug 2014
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
ROS_EIGEN_STL_CONTAINERS_DEPEND_MK:=	${ROS_EIGEN_STL_CONTAINERS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				ros-eigen-stl-containers
endif

ifeq (+,$(ROS_EIGEN_STL_CONTAINERS_DEPEND_MK)) # ---------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-eigen-stl-containers?=	${PREFER.ros-base}
SYSTEM_PREFIX.ros-eigen-stl-containers?=${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=				ros-eigen-stl-containers
ROS_DEPEND_USE+=			ros-eigen-stl-containers

DEPEND_ABI.ros-eigen-stl-containers?=	ros-eigen-stl-containers>=0.1
DEPEND_DIR.ros-eigen-stl-containers?=	../../math/ros-eigen-stl-containers

SYSTEM_SEARCH.ros-eigen-stl-containers=\
  'include/eigen_stl_containers/eigen_stl_containers.h'			\
  'share/eigen_stl_containers/package.xml:/<version>/s/[^0-9.]//gp'	\
  'lib/pkgconfig/eigen_stl_containers.pc:/Version/s/[^0-9.]//gp'

endif # ROS_EIGEN_STL_CONTAINERS_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
