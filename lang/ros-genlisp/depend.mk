# robotpkg depend.mk for:	lang/ros-genlisp
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_GENLISP_DEPEND_MK:=	${ROS_GENLISP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros-genlisp
endif

ifeq (+,$(ROS_GENLISP_DEPEND_MK)) # ----------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-genlisp?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-genlisp?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=		ros-genlisp

DEPEND_ABI.ros-genlisp?=ros-genlisp>=0.3.3
DEPEND_DIR.ros-genlisp?=../../lang/ros-genlisp

SYSTEM_SEARCH.ros-genlisp=\
	bin/gen_lisp.py						\
	share/genlisp/cmake/genlisp-config.cmake		\
	'share/genlisp/stack.xml:/<version>/s/[^0-9.]//gp'	\
	'lib/pkgconfig/genlisp.pc:/Version/s/[^0-9.]//gp'

export GENLISP_BIN=	${PREFIX.ros-genlisp}/bin/gen_lisp.py
CMAKE_ARGS+=		-DGENLISP_BIN=${GENLISP_BIN}

endif # ROS_GENLISP_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
