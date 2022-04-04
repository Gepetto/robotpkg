# robotpkg Makefile for:	sysutils/ament-index
# Created:			Anthony Mallet on Thu,  7 Apr 2022
#

DISTNAME=	ament_index-1.4.0
PKGNAME=	$(subst _,-,${DISTNAME})
ROS2_REPO=	ament

COMMENT=	System for cataloging resources distributed by packages.
CATEGORIES=	sysutils

ROS2_SUBPKGS=\
    ament_index_cpp			\
  python:				\
    ament_index_python

include ../../meta-pkgs/ros2-core/Makefile.common

SUBST_CLASSES+=	py-interp
SUBST_FILES.py_interp=\
  ament_cmake_core/cmake/core/package_xml_2_cmake.py		\
  ament_cmake_core/cmake/package_templates/templates_2_cmake.py	\

include ../../mk/sysdep/googletest.mk
include ../../mk/sysdep/python.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
