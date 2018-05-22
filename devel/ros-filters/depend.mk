# robotpkg depend.mk for:	devel/ros-filters
# Created:			Séverin Lemaignan on Tue, 06 Aug 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_FILTERS_DEPEND_MK:=	${ROS_FILTERS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-filters
endif

ifeq (+,$(ROS_FILTERS_DEPEND_MK)) # --------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-filters?=		${PREFER.ros-base}
SYSTEM_PREFIX.ros-filters?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-filters
ROS_DEPEND_USE+=		ros-filters

DEPEND_ABI.ros-filters?=	ros-filters>=1.6
DEPEND_DIR.ros-filters=		../../devel/ros-filters

DEPEND_ABI.ros-filters.groovy+=	ros-filters>=1.6<=1.7.2
DEPEND_ABI.ros-filters.hydro+=	ros-filters>=1.7.3<1.8
DEPEND_ABI.ros-filters.indigo+=	ros-filters>=1.7.3<1.8
DEPEND_ABI.ros-filters.jade+=	ros-filters>=1.7.3<1.8
DEPEND_ABI.ros-filters.kinetic+=ros-filters>=1.7.3<1.8
DEPEND_ABI.ros-filters.lunar+=	ros-filters>=1.8<1.9
DEPEND_ABI.ros-filters.melodic+=ros-filters>=1.8<1.9

SYSTEM_SEARCH.ros-filters=\
	include/filters/filter_base.h				\
	lib/libmean.so						\
	'share/filters/package.xml:/<version>/s/[^0-9.]//gp'	\
	'lib/pkgconfig/filters.pc:/Version/s/[^0-9.]//gp'

endif # ROS_FILTERS_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
