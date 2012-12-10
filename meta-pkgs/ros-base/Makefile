# robotpkg Makefile for:	meta-pkgs/ros-base
# Created:			Anthony Mallet on Wed, 19 Jan 2011
#

DISTNAME=	ros-base-1.8
CATEGORIES=	meta-pkgs

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.ros.org/wiki/
COMMENT=	The Robotic Operating System

META_PACKAGE=	yes
NOT_FOR_PLATFORM=
MESSAGE_SUBST+=	PYTHON_VERSION=${PYTHON_VERSION}

PREFIX?=	${LOCALBASE}/opt/ros/fuerte

include ../../devel/catkin/depend.mk
include ../../devel/ros-core/depend.mk
include ../../devel/roscpp-core/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-gencpp/depend.mk
include ../../lang/ros-genlisp/depend.mk
include ../../lang/ros-genpy/depend.mk
include ../../lang/ros-langs/depend.mk
include ../../lang/ros-langs-dev/depend.mk
include ../../middleware/ros-actionlib/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../middleware/ros-genmsg/depend.mk
include ../../sysutils/rospack/depend.mk
include ../../mk/robotpkg.mk
