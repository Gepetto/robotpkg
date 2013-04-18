# robotpkg depend.mk for:	motion/sot-pattern-generator
# Created:			Olivier Stasse on Thu, 18 Apr 2013
#

DEPEND_DEPTH:=				${DEPEND_DEPTH}+
SOT_PATTERN_GENERATOR_DEPEND_MK:=	${SOT_PATTERN_GENERATOR_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			sot-pattern-generator
endif

ifeq (+,$(SOT_PATTERN_GENERATOR_DEPEND_MK)) # ------------------------------

DEPEND_USE+=			sot-pattern-generator
PREFER.sot-pattern-generator?=	robotpkg

DEPEND_ABI.sot-pattern-generator?=	sot-pattern-generator>=2.7
DEPEND_DIR.sot-pattern-generator?=	../../motion/sot-pattern-generator
SYSTEM_SEARCH.sot-pattern-generator=\
	include/sot-pattern-generator/pg.h				\
	lib/plugin/pg.so						\
	'lib/pkgconfig/sot-pattern-generator.pc:/Version/s/[^0-9.]//pg'	\
	${PYTHON_SYSLIBSEARCH}/dynamic_graph/sot/pattern_generator/__init__.py

include ../../mk/sysdep/python.mk

endif # SOT_PATTERN_GENERATOR_DEPEND_MK ------------------------------------

DEPEND_DEPTH:=				${DEPEND_DEPTH:+=}
