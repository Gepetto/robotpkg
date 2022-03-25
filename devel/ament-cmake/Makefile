# robotpkg Makefile for:	devel/ament-cmake
# Created:			Anthony Mallet on Wed, 30 Mar 2022
#

DISTNAME=	ament_cmake-1.3.0
PKGNAME=	$(subst _,-,${DISTNAME})
ROS2_REPO=	ament

COMMENT=	CMake packages for working with ament.
CATEGORIES=	devel

ROS2_AMENTPKG=	no
ROS2_SUBPKGS=\
  ament_cmake_core			\
  ament_cmake_export_dependencies	\
  ament_cmake				\
  ament_cmake_libraries			\
  ament_cmake_export_definitions	\
  ament_cmake_export_include_directories\
  ament_cmake_export_interfaces		\
  ament_cmake_export_link_flags		\
  ament_cmake_export_targets		\
  ament_cmake_gtest			\
  ament_cmake_python			\
  ament_cmake_test			\
  ament_cmake_gen_version_h		\
  ament_cmake_target_dependencies	\
  ament_cmake_include_directories	\
  ament_cmake_version			\
  ament_cmake_export_libraries		\
  ament_cmake_auto			\
  ament_cmake_gmock			\
  ament_cmake_google_benchmark		\
  ament_cmake_nose			\
  ament_cmake_pytest

include ../../meta-pkgs/ros2-core/Makefile.common

SUBST_CLASSES+=	py-interp
SUBST_FILES.py_interp=\
  ament_cmake_core/cmake/core/package_xml_2_cmake.py		\
  ament_cmake_core/cmake/package_templates/templates_2_cmake.py	\

include ../../sysutils/py-ament-package/depend.mk
include ../../sysutils/py-catkin-pkg/depend.mk
include ../../mk/sysdep/googletest.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
