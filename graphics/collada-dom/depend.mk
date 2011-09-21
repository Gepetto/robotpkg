# robotpkg depend.mk for:	graphics/collada-dom
# Created:			Francois Lancelot on Wed, 21 Sep 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
COLLADADOM_DEPEND_MK:=	${COLLADADOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		collada-dom
endif

ifeq (+,$(COLLADADOM_DEPEND_MK)) # -----------------------------------------

PREFER.collada-dom?=	robotpkg

SYSTEM_SEARCH.collada-dom=\
	include/collada-dom/dae.h					\
	lib/libcollada15dom.so						\
	'lib/pkgconfig/collada15dom.pc:/Version/s/[^0-9.]//gp'

DEPEND_USE+=		collada-dom

DEPEND_ABI.collada-dom?=collada-dom >=2.3.1
DEPEND_DIR.collada-dom?=../../graphics/collada-dom

endif # COLLADADOM_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
