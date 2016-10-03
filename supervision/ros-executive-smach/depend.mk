# robotpkg depend.mk for:	supervision/ros-executive-smach
# Created:			Séverin Lemaignan on Tue, 06 Aug 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_EXECUTIVE_SMACH_DEPEND_MK:=	${ROS_EXECUTIVE_SMACH_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-executive-smach
endif

ifeq (+,$(ROS_EXECUTIVE_SMACH_DEPEND_MK)) # --------------------------------

include ../../meta-pkgs/ros-base/depend.common
include ../../mk/sysdep/python.mk

PREFER.ros-executive-smach?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-executive-smach?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=				ros-executive-smach
ROS_DEPEND_USE+=			ros-executive-smach

DEPEND_ABI.ros-executive-smach?=	ros-executive-smach>=1.2
DEPEND_DIR.ros-executive-smach=		../../supervision/ros-executive-smach

DEPEND_ABI.ros-executive-smach.groovy+=	ros-executive-smach>=1.2.2<=1.3.0
DEPEND_ABI.ros-executive-smach.hydro+=	ros-executive-smach>=1.3.1<1.4
DEPEND_ABI.ros-executive-smach.indigo+=	ros-executive-smach>=2.0<2.1
DEPEND_ABI.ros-executive-smach.jade+=	ros-executive-smach>=2.0<2.1
DEPEND_ABI.ros-executive-smach.kinetic+=ros-executive-smach>=2.0<2.1

SYSTEM_SEARCH.ros-executive-smach=\
	'${PYTHON_SITELIB}/smach/__init__.py'				\
	'share/executive_smach/package.xml:/<version>/s/[^0-9.]//gp'	\
	'share/smach_msgs/package.xml:/<version>/s/[^0-9.]//gp'		\
	'lib/pkgconfig/smach_msgs.pc:/Version/s/[^0-9.]//gp'

endif # ROS_EXECUTIVE_SMACH_DEPEND_MK --------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
