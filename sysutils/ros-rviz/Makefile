# robotpkg depend.mk for:	sysutils/ros-rviz
# Created:			Charles Lesire on Wed, 9 Apr 2014
#

ROS_PKG=	rviz
ROS_VERSION=	1.14.25
ROS_REPO=	ros-visualization

CATEGORIES=	sysutils
ROS_COMMENT=	3D visualization tool

include ../../meta-pkgs/ros-base/Makefile.common

DEPEND_ABI.libogre += libogre>=1.7

include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-cmake-modules/depend.mk
include ../../devel/ros-pluginlib/depend.mk
include ../../devel/ros-ros/depend.mk
include ../../devel/tinyxml/depend.mk
include ../../graphics/ros-interactive-markers/depend.mk
include ../../graphics/ros-python-qt-binding/depend.mk
include ../../graphics/ros-urdf/depend.mk
include ../../image/ros-image-common/depend.mk
include ../../image/ros-vision-opencv/depend.mk
include ../../interfaces/ros-comm-msgs/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../interfaces/ros-navigation-msgs/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../mapping/ros-laser-geometry/depend.mk
include ../../math/eigen3/depend.mk
include ../../math/ros-geometry/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../net/ros-resource-retriever/depend.mk
include ../../mk/sysdep/assimp.mk
include ../../mk/sysdep/libogre.mk
include ../../mk/sysdep/qt5-qtbase.mk
include ../../mk/sysdep/yaml-cpp.mk
include ../../mk/robotpkg.mk

# The following file (ld version script) is installed no matter what, for no
# reason (and only on linux distributions). There is no cmake rule installing
# this and setuptools MANIFEST.in or exclude_package_data don't have any effect
# (apart from stating that the file is not found). There must be a better way,
# but in the meantime:
post-install: remove-extra-files
remove-extra-files:
	${RUN}${RM} \
	  ${DESTDIR}${PREFIX}/${PYTHON_SITELIB}/rviz/librviz_sip.exp
