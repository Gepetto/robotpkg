# robotpkg depend.mk for:	audio/festlex-cmu
# Created:			Anthony Mallet on Wed, 7 May 2008
#

# Authored by Anthony Mallet on Tue May  6 2008

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FESTLEX_CMU_DEPEND_MK:=	${FESTLEX_CMU_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		festlex-cmu
endif

ifeq (+,$(FESTLEX_CMU_DEPEND_MK)) # ----------------------------------

PREFER.festlex-cmu?=	system

SYSTEM_SEARCH.festlex-cmu=\
	share/festival/lib/dicts/cmu/cmulex.scm

DEPEND_USE+=		festlex-cmu

DEPEND_ABI.festlex-cmu?=	festlex-cmu>=1.96
DEPEND_DIR.festlex-cmu?=	../../audio/festlex-cmu

endif # FESTLEX_CMU_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
