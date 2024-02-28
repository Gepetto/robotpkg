# robotpkg depend.mk for:	middleware/ros-comm
# Created:			Anthony Mallet on Tue, 18 Jan 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_COMM_DEPEND_MK:=	${ROS_COMM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros-comm
endif

ifeq (+,$(ROS_COMM_DEPEND_MK)) # -------------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-comm?=	${PREFER.ros-base}
SYSTEM_PREFIX.ros-comm?=${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=		ros-comm
ROS_DEPEND_USE+=	ros-comm

DEPEND_DIR.ros-comm?=	../../middleware/ros-comm
DEPEND_ABI.ros-comm?=	ros-comm>=1.13

SYSTEM_SEARCH.ros-comm=\
  'bin/roscore'							\
  'include/ros/ros.h'						\
  'lib/libroscpp.so'						\
  'share/ros_comm/package.xml:/<version>/s/[^0-9.]//gp'		\
  'lib/pkgconfig/roscpp.pc:/Version/s/[^0-9.]//gp'

CMAKE_PREFIX_PATH.ros-comm=	${PREFIX.ros-comm}

SYSTEM_PKG.Ubuntu.ros-comm=	ros-${PKG_ALTERNATIVE.ros}-ros-comm

include ../../mk/sysdep/boost-headers.mk

# patch-aa for boost::placeholders requires this for robotpkg version
DEPEND_ABI.boost-headers+=\
  $(if $(filter robotpkg,${PREFER.ros-comm}),boost-headers>=1.60)

endif # ROS_COMM_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
