# robotpkg depend.mk for:	middleware/sros2
# Created:			Anthony Mallet on Thu, 14 Apr 2022
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SROS2_DEPEND_MK:=	${SROS2_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sros2
endif

ifeq (+,$(SROS2_DEPEND_MK)) # ----------------------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=	sros2

DEPEND_ABI.sros2?=	sros2>=0
DEPEND_DIR.sros2?=	../../middleware/sros2

SYSTEM_SEARCH.sros2=\
  $(call ros2_system_search, sros2_cmake)		\
  '${PYTHON_SYSLIBSEARCH}/sros2/__init__.py'		\
  'share/sros2/package.xml:/<version>/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk

endif # SROS2_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
