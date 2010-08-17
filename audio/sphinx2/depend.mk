# robotpkg depend.mk for:	audio/sphinx2
# Created:			Anthony Mallet on Sat, 7 Mar 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SPHINX2_DEPEND_MK:=	${SPHINX2_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sphinx2
endif

ifeq (+,$(SPHINX2_DEPEND_MK)) # --------------------------------------------

PREFER.sphinx2?=	robotpkg

DEPEND_USE+=		sphinx2

DEPEND_ABI.sphinx2?=	sphinx2>=0.6
DEPEND_DIR.sphinx2?=	../../audio/sphinx2

SYSTEM_SEARCH.sphinx2=\
	include/sphinx2/sphinxp.h	\
	lib/libsphinx2.{a,so}

endif # SPHINX2_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
