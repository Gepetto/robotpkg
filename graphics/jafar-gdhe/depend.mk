# robotpkg depend.mk for:	graphics/jafar-gdhe
# Created:			Cyril Roussillon on Wed, 15 Jun 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JAFAR_GDHE_DEPEND_MK:=	${JAFAR_GDHE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		jafar-gdhe
endif

ifeq (+,$(JAFAR_GDHE_DEPEND_MK)) # -----------------------------------------

PREFER.jafar-gdhe?=	robotpkg

DEPEND_USE+=		jafar-gdhe
DEPEND_ABI.jafar-gdhe?=	jafar-gdhe>=0.1
DEPEND_DIR.jafar-gdhe?=	../../graphics/jafar-gdhe

SYSTEM_SEARCH.jafar-gdhe=\
	include/jafar/gdhe/gdheException.hpp			\
	'lib/pkgconfig/jafar-gdhe.pc:/Version/s/[^0-9.]//gp'	\
	lib/libjafar-gdhe.so

endif # JAFAR_GDHE_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
