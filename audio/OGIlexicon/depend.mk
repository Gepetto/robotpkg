# robotpkg depend.mk for:	audio/OGIlexicon
# Created:			Anthony Mallet on Sun, 18 May 2008
#

# Authored by Anthony Mallet on Tue May  6 2008

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OGILEXICON_DEPEND_MK:=	${OGILEXICON_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		OGIlexicon
endif

ifeq (+,$(OGILEXICON_DEPEND_MK)) # -----------------------------------

include ../../audio/festival/depend.mk
PREFER.OGIlexicon?=	${PREFER.festival}

include ../../mk/robotpkg.prefs.mk
ifneq (${PREFER.festival},${PREFER.OGIlexicon})
  PKG_FAIL_REASON+=\
	"PREFER.festival and PREFER.OGIlexicon must be set to the same value."
endif

SYSTEM_SEARCH.OGIlexicon=\
	share/festival/lib/dicts/ogilex_lts_rules.scm

DEPEND_USE+=		OGIlexicon

DEPEND_ABI.OGIlexicon?=	OGIlexicon>=2.2
DEPEND_DIR.OGIlexicon?=	../../audio/OGIlexicon

endif # OGILEXICON_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
