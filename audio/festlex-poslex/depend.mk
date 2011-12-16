# robotpkg depend.mk for:	audio/festlex-poslex
# Created:			Anthony Mallet on Wed, 7 May 2008
#

# Authored by Anthony Mallet on Tue May  6 2008

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FESTLEX_POSLEX_DEPEND_MK:=${FESTLEX_POSLEX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		festlex-poslex
endif

ifeq (+,$(FESTLEX_POSLEX_DEPEND_MK)) # -------------------------------

include ../../audio/festival/depend.mk
PREFER.festlex-poslex?=	${PREFER.festival}

include ../../mk/robotpkg.prefs.mk
ifneq (${PREFER.festival},${PREFER.festlex-poslex})
  PKG_FAIL_REASON+=\
	"PREFER.festival and PREFER.festlex-poslex must be set to the same value."
endif

SYSTEM_PKG.NetBSD.festlex-poslex=	pkgsrc/audio/festlex-poslex
SYSTEM_SEARCH.festlex-poslex=\
	share/festival/{lib/,}dicts/wsj.wp39.poslexR

DEPEND_USE+=		festlex-poslex

DEPEND_ABI.festlex-poslex?=	festlex-poslex>=1.96
DEPEND_DIR.festlex-poslex?=	../../audio/festlex-poslex

endif # FESTLEX_POSLEX_DEPEND_MK -------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
