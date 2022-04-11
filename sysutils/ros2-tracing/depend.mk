# robotpkg depend.mk for:	sysutils/ros2-tracing
# Created:			Anthony Mallet on Tue, 12 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS2_TRACING_DEPEND_MK:=	${ROS2_TRACING_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-tracing
endif

ifeq (+,$(ROS2_TRACING_DEPEND_MK)) # ---------------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-tracing

DEPEND_ABI.ros2-tracing?=	ros2-tracing>=0
DEPEND_DIR.ros2-tracing?=	../../sysutils/ros2-tracing

SYSTEM_SEARCH.ros2-tracing=\
  $(call ros2_system_search,				\
    test_tracetools					\
    tracetools)						\
  '${PYTHON_SITELIB}/ros2trace/__init__.py'		\
  '${PYTHON_SITELIB}/tracetools_launch/__init__.py'	\
  '${PYTHON_SITELIB}/tracetools_read/__init__.py'	\
  '${PYTHON_SITELIB}/tracetools_test/__init__.py'	\
  '${PYTHON_SITELIB}/tracetools_trace/__init__.py'

include ../../mk/sysdep/python.mk

endif # ROS2_TRACING_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
