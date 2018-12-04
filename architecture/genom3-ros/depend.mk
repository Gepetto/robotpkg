# robotpkg depend.mk for:	architecture/genom3-ros
# Created:			Anthony Mallet on Mon,  9 Nov 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GENOM3_ROS_DEPEND_MK:=	${GENOM3_ROS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		genom3-ros
endif

ifeq (+,$(GENOM3_ROS_DEPEND_MK)) # -----------------------------------------

DEPEND_USE+=		genom3-ros
PREFER.genom3-ros?=robotpkg

SYSTEM_SEARCH.genom3-ros=\
	lib/libros-client.so				\
	'lib/pkgconfig/genom3-ros.pc:/Version/s/[^0-9.]//gp'

DEPEND_ABI.genom3-ros?=	genom3-ros>=1.22
DEPEND_DIR.genom3-ros?=	../../architecture/genom3-ros

endif # GENOM3_ROS_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
