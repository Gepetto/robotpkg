# robotpkg depend.mk for:	sysutils/py-rospkg
# Created:			Anthony Mallet on Sun, 15 Jul 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
CATKIN_DEPEND_MK:=	${CATKIN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		catkin
endif

ifeq (+,$(CATKIN_DEPEND_MK)) # ---------------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.catkin?=		${PREFER.ros-base}
SYSTEM_PREFIX.catkin?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=		catkin

DEPEND_METHOD.catkin?=	build
DEPEND_ABI.catkin?=	catkin>=0.4
DEPEND_DIR.catkin?=	../../devel/catkin

SYSTEM_SEARCH.catkin=\
	'lib/pkgconfig/catkin.pc:/Version/s/[^0-9.]//gp'	\
	'share/catkin/cmake/catkin-config.cmake'		\
	'share/ros/cmake/ros-config.cmake'			\
	'${PYTHON_SYSLIBSEARCH}/catkin/__init__.py'

include ../../mk/sysdep/python.mk
include ../../mk/sysdep/cmake.mk

endif # CATKIN_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
