# robotpkg depend.mk for:	motion/ros2-dynamic-graph-bridge-msgs
# Created:			Anthony Mallet on Fri, 11 Aug 2023
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
DYNGRAPHBRMSGS_ROS2_DEPEND_MK:=		${DYNGRAPHBRMSGS_ROS2_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				dynamic-graph-bridge-msgs-ros2
endif

ifeq (+,$(DYNGRAPHBRMSGS_ROS2_DEPEND_MK)) # --------------------------------

include ../../mk/sysdep/python.mk

PREFER.dynamic-graph-bridge-msgs-ros2?=	robotpkg

DEPEND_USE+=				dynamic-graph-bridge-msgs-ros2
DEPEND_ABI.dynamic-graph-bridge-msgs-ros2?=\
  dynamic-graph-bridge-msgs-ros2>=0.2.0
DEPEND_DIR.dynamic-graph-bridge-msgs-ros2?=\
  ../../motion/dynamic-graph-bridge-msgs-ros2

SYSTEM_SEARCH.dynamic-graph-bridge-msgs-ros2=\
  'include/dynamic_graph_bridge_msgs/Matrix.h'			\
  '${PYTHON_SITELIB}/dynamic_graph_bridge_msgs/__init__.py'	\
  'lib/pkgconfig/dynamic_graph_bridge_msgs.pc:/Version/s/[^0-9.]//gp'

endif # DYNGRAPHBRMSGS_ROS2_DEPEND_MK --------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
