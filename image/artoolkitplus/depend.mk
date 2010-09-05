# robotpkg depend.mk for:	image/artoolkitplus
# Created:			Séverin Lemaignan on Tue, 31 Aug 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ARTOOLKITPLUS_DEPEND_MK:=	${ARTOOLKITPLUS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		artoolkitplus
endif

ifeq (+,$(ARTOOLKITPLUS_DEPEND_MK)) # ----------------------------------

PREFER.artoolkitplus?=	robotpkg

SYSTEM_SEARCH.artoolkitplus=\
	include/ARToolKitPlus/ar.h	\
	lib/libARToolKitPlus.so

DEPEND_USE+=		artoolkitplus

DEPEND_ABI.artoolkitplus?=artoolkitplus>=2.1.1
DEPEND_DIR.artoolkitplus?=../../image/artoolkitplus


endif # ARTOOLKITPLUS_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
