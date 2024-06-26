# robotpkg Makefile for:	middleware/ros-comm
# Created:			Anthony Mallet on Tue, 18 Jan 2011
#

PKGREVISION=		3
ROS_PKG=		ros_comm
ROS_VERSION=		1.14.11
ROS_METAPKG=		yes

PKGNAME=		$(subst _,-,${ROS_PKG})-${ROS_VERSION}

CATEGORIES=		middleware
ROS_COMMENT=		communications-related libraries and tools

include ../../meta-pkgs/ros-base/Makefile.common

DEPEND_ABI.ros-catkin+=	${PKGTAG.python-}ros-catkin>=0.5.68

AES_ENCRYPT_LIBRARIES=$(filter %crypto.so,${SYSTEM_FILES.openssl})
AES_ENCRYPT_LIBRARIES+=$(filter %gpgme.so,${SYSTEM_FILES.gpgme})
CMAKE_ARGS+=\
  -DAES_ENCRYPT_LIBRARIES=$(call quote,$(subst $  ,;,${AES_ENCRYPT_LIBRARIES}))

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

# patch-ap for boost::placeholders requires this
DEPEND_ABI.boost-headers+=	boost-headers>=1.60

include ../../archivers/bzip2/depend.mk
include ../../archivers/lz4/depend.mk
include ../../devel/log4cxx/depend.mk
include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-pluginlib/depend.mk
include ../../devel/ros-ros/depend.mk
include ../../devel/ros-roscpp-core/depend.mk
include ../../interfaces/ros-comm-msgs/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-message-generation/depend.mk
include ../../middleware/ros-genmsg/depend.mk
include ../../sysutils/py-rospkg/depend.mk
include ../../sysutils/console-bridge/depend.mk
include ../../sysutils/ros-console/depend.mk
include ../../mk/sysdep/apr.mk
include ../../mk/sysdep/bash.mk
include ../../mk/sysdep/boost-headers.mk
include ../../mk/sysdep/boost-libs.mk
include ../../mk/sysdep/gpgme.mk
include ../../mk/sysdep/openssl.mk
include ../../mk/sysdep/py-cryptodome.mk
include ../../mk/sysdep/py-defusedxml.mk
include ../../mk/sysdep/py-gnupg.mk
include ../../mk/sysdep/py-imaging.mk
include ../../mk/sysdep/py-netifaces.mk
include ../../mk/sysdep/py-numpy.mk
include ../../mk/sysdep/py-paramiko.mk
include ../../mk/sysdep/py-yaml.mk
include ../../mk/language/c++11.mk

DEPEND_ABI.cmake+= cmake>=3.0.2
DEPEND_ABI.py-rospkg+= ${PKGTAG.python}-rospkg>=1.0.38

include ../../mk/robotpkg.mk
