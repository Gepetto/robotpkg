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
  $(call ros2_system_search,			\
    ament_cmake					\
    ament_cmake_core				\
    ament_cmake_export_definitions		\
    ament_cmake_export_dependencies		\
    ament_cmake_export_include_directories	\
    ament_cmake_export_interfaces		\
    ament_cmake_export_libraries		\
    ament_cmake_export_link_flags		\
    ament_cmake_export_targets			\
    ament_cmake_gen_version_h			\
    ament_cmake_gmock				\
    ament_cmake_gtest				\
    ament_cmake_include_directories		\
    ament_cmake_libraries			\
    ament_cmake_pytest				\
    ament_cmake_python				\
    ament_cmake_target_dependencies		\
    ament_cmake_test				\
    ament_cmake_version)

include ../../sysutils/py-ament-package/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk

# common options
CMAKE_ARGS+=	-DBUILD_TESTING=OFF
CMAKE_ARGS+=	-DAMENT_CMAKE_UNINSTALL_TARGET=OFF
CMAKE_ARGS+=	-DCMAKE_INSTALL_LIBDIR=lib
CMAKE_ARGS+=	-DPYTHON_INSTALL_DIR=${PYTHON_SITELIB}

endif # AMENT_CMAKE_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
