# robotpkg depend.mk for:	middleware/ros-genmsg
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_GENMSG_DEPEND_MK:=	${ROS_GENMSG_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros-genmsg
endif

ifeq (+,$(ROS_GENMSG_DEPEND_MK)) # -----------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-genmsg?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-genmsg?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=		ros-genmsg
ROS_DEPEND_USE+=	ros-genmsg

DEPEND_ABI.ros-genmsg?=	ros-genmsg>=0.5<0.7
DEPEND_DIR.ros-genmsg?=	../../middleware/ros-genmsg
SYSTEM_SEARCH.ros-genmsg=\
  '${PYTHON_SYSLIBSEARCH}/genmsg/__init__.py'		\
  'share/genmsg/cmake/genmsgConfig.cmake'		\
  'share/genmsg/package.xml:/<version>/s/[^0-9.]//gp'	\
  'lib/pkgconfig/genmsg.pc:/Version/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

# disable unwanted languages (hardcoded for now, because this otherwise makes
# the PLIST not static or not predictable)
export ROS_LANG_DISABLE=geneus:gennodejs

endif # ROS_GENMSG_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
