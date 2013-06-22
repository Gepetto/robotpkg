# robotpkg depend.mk for:	middleware/ros-genmsg
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_GENMSG_DEPEND_MK:=	${ROS_GENMSG_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros-genmsg
endif

ifeq (+,$(ROS_GENMSG_DEPEND_MK)) # -----------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-genmsg?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-genmsg?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=		ros-genmsg

DEPEND_ABI.ros-genmsg?=	ros-genmsg>=0.4<0.5
DEPEND_DIR.ros-genmsg?=	../../middleware/ros-genmsg

SYSTEM_SEARCH.ros-genmsg=\
	'share/genmsg/package.xml:/<version>/s/[^0-9.]//gp'	\
	'lib/pkgconfig/genmsg.pc:/Version/s/[^0-9.]//gp'

endif # ROS_GENMSG_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
