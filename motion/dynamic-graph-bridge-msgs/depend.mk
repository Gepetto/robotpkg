# robotpkg depend.mk for:	motion/dynamic-graph-bridge-msgs
# Created:			Aurelie Clodic on Fri, 17 Oct 2014
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
ROS_DYNAMICGRAPHBRIDGEMSGS_DEPEND_MK:=	${ROS_DYNAMICGRAPHBRIDGEMSGS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				dynamic-graph-bridge-msgs
endif

ifeq (+,$(ROS_DYNAMICGRAPHBRIDGEMSGS_DEPEND_MK)) # -------------------------

include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-message-runtime/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../mk/sysdep/python.mk

PREFER.dynamic-graph-bridge-msgs?=	robotpkg

DEPEND_USE+=				dynamic-graph-bridge-msgs
DEPEND_ABI.dynamic-graph-bridge-msgs?=	dynamic-graph-bridge-msgs>=0.2.0
DEPEND_DIR.dynamic-graph-bridge-msgs?=	../../motion/dynamic-graph-bridge-msgs

SYSTEM_SEARCH.dynamic-graph-bridge-msgs=\
  'include/dynamic_graph_bridge_msgs/Matrix.h'			\
  '${PYTHON_SITELIB}/dynamic_graph_bridge_msgs/__init__.py'	\
  'lib/pkgconfig/dynamic_graph_bridge_msgs.pc:/Version/s/[^0-9.]//gp'

endif # ROS_DYNAMICGRAPHBRIDGEMSGS_DEPEND_MK -------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
