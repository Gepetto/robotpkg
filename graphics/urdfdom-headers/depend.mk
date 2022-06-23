# robotpkg depend.mk for:	graphics/urdfdom-headers
# Created:			Anthony Mallet on Thu,  4 Jul 2013
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
URDFDOM_HEADERS_DEPEND_MK:=	${URDFDOM_HEADERS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			urdfdom-headers
endif

ifeq (+,$(URDFDOM_HEADERS_DEPEND_MK)) # ------------------------------------

include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (NetBSD,${OPSYS})
  PREFER.urdfdom-headers?=	robotpkg
endif
PREFER.urdfdom-headers?=	system

DEPEND_USE+=			urdfdom-headers

DEPEND_ABI.urdfdom-headers?=	urdfdom-headers>=0.2.2
DEPEND_DIR.urdfdom-headers?=	../../graphics/urdfdom-headers

SYSTEM_SEARCH.urdfdom-headers=\
  'include/{,urdf{dom_headers,}/}urdf_model/model.h'			\
  '{lib,share}/pkgconfig/urdfdom_headers.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.urdfdom-headers=liburdfdom-headers-dev
SYSTEM_PKG.Fedora.urdfdom-headers=urdfdom-headers-devel

endif # URDFDOM_HEADERS_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
