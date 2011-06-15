# robotpkg depend.mk for:	image/jafar-correl
# Created:			Cyril Roussillon on Wed, 15 Jun 2011
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
JAFAR_CORREL_DEPEND_MK:=	${JAFAR_CORREL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			jafar-correl
endif

ifeq (+,$(JAFAR_CORREL_DEPEND_MK)) # ---------------------------------------

PREFER.jafar-correl?=		robotpkg

DEPEND_USE+=			jafar-correl
DEPEND_ABI.jafar-correl?=	jafar-correl>=0.1
DEPEND_DIR.jafar-correl?=	../../image/jafar-correl

SYSTEM_SEARCH.jafar-correl=\
	include/jafar/correl/correlException.hpp	\
	lib/libjafar-correl.so				\
	'lib/pkgconfig/jafar-correl.pc:/Version/s/[^0-9.]//gp'

endif # JAFAR_CORREL_DEPEND_MK ---------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
