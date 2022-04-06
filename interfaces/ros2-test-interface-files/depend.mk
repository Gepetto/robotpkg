# robotpkg depend.mk for:	devel/ros2-test-interface-files
# Created:			Anthony Mallet on Wed,  6 Apr 2022
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
ROS2_TEST_INTERFACE_FILES_DEPEND_MK:=	${ROS2_TEST_INTERFACE_FILES_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				ros2-test-interface-files
endif

ifeq (+,$(ROS2_TEST_INTERFACE_FILES_DEPEND_MK)) # --------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=			ros2-test-interface-files

DEPEND_ABI.ros2-test-interface-files?=	ros2-test-interface-files>=0
DEPEND_DIR.ros2-test-interface-files?=\
  ../../interfaces/ros2-test-interface-files

SYSTEM_SEARCH.ros2-test-interface-files=\
  $(call ros2_system_search, test_interface_files)

endif # ROS2_TEST_INTERFACE_FILES_DEPEND_MK --------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
