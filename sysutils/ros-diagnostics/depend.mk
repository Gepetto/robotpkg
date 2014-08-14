# robotpkg depend.mk for:	sysutils/ros-diagnostics
# Created:			Séverin Lemaignan on Tue, 6 Aug 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_DIAGNOSTICS_DEPEND_MK:=	${ROS_DIAGNOSTICS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-diagnostics
endif

ifeq (+,$(ROS_DIAGNOSTICS_DEPEND_MK)) # ---------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-diagnostics?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-diagnostics?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-diagnostics
ROS_DEPEND_USE+=		ros-diagnostics

DEPEND_ABI.ros-diagnostics?=	ros-diagnostics>=1.7
DEPEND_DIR.ros-diagnostics=	../../sysutils/ros-diagnostics

DEPEND_ABI.ros-diagnostics.groovy += ros-diagnostics>=1.7<1.8
DEPEND_ABI.ros-diagnostics.hydro += ros-diagnostics>=1.8<1.9
DEPEND_ABI.ros-diagnostics.indigo += ros-diagnostics>=1.8<1.9

SYSTEM_SEARCH.ros-diagnostics=\
  'include/diagnostic_aggregator/aggregator.h'				\
  'include/diagnostic_updater/diagnostic_updater.h'			\
  'include/self_test/self_test.h'					\
  'lib/libdiagnostic_aggregator.so'					\
  'share/diagnostic_aggregator/package.xml:/<version>/s/[^0-9.]//gp'	\
  'share/diagnostic_analysis/package.xml:/<version>/s/[^0-9.]//gp'	\
  'share/diagnostic_updater/package.xml:/<version>/s/[^0-9.]//gp'	\
  'share/self_test/package.xml:/<version>/s/[^0-9.]//gp'		\
  'lib/pkgconfig/diagnostic_aggregator.pc:/Version/s/[^0-9.]//gp'	\
  'lib/pkgconfig/diagnostic_analysis.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/diagnostic_updater.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/self_test.pc:/Version/s/[^0-9.]//gp'

endif # ROS_DIAGNOSTICS_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
