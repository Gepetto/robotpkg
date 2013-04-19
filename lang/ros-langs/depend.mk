# robotpkg depend.mk for:	lang/ros-langs
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_LANGS_DEPEND_MK:=	${ROS_LANGS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros-langs
endif

ifeq (+,$(ROS_LANGS_DEPEND_MK)) # ------------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-langs?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-langs?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=		ros-langs

DEPEND_ABI.ros-langs?=	ros-langs>=0.3.5
DEPEND_DIR.ros-langs?=	../../lang/ros-langs

SYSTEM_SEARCH.ros-langs=\
	'share/langs/stack.xml:/<version>/s/[^0-9.]//gp'	\
	'lib/pkgconfig/langs.pc:/Version/s/[^0-9.]//gp'

include ../../devel/roscpp-core/depend.mk
include ../../lang/ros-langs-dev/depend.mk

endif # ROS_LANGS_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
