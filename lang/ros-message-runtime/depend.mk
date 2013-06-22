# robotpkg depend.mk for:	lang/ros-message-runtime
# Created:			Anthony Mallet on Sun, 23 Jun 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_MESSAGE_RUNTIME_DEPEND_MK:=	${ROS_MESSAGE_RUNTIME_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				ros-message-runtime
endif

ifeq (+,$(ROS_MESSAGE_RUNTIME_DEPEND_MK)) # --------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-message-runtime?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-message-runtime?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=				ros-message-runtime

DEPEND_ABI.ros-message-runtime?=	ros-message-runtime>=0.4<0.5
DEPEND_DIR.ros-message-runtime?=	../../lang/ros-message-runtime

SYSTEM_SEARCH.ros-message-runtime=\
	'share/message_runtime/package.xml:/<version>/s/[^0-9.]//gp'	\
	'lib/pkgconfig/message_runtime.pc:/Version/s/[^0-9.]//gp'

endif # ROS_MESSAGE_RUNTIME_DEPEND_MK --------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
