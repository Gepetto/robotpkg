# robotpkg depend.mk for:	middleware/ros-rx
# Created:			Anthony Mallet on Mon, 20 Feb 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_RX_DEPEND_MK:=	${ROS_RX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros-rx
endif

ifeq (+,$(ROS_RX_DEPEND_MK)) # ---------------------------------------------

PREFER.ros-rx?=		robotpkg

SYSTEM_SEARCH.ros-rx=\
	rx/rxtools/bin/rxconsole

DEPEND_USE+=		ros-rx

DEPEND_ABI.ros-rx?=	ros-rx>=1.6.2
DEPEND_DIR.ros-rx?=	../../graphics/ros-rx

endif # ROS_RX_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
