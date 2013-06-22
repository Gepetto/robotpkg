# robotpkg Makefile for:	lang/ros-genlisp
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

ROS_PKG=		genlisp
ROS_VERSION=		0.4.11

CATEGORIES=		lang
ROS_COMMENT=		lisp code generator for ROS .msg format
HOMEPAGE=		http://www.ros.org/wiki/roslisp

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	scripts/gen_lisp.py

PYTHON_PLIST_COMPILE_PATTERN=/genlisp[\/].*[.]py$$/

include ../../devel/ros-catkin/depend.mk
include ../../middleware/ros-genmsg/depend.mk
include ../../mk/robotpkg.mk
