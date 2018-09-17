# robotpkg depend.mk for:	sysutils/ros-rqt-graph
# Created:			Anthony Mallet on Mon, 17 Sep 2018
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_RQT_GRAPH_DEPEND_MK:=	${ROS_RQT_GRAPH_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-rqt-graph
endif

ifeq (+,$(ROS_RQT_GRAPH_DEPEND_MK)) # ---------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-rqt-graph?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-rqt-graph?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-rqt-graph
ROS_DEPEND_USE+=		ros-rqt-graph

DEPEND_ABI.ros-rqt-graph?=	ros-rqt-graph>=0.2
DEPEND_DIR.ros-rqt-graph?=	../../sysutils/ros-rqt-graph

SYSTEM_SEARCH.ros-rqt-graph=\
  'bin/rqt_graph'						\
  '${PYTHON_SYSLIBSEARCH}/rqt_graph/__init__.py'		\
  'share/rqt_graph/package.xml:/<version>/s/[^0-9.]//gp'	\
  'lib/pkgconfig/rqt_graph.pc:/Version/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

endif # ROS_RQT_GRAPH_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=				${DEPEND_DEPTH:+=}
