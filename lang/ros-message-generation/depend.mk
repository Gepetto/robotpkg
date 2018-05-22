# robotpkg depend.mk for:	lang/ros-message-generation
# Created:			Anthony Mallet on Sun, 23 Jun 2013
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
ROS_MESSAGE_GENERATION_DEPEND_MK:=	${ROS_MESSAGE_GENERATION_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				ros-message-generation
endif

ifeq (+,$(ROS_MESSAGE_GENERATION_DEPEND_MK)) # -----------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-message-generation?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-message-generation?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=				ros-message-generation
ROS_DEPEND_USE+=			ros-message-generation

DEPEND_ABI.ros-message-generation?=	ros-message-generation>=0.2
DEPEND_DIR.ros-message-generation?=	../../lang/ros-message-generation

DEPEND_ABI.ros-message-generation.groovy?=	ros-message-generation>=0.2<0.3
DEPEND_ABI.ros-message-generation.hydro?=	ros-message-generation>=0.2<0.3
DEPEND_ABI.ros-message-generation.indigo?=	ros-message-generation>=0.2<0.3
DEPEND_ABI.ros-message-generation.jade?=	ros-message-generation>=0.3<0.4
DEPEND_ABI.ros-message-generation.kinetic?=	ros-message-generation>=0.4<0.5
DEPEND_ABI.ros-message-generation.lunar?=	ros-message-generation>=0.4<0.5
DEPEND_ABI.ros-message-generation.melodic?=	ros-message-generation>=0.4<0.5

SYSTEM_SEARCH.ros-message-generation=\
	'share/message_generation/package.xml:/<version>/s/[^0-9.]//gp'	\
	'lib/pkgconfig/message_generation.pc:/Version/s/[^0-9.]//gp'

include ../../middleware/ros-genmsg/depend.mk

endif # ROS_MESSAGE_GENERATION_DEPEND_MK -----------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
