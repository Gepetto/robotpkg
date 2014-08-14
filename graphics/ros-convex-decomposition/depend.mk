# robotpkg depend.mk for:	graphics/ros-convex-decomposition
# Created:			Séverin Lemaignan on Tue, 06 Aug 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_CONVEX_DECOMPOSITION_DEPEND_MK:=	${ROS_CONVEX_DECOMPOSITION_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-convex-decomposition
endif

ifeq (+,$(ROS_CONVEX_DECOMPOSITION_DEPEND_MK)) # ---------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-convex-decomposition?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-convex-decomposition?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-convex-decomposition
ROS_DEPEND_USE+=		ros-convex-decomposition

DEPEND_ABI.ros-convex-decomposition?=	ros-convex-decomposition>=0.1
DEPEND_DIR.ros-convex-decomposition=	../../graphics/ros-convex-decomposition

SYSTEM_SEARCH.ros-convex-decomposition=\
	bin/convex_decomposition		\
	'share/convex_decomposition/package.xml:/<version>/s/[^0-9.]//gp'

endif # ROS_CONVEX_DECOMPOSITION_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
