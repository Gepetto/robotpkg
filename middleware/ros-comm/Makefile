# robotpkg Makefile for:	middleware/ros-comm
# Created:			Anthony Mallet on Tue, 18 Jan 2011
#

ROS_PKG=		ros_comm
ROS_VERSION=		1.9.46
ROS_METAPKG=		yes

PKGNAME=		$(subst _,-,${ROS_PKG})-${ROS_VERSION}

CATEGORIES=		middleware
ROS_COMMENT=		communications-related libraries and tools

include ../../meta-pkgs/ros-base/Makefile.common

# Fix prefix
SUBST_CLASSES+=		ros-prefix
SUBST_STAGE.ros-prefix=	pre-configure
SUBST_MESSAGE.ros-prefix=Fixing harcoded prefix in scripts
SUBST_FILES.ros-prefix=	tools/roslaunch/src/roslaunch/config.py
SUBST_SED.ros-prefix=\
  -e "s@'/opt/ros/%s/env.sh'%(distro_name)@'${PREFIX}/etc/ros/env.sh'@"


# Replace python interpreter in source files
SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	*/*/*/*.py */*/*/*/*.py
SUBST_FILES.py-interp+=	tools/*/scripts/*
SUBST_FILES.py-interp+=	test/test_*/test/nodes/*
SUBST_FILES.py-interp+=	test/test_rosbag/bag_migration_tests/test/*.py.in
SUBST_FILES.py-interp+=	tools/rostest/nodes/hztest
SUBST_FILES.py-interp+=	utilities/roswtf/scripts/roswtf
SUBST_FILES.py-interp+=	test/test_rospy/nodes/talker

include ../../archivers/bzip2/depend.mk
include ../../devel/boost-headers/depend.mk
include ../../devel/boost-libs/depend.mk
include ../../devel/log4cxx/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-ros/depend.mk
include ../../devel/ros-roscpp-core/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-message-generation/depend.mk
include ../../middleware/ros-genmsg/depend.mk
include ../../sysutils/py-rospkg/depend.mk
include ../../mk/sysdep/apr.mk
include ../../mk/sysdep/bash.mk
include ../../mk/sysdep/py-imaging.mk
include ../../mk/sysdep/py-netifaces.mk
include ../../mk/sysdep/py-numpy.mk
include ../../mk/sysdep/py-paramiko.mk
include ../../mk/sysdep/py-yaml.mk
include ../../mk/robotpkg.mk
