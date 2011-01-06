# robotpkg depend.mk for:	math/eigen2
# Created:			Matthieu Herrb on Wed, 19 May 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
EIGEN2_DEPEND_MK:=	${EIGEN2_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		eigen2
endif

ifeq (+,$(EIGEN2_DEPEND_MK))
PREFER.eigen2?=		system

DEPEND_USE+=		eigen2

DEPEND_ABI.eigen2?=	eigen2>=2.0.12
DEPEND_DIR.eigen2?=	../../math/eigen2

SYSTEM_SEARCH.eigen2=	\
	include/eigen2/Eigen/Array
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
