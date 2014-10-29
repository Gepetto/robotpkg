# robotpkg depend.mk for:	sysutils/ros-rviz
# Created:			Charles Lesire on Wed, 9 Apr 2014
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_RVIZ_DEPEND_MK:=		${ROS_ROS_RVIZ_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-rviz
endif

ifeq (+,$(ROS_RVIZ_DEPEND_MK)) # -------------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-rviz?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-rviz?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-rviz
ROS_DEPEND_USE+=		ros-rviz

DEPEND_ABI.ros-rviz?=		ros-rviz>=1.9
DEPEND_DIR.ros-rviz=		../../sysutils/ros-rviz

DEPEND_ABI.ros += ros>=groovy

SYSTEM_SEARCH.ros-rviz=\
  'bin/rviz'							\
  'include/rviz/config.h'					\
  'lib/librviz.so'						\
  '${PYTHON_SYSLIBSEARCH}/rviz/__init__.py'			\
  'share/rviz/package.xml:/<version>/s/[^0-9.]//gp'		\
  'lib/pkgconfig/rviz.pc:/Version/s/[^0-9.]//gp'

endif # ROS_RVIZ_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
