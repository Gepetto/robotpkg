# robotpkg depend.mk for:	devel/ros-lint
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS_LINT_DEPEND_MK:=	${ROS_LINT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros-lint
endif

ifeq (+,$(ROS_LINT_DEPEND_MK)) # -------------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-lint?=	${PREFER.ros-base}
SYSTEM_PREFIX.ros-lint?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=		ros-lint
ROS_DEPEND_USE+=	ros-lint

DEPEND_ABI.ros-lint?=	ros-lint>=0.9
DEPEND_DIR.ros-lint?=	../../devel/ros-lint

SYSTEM_SEARCH.ros-lint=\
  'share/roslint/package.xml:/<version>/s/[^0-9.]//gp'	\
  '${PYTHON_SYSLIBSEARCH}/roslint/__init__.py'		\
  'lib/pkgconfig/roslint.pc:/Version/s/[^0-9.]//gp'

endif # ROS_LINT_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
