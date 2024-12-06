# robotpkg depend.mk for:	hardware/libfranka
# Created:			Anthony Mallet on Fri,  6 Dec 2024
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBFRANKA_DEPEND_MK:=	${LIBFRANKA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			libfranka
endif

ifeq (+,$(LIBFRANKA_DEPEND_MK)) # ------------------------------------------

PREFER.libfranka?=	robotpkg

DEPEND_USE+=		libfranka

_franka_version=/set(PACKAGE_VERSION/{s/[^0-9.]//gp;q}
SYSTEM_SEARCH.libfranka=\
  'include/franka/robot.h'						\
  'lib/cmake/Franka/FrankaConfig.cmake'					\
  'lib/cmake/Franka/FrankaConfigVersion.cmake:${_franka_version}'	\
  'lib/libfranka.so'

DEPEND_ABI.libfranka?=	libfranka>=0.14
DEPEND_DIR.libfranka?=	../../hardware/libfranka

endif # LIBFRANKA_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
