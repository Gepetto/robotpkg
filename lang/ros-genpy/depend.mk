# robotpkg depend.mk for:	lang/ros-genpy
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_GENPY_DEPEND_MK:=	${ROS_GENPY_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros-genpy
endif

ifeq (+,$(ROS_GENPY_DEPEND_MK)) # ------------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-genpy?=	${PREFER.ros-base}

DEPEND_USE+=		ros-genpy

DEPEND_ABI.ros-genpy?=	ros-genpy>=0.3.4
DEPEND_DIR.ros-genpy?=	../../lang/ros-genpy

SYSTEM_SEARCH.ros-genpy=\
	bin/genmsg_py.py					\
	bin/gensrv_py.py					\
	share/genpy/cmake/genpy-config.cmake			\
	'share/genpy/stack.xml:/<version>/s/[^0-9.]//gp'	\
	'lib/pkgconfig/genpy.pc:/Version/s/[^0-9.]//gp'

export GENMSG_PY_BIN=	${PREFIX.ros-genpy}/bin/genmsg_py.py
export GENSRV_PY_BIN=	${PREFIX.ros-genpy}/bin/gensrv_py.py
CMAKE_ARGS+=		-DGENMSG_PY_BIN=${GENMSG_PY_BIN}
CMAKE_ARGS+=		-DGENSRV_PY_BIN=${GENSRV_PY_BIN}

endif # ROS_GENPY_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
