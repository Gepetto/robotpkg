# robotpkg depend.mk for:	devel/ament-cmake
# Created:			Anthony Mallet on Wed, 30 Mar 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
AMENT_CMAKE_DEPEND_MK:=		${AMENT_CMAKE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ament-cmake
endif

ifeq (+,$(AMENT_CMAKE_DEPEND_MK)) # ----------------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ament-cmake

DEPEND_METHOD.ament-cmake?=	build
DEPEND_ABI.ament-cmake?=	ament-cmake>=0
DEPEND_DIR.ament-cmake?=	../../devel/ament-cmake

SYSTEM_SEARCH.ament-cmake=\
  $(call ros2_system_search, ament_cmake)

include ../../sysutils/py-ament-package/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk

# common options
CMAKE_ARGS+=	-DBUILD_TESTING=OFF
CMAKE_ARGS+=	-DAMENT_CMAKE_UNINSTALL_TARGET=OFF
CMAKE_ARGS+=	-DCMAKE_INSTALL_LIBDIR=lib

endif # AMENT_CMAKE_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
