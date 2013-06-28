# robotpkg depend.mk for:	devel/ros-dynamic-reconfigure
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
ROS_DYNAMIC_RECONFIGURE_DEPEND_MK:=	${ROS_DYNAMIC_RECONFIGURE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				ros-dynamic-reconfigure
endif

ifeq (+,$(ROS_DYNAMIC_RECONFIGURE_DEPEND_MK)) # ----------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-dynamic-reconfigure?=	${PREFER.ros-base}
SYSTEM_PREFIX.ros-dynamic-reconfigure?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=				ros-dynamic-reconfigure

DEPEND_ABI.ros-dynamic-reconfigure?=	ros-dynamic-reconfigure>=1.5.32<1.6
DEPEND_DIR.ros-dynamic-reconfigure?=	../../middleware/ros-dynamic-reconfigure

SYSTEM_SEARCH.ros-dynamic-reconfigure=\
  'include/dynamic_reconfigure/Config.h'				\
  'share/dynamic_reconfigure/package.xml:/<version>/s/[^0-9.]//gp'	\
  '${PYTHON_SYSLIBSEARCH}/dynamic_reconfigure/__init__.py'		\
  'lib/pkgconfig/dynamic_reconfigure.pc:/Version/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

endif # ROS_DYNAMIC_RECONFIGURE_DEPEND_MK ----------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
