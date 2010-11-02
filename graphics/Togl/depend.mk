# robotpkg depend.mk for:	graphics/pqp
# Created:			Matthieu Herrb on Tuesday, October 26, 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TOGL_DEPEND_MK:=		${TOGL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		Togl
endif

ifeq (+,$(TOGL_DEPEND_MK)) # ------------------------------------------------

PREFER.Togl?=		robotpkg

SYSTEM_SEARCH.Togl=\
	include/togl.h	\
	lib/libToglstub2.0.a

DEPEND_USE+=		Togl

DEPEND_ABI.Togl?=	Togl>=2.0
DEPEND_DIR.Togl?=	../../graphics/Togl

endif # TOGL_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
