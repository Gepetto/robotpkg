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

# No testing in robotpkg, this reduces required dependencies
CMAKE_ARGS+=	-DBUILD_TESTING=OFF

# Replace python interpreter in source files
SUBST_CLASSES+=	py-interp
SUBST_FILES.py-interp=\
  ament_cmake_core/cmake/core/package_xml_2_cmake.py		\
  ament_cmake_core/cmake/package_templates/templates_2_cmake.py	\

# Force cmake to find exact python version
SUBST_CLASSES+=	py-vers
SUBST_STAGE.py-vers=	pre-configure
SUBST_MESSAGE.py-vers=	Forcing exact python version search
SUBST_SED.py-vers=\
  -e 's|package(Python3 REQ|package(Python3 ${PYTHON_VERSION} EXACT REQ|'
SUBST_FILES.py-vers=\
  ament_cmake_core/cmake/core/python.cmake

# uses FindPython3
DEPEND_ABI.cmake+=	cmake>=3.12

include ../../sysutils/py-ament-package/depend.mk
include ../../sysutils/py-catkin-pkg/depend.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
