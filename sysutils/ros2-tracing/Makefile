# robotpkg Makefile for:	sysutils/ros2-tracing
# Created:			Anthony Mallet on Tue, 12 Apr 2022
#

DISTNAME=	ros2_tracing-4.1.0
PKGNAME=	$(subst _,-,${DISTNAME})
MASTER_SITES?=\
  https://gitlab.com/ros-tracing/ros2_tracing/-/archive/${PKGVERSION_NOREV}/

CATEGORIES=	sysutils
ROS2_COMMENT=	tracing tools

ROS2_SUBPKGS=\
    test_tracetools		\
    tracetools			\
  python:			\
    ros2trace			\
    test_tracetools_launch	\
    tracetools_launch		\
    tracetools_read		\
    tracetools_test		\
    tracetools_trace

include ../../meta-pkgs/ros2-core/Makefile.common

PYSETUPINSTALL_SCRIPT= ${PREFIX}/lib/tracetools_trace

include ../../devel/ament-cmake-ros/depend.mk
include ../../mk/robotpkg.mk
