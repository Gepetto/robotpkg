# robotpkg depend.mk for:	interfaces/ros2-rosidl-typesupport-fastrtps
# Created:			Anthony Mallet on Mon, 11 Apr 2022
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
ROS2_ROSIDL_TS_FASTRTPS_DEPEND_MK:=	${ROS2_ROSIDL_TS_FASTRTPS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros2-rosidl-typesupport-fastrtps
endif

ifeq (+,$(ROS2_ROSIDL_TS_FASTRTPS_DEPEND_MK)) # ----------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ros2-rosidl-typesupport-fastrtps

# ros2-rosidl-typesupport-fastrtps<2.2.0 has too many glitches regarding
# Export*.cmake files
#
DEPEND_DIR.ros2-rosidl-typesupport-fastrtps?=\
  ../../interfaces/ros2-rosidl-typesupport-fastrtps
DEPEND_ABI.ros2-rosidl-typesupport-fastrtps?=\
  ros2-rosidl-typesupport-fastrtps>=2.2.0

SYSTEM_SEARCH.ros2-rosidl-typesupport-fastrtps=\
  $(call ros2_system_search,			\
    fastrtps_cmake_module			\
    rosidl_typesupport_fastrtps_c		\
    rosidl_typesupport_fastrtps_cpp)

include ../../interfaces/ros2-rosidl/depend.mk
include ../../middleware/fastcdr/depend.mk
include ../../middleware/ros2-rmw/depend.mk
include ../../devel/ament-cmake-ros/depend.mk

# PLIST management depending on version
#
ROSIDL_GENERATOR_SRCS.rosidl+=\
  ${DEPEND_DIR.ros2-rosidl-typesupport-fastrtps}/files/generator.awk
ROSIDL_GENERATOR_VERS.rosidl+=$(addsuffix				\
  -$(call pkgversion,${PKGVERSION.ros2-rosidl-typesupport-fastrtps}),	\
    rosidl_typesupport_fastrtps_c					\
    rosidl_typesupport_fastrtps_cpp)

# For some reason, those empty dirs are installed. They are marked as generated
# but print-PLIST doesn't use the filters for directories.
#
PRINT_PLIST_IGNORE_DIRS+= @pkgdir include/.*/detail/dds_fastrtps$$

endif # ROS2_ROSIDL_TS_FASTRTPS_DEPEND_MK ----------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
