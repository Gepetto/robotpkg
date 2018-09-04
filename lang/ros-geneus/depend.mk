# robotpkg depend.mk for:	lang/ros-geneus
# Created:			Anthony Mallet on Tue,  4 Sep 2018
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_GENEUS_DEPEND_MK:=	${ROS_GENEUS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-geneus
endif

ifeq (+,$(ROS_GENEUS_DEPEND_MK)) # -----------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-geneus?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-geneus?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-geneus
ROS_DEPEND_USE+=		ros-geneus

DEPEND_ABI.ros-geneus?=		ros-geneus>=2.2.0
DEPEND_DIR.ros-geneus?=		../../lang/ros-geneus

SYSTEM_SEARCH.ros-geneus=\
	'share/geneus/cmake/geneusConfig.cmake'			\
	'share/geneus/package.xml:/<version>/s/[^0-9.]//gp'	\
	'lib/pkgconfig/geneus.pc:/Version/s/[^0-9.]//gp'

endif # ROS_GENEUS_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
