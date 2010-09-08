# robotpkg depend.mk for:	devel/openvrml-libs
# Created:			Thomas Moulard on Wed, 8 Sep 2010
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
OPENVRML_LIBS_DEPEND_MK:=	${OPENVRML_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			openvrml-libs
endif

ifeq (+,$(OPENVRML_LIBS_DEPEND_MK)) # --------------------------------------

PREFER.openvrml-libs?=		robotpkg

DEPEND_USE+=			openvrml-libs
DEPEND_ABI.openvrml-libs?=	openvrml-libs>=0.18.6
DEPEND_DIR.openvrml-libs?=	../../graphics/openvrml-libs

SYSTEM_SEARCH.openvrml-libs=\
	include/openvrml/openvrml-common.h	\
	'lib/libopenvrml.{a,so,dylib}'		\
	'lib/pkgconfig/openvrml.pc:/Version/s/[^0-9.]//gp'

endif # OPENVRML_LIBS_DEPEND_-----------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
