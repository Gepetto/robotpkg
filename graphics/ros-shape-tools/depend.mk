# robotpkg Makefile for:	graphics/ros-shape-tools
# Created:			Anthony Mallet on Wed, 13 Aug 2014
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_SHAPE_TOOLS_DEPEND_MK:=	${ROS_SHAPE_TOOLS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-shape-tools
endif

ifeq (+,$(ROS_SHAPE_TOOLS_DEPEND_MK)) # ------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-shape-tools?=	${PREFER.ros-base}
SYSTEM_PREFIX.ros-shape-tools?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-shape-tools
ROS_DEPEND_USE+=		ros-shape-tools

DEPEND_ABI.ros+=ros<=jade

DEPEND_ABI.ros-shape-tools?=	ros-shape-tools>=0.1
DEPEND_DIR.ros-shape-tools?=	../../graphics/ros-shape-tools

DEPEND_ABI.ros-shape-tools.groovy?=	ros-shape-tools>=0.1<0.2
DEPEND_ABI.ros-shape-tools.hydro?=	ros-shape-tools>=0.2<0.3
DEPEND_ABI.ros-shape-tools.indigo?=	ros-shape-tools>=0.2<0.3
DEPEND_ABI.ros-shape-tools.jade?=	ros-shape-tools>=0.2<0.3

SYSTEM_SEARCH.ros-shape-tools=\
  'include/shape_tools/shape_extents.h'				\
  'lib/libshape_tools.so'					\
  'lib/pkgconfig/shape_tools.pc:/Version/s/[^0-9.]//gp'		\
  'share/shape_tools/package.xml:/<version>/s/[^0-9.]//gp'

endif # ROS_SHAPE_TOOLS_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
