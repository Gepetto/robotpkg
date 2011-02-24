# robotpkg depend.mk for:	manipulation/coldman-libs
# Created:			Anthony Mallet on Fri, 15 Oct 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
COLDMAN-LIBS_DEPEND_MK:=	${COLDMAN-LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		coldman-libs
endif

ifeq (+,$(COLDMAN-LIBS_DEPEND_MK)) # ----------------------------------

PREFER.coldman-libs?=	robotpkg

SYSTEM_SEARCH.coldman-libs=\
	include/coldman-libs/coldman.h	\
	lib/libcoldman-libs.so

DEPEND_USE+=		coldman-libs

DEPEND_ABI.coldman-libs?=coldman-libs>=1.4
DEPEND_DIR.coldman-libs?=../../graphics/coldman-libs

endif # COLDMAN-LIBS_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
