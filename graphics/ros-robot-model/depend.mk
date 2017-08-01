# robotpkg depend.mk for:	graphics/ros-robot-model
# Created:			Anthony Mallet on Fri,  5 Jul 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_ROBOT_MODEL_DEPEND_MK:=	${ROS_ROBOT_MODEL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-robot-model
endif

ifeq (+,$(ROS_ROBOT_MODEL_DEPEND_MK)) # ------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-robot-model?=	${PREFER.ros-base}
SYSTEM_PREFIX.ros-robot-model?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-robot-model
ROS_DEPEND_USE+=		ros-robot-model

DEPEND_ABI.ros-robot-model?=	ros-robot-model>=1.9
DEPEND_DIR.ros-robot-model?=	../../graphics/ros-robot-model

DEPEND_ABI.ros-robot-model.groovy?=	ros-robot-model>=1.9<1.10
DEPEND_ABI.ros-robot-model.hydro?=	ros-robot-model>=1.10<1.11
DEPEND_ABI.ros-robot-model.indigo?=	ros-robot-model>=1.11<1.12
DEPEND_ABI.ros-robot-model.jade?=	ros-robot-model>=1.11<1.12
DEPEND_ABI.ros-robot-model.kinetic?=	ros-robot-model>=1.12<1.13
DEPEND_ABI.ros-robot-model.lunar?=	ros-robot-model>=1.12<1.13

SYSTEM_SEARCH.ros-robot-model=\
  'include/collada_parser/collada_parser.h'				\
  'include/collada_urdf/collada_urdf.h'					\
  'include/kdl_parser/kdl_parser.hpp'					\
  'lib/libcollada_parser.so'						\
  'lib/libcollada_urdf.so'						\
  'lib/libkdl_parser.so'						\
  'lib/liburdf.so'							\
  'lib/pkgconfig/collada_parser.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/collada_urdf.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/kdl_parser.pc:/Version/s/[^0-9.]//gp'			\
  'share/collada_parser/package.xml:/<version>/s/[^0-9.]//gp'		\
  'share/collada_urdf/package.xml:/<version>/s/[^0-9.]//gp'		\
  'share/kdl_parser/package.xml:/<version>/s/[^0-9.]//gp'

# kdl_parser uses tinyxml in its public interface
include ../../mk/sysdep/tinyxml.mk
INCLUDE_DIRS.tinyxml = $(dir $(filter %/tinyxml.h,${SYSTEM_FILES.tinyxml}))
LIBRARY_DIRS.tinyxml = lib
RPATH_DIRS.tinyxml = lib

# system ros packages don't have rpath set, and libraries dependencies cannot
# be resolved without adding this ...
RPATH_DIRS.ros-robot-model =	lib

endif # ROS_ROBOT_MODEL_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
