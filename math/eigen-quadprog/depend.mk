# robotpkg depend.mk for:	math/eigen-quadprog
# Created:			Rohan Budhiraja on Tue, 14 Apr 2020
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
EIGEN_QUADPROG_DEPEND_MK:=	${EIGEN_QUADPROG_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			eigen-quadprog
endif

ifeq (+,$(EIGEN_QUADPROG_DEPEND_MK)) # -------------------------------------

PREFER.eigen-quadprog?=		robotpkg

DEPEND_USE+=			eigen-quadprog

DEPEND_ABI.eigen-quadprog?=	eigen-quadprog>=1.0.0
DEPEND_DIR.eigen-quadprog?=	../../math/eigen-quadprog

SYSTEM_SEARCH.eigen-quadprog=\
  'lib/libeigen-quadprog.so'

endif # EIGEN_QUADPROG_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
