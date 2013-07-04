# robotpkg depend.mk for:	graphics/urdfdom-headers
# Created:			Anthony Mallet on Thu,  4 Jul 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
URDFDOM_HEADERS_DEPEND_MK:=	${URDFDOM_HEADERS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			urdfdom-headers
endif

ifeq (+,$(URDFDOM_HEADERS_DEPEND_MK)) # ------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.urdfdom-headers?=	${PREFER.ros-base}
SYSTEM_PREFIX.urdfdom-headers?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			urdfdom-headers

DEPEND_ABI.urdfdom-headers?=	urdfdom-headers>=0.2.3
DEPEND_DIR.urdfdom-headers?=	../../graphics/urdfdom-headers

SYSTEM_SEARCH.urdfdom-headers=\
  'include/urdf_model/model.h'					\
  'lib/pkgconfig/urdfdom_headers.pc:/Version/s/[^0-9.]//gp'

endif # URDFDOM_HEADERS_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
