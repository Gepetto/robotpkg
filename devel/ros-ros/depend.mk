# robotpkg depend.mk for:	devel/ros-ros
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_ROS_DEPEND_MK:=	${ROS_ROS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros-ros
endif

ifeq (+,$(ROS_ROS_DEPEND_MK)) # --------------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-ros?=	${PREFER.ros-base}
SYSTEM_PREFIX.ros-ros?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=		ros-ros

DEPEND_ABI.ros-ros?=	ros-ros>=1.9<1.10
DEPEND_DIR.ros-ros?=	../../devel/ros-ros

SYSTEM_SEARCH.ros-ros=\
	bin/rosrun					\
	lib/libroslib.so				\
	'share/ros/package.xml:/<version>/s/[^0-9.]//gp'\
	'${PYTHON_SYSLIBSEARCH}/ros/__init__.py'	\
	'lib/pkgconfig/roslib.pc:/Version/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

# Define the proper ros environment
#
PATH.ros-ros+=		bin

ROS_PACKAGE_DIRS+=	${PREFIX.ros-ros}
export ROS_PACKAGE_PATH=$(call prependpaths,${ROS_PACKAGE_DIRS})

endif # ROS_ROS_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
