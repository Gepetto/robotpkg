# robotpkg depend.mk for:	middleware/ros-actionlib
# Created:			Anthony Mallet on Wed, 10 Oct 2012
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_ACTIONLIB_DEPEND_MK:=	${ROS_ACTIONLIB_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-actionlib
endif

ifeq (+,$(ROS_ACTIONLIB_DEPEND_MK)) # --------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-actionlib?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-actionlib?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-actionlib
ROS_DEPEND_USE+=		ros-actionlib

DEPEND_ABI.ros-actionlib?=	ros-actionlib>=1.8
DEPEND_DIR.ros-actionlib=	../../middleware/ros-actionlib

DEPEND_ABI.ros-actionlib.fuerte+=	ros-actionlib>=1.8<1.9
DEPEND_ABI.ros-actionlib.groovy+=	ros-actionlib>=1.9<1.10
DEPEND_ABI.ros-actionlib.hydro+=	ros-actionlib>=1.10<1.11

SYSTEM_SEARCH.ros-actionlib=\
	include/actionlib/server/action_server.h		\
	include/actionlib/client/action_client.h		\
	lib/libactionlib.so					\
	'share/actionlib/${ROS_STACKAGE}:/<version>/s/[^0-9.]//gp'	\
	'lib/pkgconfig/actionlib.pc:/Version/s/[^0-9.]//gp'

endif # ROS_ACTIONLIB_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
