# robotpkg depend.mk for:	sysutils/ros-cmake-modules
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_CMAKE_MODULES_DEPEND_MK:=	${ROS_CMAKE_MODULES_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-cmake-modules
endif

ifeq (+,$(ROS_CMAKE_MODULES_DEPEND_MK)) # ----------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-cmake-modules?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-cmake-modules?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=				ros-cmake-modules
ROS_DEPEND_USE+=			ros-cmake-modules

DEPEND_METHOD.ros-cmake-modules?=	build
DEPEND_ABI.ros-cmake-modules?=		ros-cmake-modules>=0.3
DEPEND_DIR.ros-cmake-modules?=		../../devel/ros-cmake-modules

SYSTEM_SEARCH.ros-cmake-modules=\
  'share/cmake_modules/cmake/cmake_modulesConfig.cmake'		\
  'share/cmake_modules/package.xml:/<version>/s/[^0-9.]//gp'	\
  'lib/pkgconfig/cmake_modules.pc:/Version/s/[^0-9.]//gp'

endif # ROS_CMAKE_MODULES_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
