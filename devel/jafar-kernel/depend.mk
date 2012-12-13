# robotpkg depend.mk for:	devel/jafar-kernel
# Created:			Redouane Boumghar on Thu, 17 Mar 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JAFAR_KERNEL_DEPEND_MK:=${JAFAR_KERNEL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		jafar-kernel
endif

ifeq (+,$(JAFAR_KERNEL_DEPEND_MK)) # ---------------------------------------

include ../../meta-pkgs/jafar/depend.common
PREFER.jafar-kernel?=	${PREFER.jafar}

DEPEND_USE+=		jafar-kernel
DEPEND_ABI.jafar-kernel?=jafar-kernel>=0.5
DEPEND_DIR.jafar-kernel?=../../devel/jafar-kernel

SYSTEM_SEARCH.jafar-kernel=\
	include/jafar/kernel/kernelException.hpp	\
	lib/libjafar-kernel.so				\
	'lib/pkgconfig/jafar-kernel.pc:/Version/s/[^0-9.]//gp'

endif # JAFAR_KERNEL_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
