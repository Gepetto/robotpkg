# robotpkg depend.mk for:	audio/festival
# Created:			Anthony Mallet on Wed, 7 May 2008
#

# Authored by Anthony Mallet on Tue May  6 2008

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FESTIVAL_DEPEND_MK:=	${FESTIVAL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		festival
endif

ifeq (+,$(FESTIVAL_DEPEND_MK)) # -------------------------------------

PREFER.festival?=	system

DEPEND_USE+=		festival
DEPEND_ABI.festival?=	festival>=1.96
DEPEND_DIR.festival?=	../../audio/festival

SYSTEM_SEARCH.festival=\
	bin/festival			\
	include/festival/festival.h	\
	'lib/libFestival.{a,so}'

SYSTEM_SEARCH.festival+=\
	'share/festival/lib/ogi_configure_voice.scm:::ogireslpc'

SYSTEM_DESCR.festival=${DEPEND_ABI.festival}
SYSTEM_DESCR.festival+=\
  $(if $(findstring ogireslpc,${DEPEND_ABI.festival}),\
	with OGIreslpc synthetiser)

SYSTEM_PKG.Linux-fedora.festival=	festival festival-devel
SYSTEM_PKG.NetBSD.festival=		pkgsrc/audio/festival

endif # FESTIVAL_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
