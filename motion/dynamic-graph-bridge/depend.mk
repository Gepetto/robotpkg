# robotpkg depend.mk for:	motion/dynamic-graph-bridge
# Created:			Aurelie Clodic on Mon, 16 Dec 2013
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
ROS_DYNAMICGRAPHBRIDGE_DEPEND_MK:=	${ROS_DYNAMICGRAPHBRIDGE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			dynamic-graph-bridge
endif

ifeq (+,$(ROS_DYNAMICGRAPHBRIDGE_DEPEND_MK)) # -----------------------------

DEPEND_USE+=			dynamic-graph-bridge

DEPEND_ABI.dynamic-graph-bridge?=	dynamic-graph-bridge>=1.0.0
DEPEND_DIR.dynamic-graph-bridge?=	../../motion/dynamic-graph-bridge

DEPEND_ABI.dynamic-graph-bridge.groovy?=dynamic-graph-bridge>=1.0.0
DEPEND_ABI.dynamic-graph-bridge.hydro?=	dynamic-graph-bridge>=1.0.0

SYSTEM_SEARCH.dynamic-graph-bridge=\
  'include/dynamic_graph_bridge/config.hh'				\
  'lib/pkgconfig/dynamic_graph_bridge.pc:/Version/s/[^0-9.]//gp'	\
  'lib/plugin/robot_model.so'						\
  'share/dynamic_graph_bridge/robot_pose_publisher'			\
  '${PYTHON_SITELIB}/dynamic_graph/ros/ros.py'

include ../../mk/sysdep/python.mk

endif # ROS_DYNAMICGRAPHBRIDGE_DEPEND_MK -----------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

# headers and .pc leak tons of dependencies ...
include ../../devel/ros-realtime-tools/depend.mk
include ../../interfaces/jrl-mal/depend.mk
include ../../lang/ros-message-runtime/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../motion/dynamic-graph-bridge-msgs/depend.mk
include ../../motion/dynamic-graph/depend.mk
include ../../motion/py-dynamic-graph/depend.mk
include ../../motion/sot-core/depend.mk
include ../../motion/sot-dynamic/depend.mk
include ../../mk/sysdep/bullet.mk
