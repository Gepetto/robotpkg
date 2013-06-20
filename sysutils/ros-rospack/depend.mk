# robotpkg depend.mk for:	sysutils/ros-rospack
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_ROSPACK_DEPEND_MK:=	${ROS_ROSPACK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-rospack
endif

ifeq (+,$(ROS_ROSPACK_DEPEND_MK)) # ----------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-rospack?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-rospack?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-rospack

DEPEND_ABI.ros-rospack?=	ros-rospack>=2.1
DEPEND_DIR.ros-rospack?=	../../sysutils/ros-rospack

SYSTEM_SEARCH.ros-rospack=\
	bin/rospack						\
	'share/rospack/package.xml:/<version>/s/[^0-9.]//gp'	\
	'lib/pkgconfig/rospack.pc:/Version/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

CMAKE_PREFIX_PATH+=	${PREFIX.ros-rospack}

# rospack system package doesn't have any RPATH
LD_LIBRARY_DIRS.ros-rospack=$(if $(filter robotpkg,${PREFER.ros-rospack}),,lib)

endif # ROS_ROSPACK_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
