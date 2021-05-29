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

DEPEND_ABI.ros-comm.groovy?=	ros-comm>=1.9<1.10
DEPEND_ABI.ros-comm.hydro?=	ros-comm>=1.10<1.11
DEPEND_ABI.ros-comm.indigo?=	ros-comm>=1.11<1.12
DEPEND_ABI.ros-comm.jade?=	ros-comm>=1.11<1.12
DEPEND_ABI.ros-comm.kinetic?=	ros-comm>=1.12<1.13
DEPEND_ABI.ros-comm.lunar?=	ros-comm>=1.13<1.14
DEPEND_ABI.ros-comm.melodic?=	ros-comm>=1.13<1.15
DEPEND_ABI.ros-comm.noetic?=	ros-comm>=1.15<1.16

SYSTEM_SEARCH.ros-comm=\
  'bin/roscore'							\
  'include/ros/ros.h'						\
  'lib/libroscpp.so'						\
  'share/ros_comm/package.xml:/<version>/s/[^0-9.]//gp'		\
  'lib/pkgconfig/roscpp.pc:/Version/s/[^0-9.]//gp'

CMAKE_PREFIX_PATH.ros-comm=	${PREFIX.ros-comm}

SYSTEM_PKG.Ubuntu.ros-comm=	ros-${PKG_ALTERNATIVE.ros}-ros-comm

# patch-ap for boost::placeholders requires this
DEPEND_ABI.boost-headers+=	boost-headers>=1.60

endif # ROS_COMM_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
