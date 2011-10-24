# robotpkg depend.mk for:	knowledge/pellet
# Created:			Séverin Lemaignan on Tue, 7 Jul 2009
#


DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PELLET_DEPEND_MK:=	${PELLET_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		pellet
endif

ifeq (+,$(PELLET_DEPEND_MK)) # -----------------------------------------------

PREFER.pellet?=		robotpkg

DEPEND_USE+=		pellet
DEPEND_ABI.pellet?=	pellet>=2.3.0
DEPEND_DIR.pellet?=	../../knowledge/pellet

SYSTEM_SEARCH.pellet=\
	java/pellet/lib/pellet-core.jar

endif # PELLET_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
