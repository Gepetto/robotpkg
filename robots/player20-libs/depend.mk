# robotpkg depend.mk for:	robots/player20-libs
# Created:			Matthieu Herrb on Fri, 20 Nov 2009
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PLAYER20_LIBS_DEPEND_MK:=	${PLAYER20_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=	player20-libs
endif

ifeq (+,$(PLAYER20_LIBS_DEPEND_MK))

PREFER.player20-libs?=		robotpkg

DEPEND_USE+=			player20-libs

DEPEND_ABI.player20-libs?=	player20-libs>=2.0
DEPEND_DIR.player20-libs?=	../../robots/player20-libs

SYSTEM_SEARCH.player20-libs=	include/player-2.0/libplayerc/*.h

endif

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
