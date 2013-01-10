# robotpkg Makefile for:	lang/ros-genlisp
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

ROS_PKG=		genlisp
ROS_VERSION=		0.3.3

CATEGORIES=		lang
ROS_COMMENT=		lisp code generator for ROS .msg format
HOMEPAGE=		http://www.ros.org/wiki/roslisp

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-distsetup

include ../../devel/catkin/depend.mk
include ../../middleware/ros-genmsg/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
