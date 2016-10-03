# robotpkg depend.mk for:	net/ros-resource_retriever
# Created:			Anthony Mallet on Thu, 14 Aug 2014
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
ROS_RESOURCE_RETRIEVER_DEPEND_MK:=	${ROS_RESOURCE_RETRIEVER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				ros-resource-retriever
endif

ifeq (+,$(ROS_RESOURCE_RETRIEVER_DEPEND_MK)) # -----------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-resource-retriever?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-resource-retriever?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=				ros-resource-retriever
ROS_DEPEND_USE+=			ros-resource-retriever

DEPEND_ABI.ros-resource-retriever?=	ros-resource-retriever>=1.9
DEPEND_DIR.ros-resource-retriever?=	../../net/ros-resource-retriever

DEPEND_ABI.ros-resource-retriever.groovy?=ros-resource-retriever>=1.9<1.10
DEPEND_ABI.ros-resource-retriever.hydro?= ros-resource-retriever>=1.10<1.11
DEPEND_ABI.ros-resource-retriever.indigo?=ros-resource-retriever>=1.11<1.12
DEPEND_ABI.ros-resource-retriever.jade?=ros-resource-retriever>=1.11<1.12
DEPEND_ABI.ros-resource-retriever.kinetic?=ros-resource-retriever>=1.12<1.13

SYSTEM_SEARCH.ros-resource-retriever=\
  'include/resource_retriever/retriever.h'				\
  'lib/libresource_retriever.so'					\
  'lib/pkgconfig/resource_retriever.pc:/Version/s/[^0-9.]//gp'		\
  'share/resource_retriever/package.xml:/<version>/s/[^0-9.]//gp'

endif # ROS_RESOURCE_RETRIEVER_DEPEND_MK -----------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
