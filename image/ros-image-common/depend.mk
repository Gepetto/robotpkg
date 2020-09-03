# robotpkg depend.mk for:	image/ros-image-common
# Created:			Anthony Mallet on Fri, 28 Jun 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_IMAGE_COMMON_DEPEND_MK:=	${ROS_IMAGE_COMMON_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-image-common
endif

ifeq (+,$(ROS_IMAGE_COMMON_DEPEND_MK)) # -----------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-image-common?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-image-common?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-image-common
ROS_DEPEND_USE+=		ros-image-common

DEPEND_ABI.ros-image-common?=	ros-image-common>=1.12<1.13
DEPEND_DIR.ros-image-common?=	../../image/ros-image-common

DEPEND_ABI.ros-image-common.groovy?=	ros-image-common>=1.10<1.11
DEPEND_ABI.ros-image-common.hydro?=	ros-image-common>=1.11<1.12
DEPEND_ABI.ros-image-common.indigo?=	ros-image-common>=1.11<1.12
DEPEND_ABI.ros-image-common.jade?=	ros-image-common>=1.11<1.12
DEPEND_ABI.ros-image-common.kinetic?=	ros-image-common>=1.11<1.12
DEPEND_ABI.ros-image-common.lunar?=	ros-image-common>=1.11<1.12
DEPEND_ABI.ros-image-common.melodic?=	ros-image-common>=1.11<1.12

SYSTEM_SEARCH.ros-image-common=\
  'include/camera_calibration_parsers/parse.h'				\
  'include/camera_info_manager/camera_info_manager.h'			\
  'include/image_transport/image_transport.h'				\
  'include/polled_camera/GetPolledImage.h'				\
  'lib/libcamera_calibration_parsers.so'				\
  'lib/libcamera_info_manager.so'					\
  'lib/libimage_transport.so'						\
  'lib/libimage_transport_plugins.so'					\
  'lib/libpolled_camera.so'						\
  '${PYTHON_SYSLIBSEARCH}/polled_camera/__init__.py'			\
  'lib/pkgconfig/camera_calibration_parsers.pc:/Version/s/[^0-9.]//gp'	\
  'lib/pkgconfig/camera_info_manager.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/image_transport.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/polled_camera.pc:/Version/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

endif # ROS_IMAGE_COMMON_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
