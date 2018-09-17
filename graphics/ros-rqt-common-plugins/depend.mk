# robotpkg depend.mk for:	devel/ros-rqt-common-plugins
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
ROS_RQT_COMMON_PLUGINS_DEPEND_MK:=	${ROS_RQT_COMMON_PLUGINS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				ros-rqt-common-plugins
endif

ifeq (+,$(ROS_RQT_COMMON_PLUGINS_DEPEND_MK)) # -----------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-rqt-common-plugins?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-rqt-common-plugins?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=				ros-rqt-common-plugins
ROS_DEPEND_USE+=			ros-rqt-common-plugins

DEPEND_ABI.ros-rqt-common-plugins?=	ros-rqt-common-plugins>=0.2
DEPEND_DIR.ros-rqt-common-plugins?=	../../graphics/ros-rqt-common-plugins

SYSTEM_SEARCH.ros-rqt-common-plugins=\
  'share/rqt_common_plugins/package.xml:/<version>/s/[^0-9.]//gp'

endif # ROS_RQT_COMMON_PLUGINS_DEPEND_MK -----------------------------------

DEPEND_DEPTH:=				${DEPEND_DEPTH:+=}
