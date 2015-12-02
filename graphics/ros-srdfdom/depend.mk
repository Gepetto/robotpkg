# robotpkg depend.mk for:	math/ros-srdfdom
# Created:			Anthony Mallet on Thu,  4 Jul 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_SRDFDOM_DEPEND_MK:=	${ROS_SRDFDOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-srdfdom
endif

ifeq (+,$(ROS_SRDFDOM_DEPEND_MK)) # ----------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-srdfdom?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-srdfdom?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-srdfdom
ROS_DEPEND_USE+=		ros-srdfdom

DEPEND_ABI.ros-srdfdom?=	ros-srdfdom>=0.2
DEPEND_DIR.ros-srdfdom?=	../../graphics/ros-srdfdom

DEPEND_ABI.ros-srdfdom.groovy?=	ros-srdfdom>=0.2<0.3
DEPEND_ABI.ros-srdfdom.hydro?=	ros-srdfdom>=0.2<0.3
DEPEND_ABI.ros-srdfdom.indigo?=	ros-srdfdom>=0.2

SYSTEM_SEARCH.ros-srdfdom=\
  'include/srdfdom/model.h'					\
  'lib/libsrdfdom.so'						\
  'share/srdfdom/package.xml:/<version>/s/[^0-9.]//gp'		\
  'lib/pkgconfig/srdfdom.pc:/Version/s/[^0-9.]//gp'

endif # ROS_SRDFDOM_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
