# robotpkg depend.mk for:	lang/ros-gennodejs
# Created:			Anthony Mallet on Tue,  4 Sep 2018
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_GENNODEJS_DEPEND_MK:=	${ROS_GENNODEJS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-gennodejs
endif

ifeq (+,$(ROS_GENNODEJS_DEPEND_MK)) # --------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-gennodejs?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-gennodejs?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-gennodejs
ROS_DEPEND_USE+=		ros-gennodejs

DEPEND_ABI.ros+=		ros>=kinetic

DEPEND_ABI.ros-gennodejs?=	ros-gennodejs>=2.0
DEPEND_DIR.ros-gennodejs?=	../../lang/ros-gennodejs

SYSTEM_SEARCH.ros-gennodejs=\
	'share/gennodejs/cmake/gennodejsConfig.cmake'		\
	'share/gennodejs/package.xml:/<version>/s/[^0-9.]//gp'	\
	'lib/pkgconfig/gennodejs.pc:/Version/s/[^0-9.]//gp'

endif # ROS_GENNODEJS_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
