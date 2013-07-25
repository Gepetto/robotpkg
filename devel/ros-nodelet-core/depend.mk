# robotpkg depend.mk for:	devel/ros-nodelet-core
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_NODELET_CORE_DEPEND_MK:=	${ROS_NODELET_CORE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-nodelet-core
endif

ifeq (+,$(ROS_NODELET_CORE_DEPEND_MK)) # -----------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-nodelet-core?=	${PREFER.ros-base}
SYSTEM_PREFIX.ros-nodelet-core?=${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-nodelet-core
ROS_DEPEND_USE+=		ros-nodelet-core

DEPEND_ABI.ros-nodelet-core?=	ros-nodelet-core>=1.6
DEPEND_DIR.ros-nodelet-core?=	../../devel/ros-nodelet-core

DEPEND_ABI.ros-nodelet-core.fuerte?=	ros-nodelet-core>=1.6<1.7
DEPEND_ABI.ros-nodelet-core.groovy?=	ros-nodelet-core>=1.7<1.8
DEPEND_ABI.ros-nodelet-core.hydro?=	ros-nodelet-core>=1.8<1.9

SYSTEM_SEARCH.ros-nodelet-core=\
  'include/nodelet/nodelet.h'						\
  'lib/libnodeletlib.so'						\
  '${PYTHON_SYSLIBSEARCH}/nodelet/__init__.py'				\
  'share/nodelet_topic_tools/${ROS_STACKAGE}:/<version>/s/[^0-9.]//gp'	\
  'share/nodelet/${ROS_STACKAGE}:/<version>/s/[^0-9.]//gp'			\
  'lib/pkgconfig/nodelet_topic_tools.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/nodelet.pc:/Version/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

endif # ROS_NODELET_CORE_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
