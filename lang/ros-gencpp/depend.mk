# robotpkg depend.mk for:	lang/ros-gencpp
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_GENCPP_DEPEND_MK:=	${ROS_GENCPP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros-gencpp
endif

ifeq (+,$(ROS_GENCPP_DEPEND_MK)) # -----------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-gencpp?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-gencpp?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=		ros-gencpp

DEPEND_ABI.ros-gencpp?=	ros-gencpp>=0.4<0.5
DEPEND_DIR.ros-gencpp?=	../../lang/ros-gencpp

SYSTEM_SEARCH.ros-gencpp=\
	lib/gencpp/gen_cpp.py					\
	'share/gencpp/package.xml:/<version>/s/[^0-9.]//gp'	\
	'lib/pkgconfig/gencpp.pc:/Version/s/[^0-9.]//gp'

endif # ROS_GENCPP_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
