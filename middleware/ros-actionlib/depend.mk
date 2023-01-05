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

DEPEND_DIR.ros-actionlib=	../../middleware/ros-actionlib

DEPEND_ABI.ros-actionlib.groovy+=	ros-actionlib>=1.9<1.10
DEPEND_ABI.ros-actionlib.hydro+=	ros-actionlib>=1.10<1.11
DEPEND_ABI.ros-actionlib.indigo+=	ros-actionlib>=1.11<1.12
DEPEND_ABI.ros-actionlib.jade+=		ros-actionlib>=1.11<1.12
DEPEND_ABI.ros-actionlib.kinetic+=	ros-actionlib>=1.11<1.12
DEPEND_ABI.ros-actionlib.lunar+=	ros-actionlib>=1.11<1.12
DEPEND_ABI.ros-actionlib.melodic+=	ros-actionlib>=1.11<1.13
DEPEND_ABI.ros-actionlib.noetic?=	ros-actionlib>=1.13<1.15

SYSTEM_SEARCH.ros-actionlib=\
	include/actionlib/server/action_server.h		\
	include/actionlib/client/action_client.h		\
	lib/libactionlib.so					\
	'share/actionlib/package.xml:/<version>/s/[^0-9.]//gp'	\
	'lib/pkgconfig/actionlib.pc:/Version/s/[^0-9.]//gp'

include ../../devel/boost-headers/depend.mk

# patch-aa for boost::placeholders requires this for robotpkg version
DEPEND_ABI.boost-headers+=\
  $(if $(filter robotpkg,${PREFER.ros-actionlib}),boost-headers>=1.60)

endif # ROS_ACTIONLIB_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
