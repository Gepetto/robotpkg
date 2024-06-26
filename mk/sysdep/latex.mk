# robotpkg sysdep/latex.mk
# Created:			Anthony Mallet on Thue Jan  8 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LATEX_DEPEND_MK:=	${LATEX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		latex
endif

ifeq (+,$(LATEX_DEPEND_MK)) # ----------------------------------------

PREFER.latex?=	system
DEPEND_USE+=		latex
DEPEND_METHOD.latex?=	build
DEPEND_ABI.latex?=	latex>=3.14

SYSTEM_SEARCH.latex=	\
  '{bin/,}latex:/pdf/{s/^[^0-9]*//;s/[^.0-9].*$$//;p;}:% -version'

endif # LATEX_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
