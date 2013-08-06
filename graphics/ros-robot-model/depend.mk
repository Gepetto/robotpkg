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

DEPEND_ABI.ros+=		ros>=groovy
DEPEND_ABI.ros-robot-model?=	ros-robot-model>=1.9
DEPEND_DIR.ros-robot-model?=	../../graphics/ros-robot-model

DEPEND_ABI.ros-robot-model.groovy?=	ros-robot-model>=1.9<1.10
DEPEND_ABI.ros-robot-model.hydro?=	ros-robot-model>=1.10<1.11

SYSTEM_SEARCH.ros-robot-model=\
  'include/collada_parser/collada_parser.h'				\
  'include/collada_urdf/collada_urdf.h'					\
  'include/kdl_parser/kdl_parser.hpp'					\
  'include/resource_retriever/retriever.h'				\
  'lib/libcollada_parser.so'						\
  'lib/libcollada_urdf.so'						\
  'lib/libkdl_parser.so'						\
  'lib/libresource_retriever.so'					\
  'lib/liburdf.so'							\
  'lib/pkgconfig/collada_parser.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/collada_urdf.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/kdl_parser.pc:/Version/s/[^0-9.]//gp'			\
  'lib/pkgconfig/resource_retriever.pc:/Version/s/[^0-9.]//gp'		\
  'share/collada_parser/${ROS_STACKAGE}:/<version>/s/[^0-9.]//gp'		\
  'share/collada_urdf/${ROS_STACKAGE}:/<version>/s/[^0-9.]//gp'		\
  'share/kdl_parser/${ROS_STACKAGE}:/<version>/s/[^0-9.]//gp'		\
  'share/resource_retriever/${ROS_STACKAGE}:/<version>/s/[^0-9.]//gp'

# kdl_parser uses tinyxml in its public interface
include ../../mk/sysdep/tinyxml.mk
INCLUDE_DIRS.tinyxml = $(dir $(filter %/tinyxml.h,${SYSTEM_FILES.tinyxml}))
LIBRARY_DIRS.tinyxml = lib
RPATH_DIRS.tinyxml = lib

endif # ROS_ROBOT_MODEL_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
