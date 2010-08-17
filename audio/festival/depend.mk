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

SYSTEM_PKG.Linux-fedora.festival=	festival festival-devel
SYSTEM_PKG.NetBSD.festival=		pkgsrc/audio/festival

ifneq (,$(findstring ogireslpc,${REQD_BUILD_OPTIONS.festival}))
  # ogireslpc isn't packaged on most systems
  include ../../mk/robotpkg.prefs.mk
  ifneq (robotpkg,${PREFER.festival})
    PKG_FAIL_REASON+=\
	"You must set PREFER.festival=robotpkg for the ogireslpc option."
  endif

  SYSTEM_DESCR.festival='${DEPEND_ABI.festival} with OGIreslpc synthetiser'
  SYSTEM_SEARCH.festival+=share/festival/lib/ogi_configure_voice.scm
endif

endif # FESTIVAL_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
