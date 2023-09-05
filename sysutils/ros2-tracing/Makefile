# robotpkg Makefile for:	sysutils/ros2-tracing
# Created:			Anthony Mallet on Tue, 12 Apr 2022
#

ROS2_PKG=	ros2_tracing
ROS2_VERSION=	7.1.0
PKGNAME=	$(subst _,-,${ROS2_PKG})-${ROS2_VERSION}

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

# Disable for now. To enable, handle the optional lttng dependency and the
# variable PLIST due to -rdynamic exported flag.
CMAKE_ARGS+=	-DTRACETOOLS_DISABLED=ON

PYSETUPINSTALL_SCRIPT= ${PREFIX}/lib/tracetools_trace

include ../../devel/ament-cmake-ros/depend.mk
include ../../mk/robotpkg.mk
