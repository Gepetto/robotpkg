# robotpkg depend.mk for:	lang/ros-genpy
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_GENPY_DEPEND_MK:=	${ROS_GENPY_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-genpy
endif

ifeq (+,$(ROS_GENPY_DEPEND_MK)) # ------------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-genpy?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-genpy?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-genpy
ROS_DEPEND_USE+=		ros-genpy

DEPEND_ABI.ros-genpy?=		ros-genpy>=0.4
DEPEND_DIR.ros-genpy?=		../../lang/ros-genpy

DEPEND_ABI.ros-genpy.groovy?=	ros-genpy>=0.4<0.5
DEPEND_ABI.ros-genpy.hydro?=	ros-genpy>=0.4<0.5
DEPEND_ABI.ros-genpy.indigo?=	ros-genpy>=0.5<0.6
DEPEND_ABI.ros-genpy.jade?=	ros-genpy>=0.5<0.6
DEPEND_ABI.ros-genpy.kinetic?=	ros-genpy>=0.6<0.7

SYSTEM_SEARCH.ros-genpy=\
	'{lib/genpy,share/genpy/bin}/genmsg_py.py'		\
	'{lib/genpy,share/genpy/bin}/gensrv_py.py'		\
	'share/genpy/package.xml:/<version>/s/[^0-9.]//gp'	\
	'lib/pkgconfig/genpy.pc:/Version/s/[^0-9.]//gp'

endif # ROS_GENPY_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
