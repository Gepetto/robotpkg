# robotpkg depend.mk for:	image/ros-vision-opencv
# Created:			Anthony Mallet on Wed, 26 Jun 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_VISION_OPENCV_DEPEND_MK:=	${ROS_VISION_OPENCV_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-vision-opencv
endif

ifeq (+,$(ROS_VISION_OPENCV_DEPEND_MK)) # ----------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-vision-opencv?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-vision-opencv?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-vision-opencv
ROS_DEPEND_USE+=		ros-vision-opencv

DEPEND_ABI.ros-vision-opencv?=	ros-vision-opencv>=1.15<1.16
DEPEND_DIR.ros-vision-opencv?=	../../image/ros-vision-opencv

DEPEND_ABI.ros-vision-opencv.groovy?=	ros-vision-opencv>=1.10<1.11
DEPEND_ABI.ros-vision-opencv.hydro?=	ros-vision-opencv>=1.10<1.11
DEPEND_ABI.ros-vision-opencv.indigo?=	ros-vision-opencv>=1.11<1.12
DEPEND_ABI.ros-vision-opencv.jade?=	ros-vision-opencv>=1.11<1.12
DEPEND_ABI.ros-vision-opencv.kinetic?=	ros-vision-opencv>=1.12<1.13
DEPEND_ABI.ros-vision-opencv.lunar?=	ros-vision-opencv>=1.12<1.13
DEPEND_ABI.ros-vision-opencv.melodic?=	ros-vision-opencv>=1.13<1.14

SYSTEM_SEARCH.ros-vision-opencv=\
  'include/cv_bridge/cv_bridge.h'				\
  'include/image_geometry/pinhole_camera_model.h'		\
  'lib/libcv_bridge.so'						\
  'lib/libimage_geometry.so'					\
  'share/cv_bridge/package.xml:/<version>/s/[^0-9.]//gp'	\
  'share/image_geometry/package.xml:/<version>/s/[^0-9.]//gp'	\
  '${PYTHON_SYSLIBSEARCH}/cv_bridge/__init__.py'		\
  '${PYTHON_SYSLIBSEARCH}/image_geometry/__init__.py'		\
  'lib/pkgconfig/cv_bridge.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/image_geometry.pc:/Version/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

endif # ROS_VISION_OPENCV_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
