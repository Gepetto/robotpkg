# robotpkg depend.mk for:	devel/ros2-python-cmake-module
# Created:			Anthony Mallet on Mon, 11 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS2_PYTHON_CMAKE_DEPEND_MK:=	${ROS2_PYTHON_CMAKE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-python-cmake-module
endif

ifeq (+,$(ROS2_PYTHON_CMAKE_DEPEND_MK)) # ----------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-python-cmake-module

DEPEND_METHOD.ros2-python-cmake-module?=build
DEPEND_ABI.ros2-python-cmake-module?=	ros2-python-cmake-module>=0
DEPEND_DIR.ros2-python-cmake-module?=	../../devel/ros2-python-cmake-module

SYSTEM_SEARCH.ros2-python-cmake-module=\
  $(call ros2_system_search, python_cmake_module)

include ../../mk/sysdep/python.mk

# Set EXT_SUFFIX consistently.
# When using a vanilla system package, an empty PYTHON_EXT_SUFFIX will be
# rejected (see patch-aa). But on systems where there is a python-cmake-module
# system package, the definition is not supposed to be empty.
CMAKE_ARGS+=-DPythonExtra_EXTENSION_SUFFIX=${PYTHON_EXT_SUFFIX:.so=}

endif # ROS2_PYTHON_CMAKE_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
