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

DEPEND_ABI.ros-xacro?=		ros-xacro>=1.7
DEPEND_DIR.ros-xacro=		../../devel/ros-xacro

DEPEND_ABI.ros-xacro.groovy+=	ros-xacro>=1.7<1.8
DEPEND_ABI.ros-xacro.hydro+=	ros-xacro>=1.8<1.9
DEPEND_ABI.ros-xacro.indigo+=	ros-xacro>=1.9<1.10
DEPEND_ABI.ros-xacro.jade+=	ros-xacro>=1.10<1.11
DEPEND_ABI.ros-xacro.kinetic+=	ros-xacro>=1.11<1.12

SYSTEM_SEARCH.ros-xacro=\
	'lib/xacro/xacro'					\
	'share/xacro/package.xml:/<version>/s/[^0-9.]//gp'	\
	'lib/pkgconfig/xacro.pc:/Version/s/[^0-9.]//gp'

endif # ROS_XACRO_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
