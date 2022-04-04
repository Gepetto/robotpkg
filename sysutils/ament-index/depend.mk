# robotpkg depend.mk for:	devel/ament-index
# Created:			Anthony Mallet on Thu,  7 Apr 2022
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
AMENT_INDEX_DEPEND_MK:=		${AMENT_INDEX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ament-index
endif

ifeq (+,$(AMENT_INDEX_DEPEND_MK)) # ----------------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		ament-index

DEPEND_ABI.ament-index?=	ament-index>=0
DEPEND_DIR.ament-index?=	../../sysutils/ament-index

SYSTEM_SEARCH.ament-index=\
  $(call ros2_system_search, ament_index_cpp)				\
  '${PYTHON_SITELIB}/ament_index_python/__init__.py'			\
  'share/ament_index_python/package.xml:/<version>/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

endif # AMENT_INDEX_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
