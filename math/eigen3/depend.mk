# robotpkg depend.mk for:	math/eigen3
# Created:			Nizar Sallem on Thu, 5 May 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
EIGEN3_DEPEND_MK:=	${EIGEN3_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		eigen3
endif

ifeq (+,$(EIGEN3_DEPEND_MK)) # ---------------------------------------------

PREFER.eigen3?=		system

DEPEND_USE+=		eigen3

DEPEND_METHOD.eigen3?=	build
DEPEND_ABI.eigen3?=	eigen3>=3.0.0
DEPEND_DIR.eigen3?=	../../math/eigen3

SYSTEM_SEARCH.eigen3=	\
  'include/eigen3/signature_of_eigen3_matrix_library'		\
  '{lib,share}/pkgconfig/eigen3.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.eigen3=	libeigen3-dev
SYSTEM_PKG.RedHat.eigen3=	eigen3-devel
SYSTEM_PKG.Gentoo.eigen3=	dev-cpp/eigen
SYSTEM_PKG.NetBSD.eigen3=	math/eigen3

endif # EIGEN3_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
