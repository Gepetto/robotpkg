# robotpkg depend.mk for:	math/jafar-jmath
# Created:			Redouane Boumghar on Wed, 15 Jun 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JAFAR_JMATH_DEPEND_MK:=	${JAFAR_JMATH_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		jafar-jmath
endif

ifeq (+,$(JAFAR_JMATH_DEPEND_MK)) # ----------------------------------------

include ../../meta-pkgs/jafar/depend.common
PREFER.jafar-jmath?=	${PREFER.jafar}

DEPEND_USE+=		jafar-jmath
DEPEND_ABI.jafar-jmath?=jafar-jmath>=0.4
DEPEND_DIR.jafar-jmath?=../../math/jafar-jmath

SYSTEM_SEARCH.jafar-jmath=\
	include/jafar/jmath/jmathException.hpp	\
	lib/libjafar-jmath.so			\
	'lib/pkgconfig/jafar-jmath.pc:/Version/s/[^0-9.]//gp'

endif # JAFAR_JMATH_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
