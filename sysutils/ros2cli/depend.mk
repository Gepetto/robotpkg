# robotpkg depend.mk for:	sysutils/ros2cli
# Created:			Anthony Mallet on Thu, 14 Apr 2022
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS2CLI_DEPEND_MK:=	${ROS2CLI_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros2cli
endif

ifeq (+,$(ROS2CLI_DEPEND_MK)) # --------------------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=	ros2cli

DEPEND_ABI.ros2cli?=	ros2cli>=0
DEPEND_DIR.ros2cli?=	../../sysutils/ros2cli

SYSTEM_SEARCH.ros2cli=\
  'bin/ros2'			\
  $(foreach _,			\
      ros2action		\
      ros2cli			\
      ros2component		\
      ros2doctor		\
      ros2interface		\
      ros2lifecycle		\
      ros2multicast		\
      ros2node			\
      ros2param			\
      ros2pkg			\
      ros2run			\
      ros2service		\
      ros2topic,		\
    'share/$_/package.xml:/<version>/s/[^0-9.]//gp')

endif # ROS2CLI_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
