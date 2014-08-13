# robotpkg depend.mk for:	devel/ros-bond-core
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_BONDCPP_CORE_DEPEND_MK:=	${ROS_BONDCPP_CORE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-bond-core
endif

ifeq (+,$(ROS_BONDCPP_CORE_DEPEND_MK)) # -----------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-bond-core?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-bond-core?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-bond-core
ROS_DEPEND_USE+=		ros-bond-core

DEPEND_ABI.ros-bond-core?=	ros-bond-core>=1.7
DEPEND_DIR.ros-bond-core?=	../../devel/ros-bond-core

DEPEND_ABI.ros-bond-core.groovy?=	ros-bond-core>=1.7<1.8
DEPEND_ABI.ros-bond-core.hydro?=	ros-bond-core>=1.7<1.8
DEPEND_ABI.ros-bond-core.indigo?=	ros-bond-core>=1.7<1.8

SYSTEM_SEARCH.ros-bond-core=\
  'include/bondcpp/bond.h'						\
  'lib/libbondcpp.so'							\
  '${PYTHON_SYSLIBSEARCH}/bondpy/__init__.py'				\
  'share/bondcpp/package.xml:/<version>/s/[^0-9.]//gp'			\
  'lib/pkgconfig/bond.pc:/Version/s/[^0-9.]//gp'			\
  'lib/pkgconfig/bondcpp.pc:/Version/s/[^0-9.]//gp'

endif # ROS_BONDCPP_CORE_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
