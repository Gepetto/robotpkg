# robotpkg depend.mk for:	graphics/ros-ivcon
# Created:			Séverin Lemaignan on Tue, 06 Aug 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_IVCON_DEPEND_MK:=	${ROS_IVCON_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-ivcon
endif

ifeq (+,$(ROS_IVCON_DEPEND_MK)) # --------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-ivcon?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-ivcon?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-ivcon
ROS_DEPEND_USE+=		ros-ivcon

DEPEND_ABI.ros-ivcon?=	ros-ivcon>=0.1
DEPEND_DIR.ros-ivcon=	../../graphics/ros-ivcon

SYSTEM_SEARCH.ros-ivcon=\
	bin/ivcon		\
	'share/ivcon/package.xml:/<version>/s/[^0-9.]//gp'	\

endif # ROS_IVCON_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
