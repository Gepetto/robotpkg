# robotpkg depend.mk for:	devel/ros-core
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_CORE_DEPEND_MK:=	${ROS_CORE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros-core
endif

ifeq (+,$(ROS_CORE_DEPEND_MK)) # -------------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-core?=	${PREFER.ros-base}
SYSTEM_PREFIX.ros-core?=${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=		ros-core

DEPEND_ABI.ros-core?=	ros-core>=1.8<1.9
DEPEND_DIR.ros-core?=	../../devel/ros-core

SYSTEM_SEARCH.ros-core=\
	bin/rosrun					\
	lib/libroslib.so				\
	share/roslib/cmake/roslib-config.cmake		\
	share/rosunit/cmake/rosunit-config.cmake	\
	'${PYTHON_SYSLIBSEARCH}/ros/__init__.py'	\
	'lib/pkgconfig/roslib.pc:/Version/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

endif # ROS_CORE_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
