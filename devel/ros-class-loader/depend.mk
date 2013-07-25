# robotpkg depend.mk for:	devel/ros-class-loader
# Created:			Anthony Mallet on Thu, 27 Jun 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_CLASS_LOADER_DEPEND_MK:=	${ROS_CLASS_LOADER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-class-loader
endif

ifeq (+,$(ROS_CLASS_LOADER_DEPEND_MK)) # -----------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-class-loader?=	${PREFER.ros-base}
SYSTEM_PREFIX.ros-class-loader?=${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-class-loader
ROS_DEPEND_USE+=		ros-class-loader

DEPEND_ABI.ros+=		ros>=groovy

DEPEND_ABI.ros-class-loader?=	ros-class-loader>=0.1
DEPEND_DIR.ros-class-loader?=	../../devel/ros-class-loader

DEPEND_ABI.ros-class-loader.groovy?=	ros-class-loader>=0.1<0.2
DEPEND_ABI.ros-class-loader.hydro?=	ros-class-loader>=0.2<0.3

SYSTEM_SEARCH.ros-class-loader=\
  'include/class_loader/class_loader.h'				\
  'lib/libclass_loader.so'					\
  'share/class_loader/${ROS_STACKAGE}:/<version>/s/[^0-9.]//gp'	\
  'lib/pkgconfig/class_loader.pc:/Version/s/[^0-9.]//gp'

endif # ROS_CLASS_LOADER_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
