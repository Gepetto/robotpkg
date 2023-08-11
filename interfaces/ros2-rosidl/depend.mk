# robotpkg depend.mk for:	interfaces/ros2-rosidl
# Created:			Anthony Mallet on Fri, 1 Apr 2022
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROS2_ROSIDL_DEPEND_MK:=	${ROS2_ROSIDL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ros2-rosidl
endif

ifeq (+,$(ROS2_ROSIDL_DEPEND_MK)) # ----------------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=	ros2-rosidl

# ros2-rosidl-4 introduced rosidl_generator_type_description
#
DEPEND_DIR.ros2-rosidl?=../../interfaces/ros2-rosidl
DEPEND_ABI.ros2-rosidl?=ros2-rosidl>=4

SYSTEM_SEARCH.ros2-rosidl=\
  $(call ros2_system_search,				\
    rosidl_adapter					\
    rosidl_cmake					\
    rosidl_generator_c					\
    rosidl_generator_cpp				\
    rosidl_generator_type_description			\
    rosidl_parser					\
    rosidl_runtime_c					\
    rosidl_runtime_cpp					\
    rosidl_typesupport_interface			\
    rosidl_typesupport_introspection_c			\
    rosidl_typesupport_introspection_cpp)		\
  '${PYTHON_SITELIB}/rosidl_pycommon/__init__.py'	\
  '${PYTHON_SITELIB}/rosidl_cli/__init__.py'

DEPEND_ABI.ros2-rcutils= ros2-rcutils>=6.1

include ../../devel/ros2-rcpputils/depend.mk
include ../../devel/ros2-rcutils/depend.mk
include ../../mk/sysdep/py-empy.mk
include ../../mk/sysdep/python.mk

# Generators
ROSIDL_GENERATOR_SRCS.rosidl-adapter+=\
  ${DEPEND_DIR.ros2-rosidl}/files/adapter.awk
ROSIDL_GENERATOR_VERS.rosidl-adapter+=\
  $(addsuffix -$(call pkgversion,${PKGVERSION.ros2-rosidl}),		\
    rosidl_cmake)

ROSIDL_GENERATOR_SRCS.rosidl+=\
  ${DEPEND_DIR.ros2-rosidl}/files/generator.awk
ROSIDL_GENERATOR_VERS.rosidl+=\
  $(addsuffix -$(call pkgversion,${PKGVERSION.ros2-rosidl}),		\
    rosidl_generator_c							\
    rosidl_generator_cpp						\
    rosidl_typesupport_introspection_c					\
    rosidl_typesupport_introspection_cpp				\
    rosidl_generator_type_description)

# PLIST handling depending on existing ROS generators.
# Those generators generate different files depending on their version.
#
# First is rosidl-adapter generating IDL files, then all others.
#
PLIST_FILTER+=\
  $(foreach _,rosidl-adapter rosidl,					\
    | ${AWK}								\
      -v generators='${ROSIDL_GENERATOR_VERS.$_}'			\
      $(addprefix -f ${CURDIR}/,					\
        ${ROSIDL_GENERATOR_SRCS.$_}					\
        ../../mk/internal/libdewey.awk					\
        ${DEPEND_DIR.ros2-rosidl}/files/plist-generator.awk)		\
      expand)
PRINT_PLIST_FILTER+=\
  $(foreach _,rosidl rosidl-adapter,					\
    | ${AWK}								\
      -v generators='${ROSIDL_GENERATOR_VERS.$_}'			\
      $(addprefix -f ${CURDIR}/,					\
        ${ROSIDL_GENERATOR_SRCS.$_}					\
        ../../mk/internal/libdewey.awk					\
        ${DEPEND_DIR.ros2-rosidl}/files/plist-generator.awk)		\
      collapse)

endif # ROS2_ROSIDL_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
