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
ROS_DEPEND_USE+=	ros-genmsg

DEPEND_ABI.ros-genmsg?=	ros-genmsg>=0.3
DEPEND_DIR.ros-genmsg?=	../../middleware/ros-genmsg

DEPEND_ABI.ros-genmsg.fuerte?=	ros-genmsg>=0.3<0.4
DEPEND_ABI.ros-genmsg.groovy?=	ros-genmsg>=0.4
DEPEND_ABI.ros-genmsg.hydro?=	ros-genmsg>=0.4

SYSTEM_SEARCH.ros-genmsg=\
	'share/genmsg/${ROS_STACKAGE}:/<version>/s/[^0-9.]//gp'	\
	'lib/pkgconfig/genmsg.pc:/Version/s/[^0-9.]//gp'

endif # ROS_GENMSG_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
