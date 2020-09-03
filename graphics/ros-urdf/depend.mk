# robotpkg depend.mk for:	graphics/ros-urdf
# Created:			Anthony Mallet on Tue, 11 Sep 2018
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_URDF_DEPEND_MK:=		${ROS_URDF_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-urdf
endif

ifeq (+,$(ROS_URDF_DEPEND_MK)) # -------------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-urdf?=	${PREFER.ros-base}
SYSTEM_PREFIX.ros-urdf?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-urdf
ROS_DEPEND_USE+=		ros-urdf

DEPEND_DIR.ros-urdf?=		../../graphics/ros-urdf

DEPEND_ABI.ros-urdf.groovy?=	ros-urdf>=1.9<1.10
DEPEND_ABI.ros-urdf.hydro?=	ros-urdf>=1.10<1.11
DEPEND_ABI.ros-urdf.indigo?=	ros-urdf>=1.11<1.12
DEPEND_ABI.ros-urdf.jade?=	ros-urdf>=1.11<1.12
DEPEND_ABI.ros-urdf.kinetic?=	ros-urdf>=1.12<1.13
DEPEND_ABI.ros-urdf.lunar?=	ros-urdf>=1.12<1.13
DEPEND_ABI.ros-urdf.melodic?=	ros-urdf>=1.13<1.14
DEPEND_ABI.ros-urdf.noetic?=	ros-urdf>=1.13<1.14

SYSTEM_SEARCH.ros-urdf=\
  'include/urdf/model.h'						\
  'lib/liburdf.so'							\
  'lib/pkgconfig/urdf.pc:/Version/s/[^0-9.]//gp'			\
  'lib/pkgconfig/urdf_parser_plugin.pc:/Version/s/[^0-9.]//gp'		\
  'share/urdf/cmake/urdfConfig.cmake'					\
  'share/urdf_parser_plugin/cmake/urdf_parser_pluginConfig.cmake'	\
  'share/urdf/package.xml:/<version>/s/[^0-9.]//gp'			\
  'share/urdf_parser_plugin/package.xml:/<version>/s/[^0-9.]//gp'

SYSTEM_PKG.Ubuntu.ros-urdf= ros-${PKG_ALTERNATIVE.ros}-urdf
SYSTEM_PKG.Ubuntu.ros-urdf+= ros-${PKG_ALTERNATIVE.ros}-urdf-parser-plugin

endif # ROS_URDF_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
