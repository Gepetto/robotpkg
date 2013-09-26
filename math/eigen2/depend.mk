# robotpkg depend.mk for:	math/eigen2
# Created:			Matthieu Herrb on Wed, 19 May 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
EIGEN2_DEPEND_MK:=	${EIGEN2_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		eigen2
endif

ifeq (+,$(EIGEN2_DEPEND_MK)) # ---------------------------------------------

PREFER.eigen2?=		system

DEPEND_USE+=		eigen2

DEPEND_ABI.eigen2?=	eigen2>=2.0.12
DEPEND_DIR.eigen2?=	../../math/eigen2

SYSTEM_SEARCH.eigen2=	\
	include/eigen2/Eigen/Array \
	'include/eigen2/Eigen/src/Core/util/Macros.h:${_eigen2_version_sed}'

# extracting version from the .h file is challenging...
_eigen2_version_sed=	/^\#define EIGEN_[A-Z]*_VERSION[ \t]*/{s///;H;};
_eigen2_version_sed+=	$${x;s/\n/./g;s/^[.]//;p;}

SYSTEM_PKG.Fedora.eigen2=	eigen2-devel
SYSTEM_PKG.Debian.eigen2=	libeigen2-dev
SYSTEM_PKG.NetBSD.eigen2=	pkgsrc/math/eigen2
SYSTEM_PKG.Gentoo.eigen2=	'=dev-cpp/eigen-2*'

endif # EIGEN2_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
