# robotpkg depend.mk for:	graphics/blender
# Created:			Séverin Lemaignan on Mon, 7 Dec 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
BLENDER_DEPEND_MK:=	${BLENDER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		blender
endif

ifeq (+,$(BLENDER_DEPEND_MK)) # -----------------------------------------------

PREFER.blender?=	system

DEPEND_USE+=		blender
DEPEND_ABI.blender?=	blender>=2.5
DEPEND_DIR.blender?=	../../graphics/blender

SYSTEM_SEARCH.blender=\
	'bin/blender:1{s/sub.*)//;s/[^0-9.]//gp;}:% -v'

endif # BLENDER_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
