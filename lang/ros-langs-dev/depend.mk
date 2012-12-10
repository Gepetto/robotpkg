# robotpkg depend.mk for:	lang/ros-langs-dev
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_LANGS_DEV_DEPEND_MK:=	${ROS_LANGS_DEV_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros-langs-dev
endif

ifeq (+,$(ROS_LANGS_DEV_DEPEND_MK)) # --------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-langs-dev?=	${PREFER.ros-base}

DEPEND_USE+=		ros-langs-dev

DEPEND_ABI.ros-langs-dev?=ros-langs-dev>=0.1.3
DEPEND_DIR.ros-langs-dev?=../../lang/ros-langs-dev

SYSTEM_SEARCH.ros-langs-dev=\
	'share/langs-dev/stack.xml:/<version>/s/[^0-9.]//gp'	\
	'lib/pkgconfig/langs-dev.pc:/Version/s/[^0-9.]//gp'

include ../../lang/ros-gencpp/depend.mk
include ../../lang/ros-genpy/depend.mk
include ../../lang/ros-genlisp/depend.mk

endif # ROS_LANGS_DEV_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
