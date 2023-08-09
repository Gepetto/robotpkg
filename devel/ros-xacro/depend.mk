# robotpkg depend.mk for:	devel/ros-xacro
# Created:			Séverin Lemaignan on Tue, 06 Aug 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_XACRO_DEPEND_MK:=	${ROS_XACRO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-xacro
endif

ifeq (+,$(ROS_XACRO_DEPEND_MK)) # --------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-xacro?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-xacro?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-xacro
ROS_DEPEND_USE+=		ros-xacro

DEPEND_DIR.ros-xacro=		../../devel/ros-xacro
DEPEND_ABI.ros-xacro?=	ros-xacro>=1.12

SYSTEM_SEARCH.ros-xacro=\
	'lib/xacro/xacro'					\
	'share/xacro/package.xml:/<version>/s/[^0-9.]//gp'	\
	'lib/pkgconfig/xacro.pc:/Version/s/[^0-9.]//gp'

endif # ROS_XACRO_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
