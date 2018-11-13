# robotpkg depend.mk for:	sysutils/py-rospkg
# Created:			Anthony Mallet on Sun, 15 Jul 2012
#
ifndef CATKIN_MARKER_MK
CATKIN_MARKER_MK=defined

DEPEND_DIR.ros-catkin?=	../../devel/ros-catkin

# INSTALL script keeping track of ${PREFIX}/.catkin file
INSTALL_VARS+=	ECHO CHMOD CP FIND GREP MKDIR RM TEST
INSTALL_SRC+=	${DEPEND_DIR.ros-catkin}/files/catkin
DEINSTALL_SRC+=	${DEPEND_DIR.ros-catkin}/files/catkin

endif # CATKIN_MARKER_MK
