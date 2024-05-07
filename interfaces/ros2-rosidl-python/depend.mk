# robotpkg depend.mk for:	interfaces/ros2-rosidl-python
# Created:			Anthony Mallet on Mon, 11 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS2_ROSIDL_PYTHON_DEPEND_MK:=	${ROS2_ROSIDL_PYTHON_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-rosidl-python
endif

ifeq (+,$(ROS2_ROSIDL_PYTHON_DEPEND_MK)) # ---------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-rosidl-python

DEPEND_DIR.ros2-rosidl-python?=	../../interfaces/ros2-rosidl-python
DEPEND_ABI.ros2-rosidl-python?=	ros2-rosidl-python>=0.21

SYSTEM_SEARCH.ros2-rosidl-python=\
  $(call ros2_system_search, rosidl_generator_py)	\
  '${PYTHON_SYSLIBSEARCH}/rosidl_generator_py/__init__.py'

include ../../devel/ros2-python-cmake-module/depend.mk
include ../../sysutils/py-ros2-rpyutils/depend.mk
include ../../mk/sysdep/py-numpy.mk
include ../../mk/sysdep/python.mk

# For python-cmake-module<0.12 as a system package, PYTHON_EXT_SUFFIX is
# needed.
#
PLIST_FILTER+=\
  $(if $(and								\
    $(filter system,${PREFER.ros2-python-cmake-module}),		\
    $(call isyes,$(call pmatch,						\
      ros2-python-cmake-module<0.12,					\
      ${PKGVERSION.ros2-python-cmake-module}))),			\
    | ${AWK} '								\
        /$(subst /,\/,${PYTHON_SITELIB})/ && /[.]so$$/ {		\
          gsub(/[.]so$$/, "${PYTHON_EXT_SUFFIX}");			\
        }								\
        {print}')

PRINT_PLIST_AWK_SUBST+=\
  gsub(/[$$]{PYTHON_EXT_SUFFIX}$$/, ".so")

endif # ROS2_ROSIDL_PYTHON_DEPEND_MK ---------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
