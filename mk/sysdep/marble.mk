# robotpkg sysdep/marble.mk
# Created:			Anthony Mallet on Thu, 14 Aug 2014
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MARBLE_DEPEND_MK:=	${MARBLE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		marble
endif

ifeq (+,$(MARBLE_DEPEND_MK)) # ---------------------------------------------

PREFER.marble?=		system

DEPEND_USE+=		marble
DEPEND_ABI.marble?=	marble>=1

SYSTEM_SEARCH.marble=	\
  'bin/marble:/Marble/s/[^0-9.]//gp:% --version'	\
  'include/marble/Planet.h'				\
  'lib/libmarblewidget.so'				\
  'share/kde{4,}/apps/cmake/modules/FindMarble.cmake'

SYSTEM_PKG.Linux.marble=	marble libmarble-dev
SYSTEM_PKG.NetBSD.marble=	pkgsrc/misc/marble

export MARBLE=		$(word 1,${SYSTEM_FILES.marble})

endif # MARBLE_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
