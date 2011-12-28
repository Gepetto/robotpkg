# robotpkg depend.mk for:	audio/festlex-cmu
# Created:			Anthony Mallet on Wed, 7 May 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FESTLEX_CMU_DEPEND_MK:=	${FESTLEX_CMU_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		festlex-cmu
endif

ifeq (+,$(FESTLEX_CMU_DEPEND_MK)) # ----------------------------------

include ../../audio/festival/depend.mk
PREFER.festlex-cmu?=	${PREFER.festival}

include ../../mk/robotpkg.prefs.mk
ifneq (${PREFER.festival},${PREFER.festlex-cmu})
  PKG_FAIL_REASON+=\
	"PREFER.festival and PREFER.festlex-cmu must be set to the same value."
endif

SYSTEM_SEARCH.festlex-cmu=\
	'share/festival/{lib/,}dicts/cmu/cmulex.scm'

DEPEND_USE+=		festlex-cmu

DEPEND_ABI.festlex-cmu?=	festlex-cmu>=1.96
DEPEND_DIR.festlex-cmu?=	../../audio/festlex-cmu

endif # FESTLEX_CMU_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
