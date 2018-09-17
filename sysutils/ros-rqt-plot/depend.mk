# robotpkg depend.mk for:	sysutils/ros-rqt-plot
# Created:			Anthony Mallet on Mon, 17 Sep 2018
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_RQT_PLOT_DEPEND_MK:=	${ROS_RQT_PLOT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-rqt-plot
endif

ifeq (+,$(ROS_RQT_PLOT_DEPEND_MK)) # ---------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-rqt-plot?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-rqt-plot?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-rqt-plot
ROS_DEPEND_USE+=		ros-rqt-plot

DEPEND_ABI.ros-rqt-plot?=	ros-rqt-plot>=0.2
DEPEND_DIR.ros-rqt-plot?=	../../sysutils/ros-rqt-plot

SYSTEM_SEARCH.ros-rqt-plot=\
  'bin/rqt_plot'						\
  '${PYTHON_SYSLIBSEARCH}/rqt_plot/__init__.py'			\
  'share/rqt_plot/package.xml:/<version>/s/[^0-9.]//gp'		\
  'lib/pkgconfig/rqt_plot.pc:/Version/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

endif # ROS_RQT_PLOT_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=				${DEPEND_DEPTH:+=}
