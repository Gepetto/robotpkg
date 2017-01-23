# robotpkg sysdep/pdflatex.mk
# Created:			Anthony Mallet on Sun,  2 Nov 2008
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PDFLATEX_DEPEND_MK:=	${PDFLATEX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		pdflatex
endif

ifeq (+,$(PDFLATEX_DEPEND_MK)) # -------------------------------------

PREFER.pdflatex?=	system
DEPEND_USE+=		pdflatex
DEPEND_ABI.pdflatex?=	pdflatex
DEPEND_METHOD.pdflatex?=build

SYSTEM_SEARCH.pdflatex=	\
	'{bin/,}pdflatex'

SYSTEM_PKG.Fedora.pdflatex=texlive-latex
SYSTEM_PKG.Ubuntu.pdflatex=texlive-latex-extra
SYSTEM_PKG.Debian.pdflatex=texlive-latex-extra
SYSTEM_PKG.MacOSX.pdflatex=texlive

export PDFLATEX=	$(word 1,${SYSTEM_FILES.pdflatex})

endif # PDFLATEX_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
