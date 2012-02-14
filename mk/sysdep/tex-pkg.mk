# robotpkg sysdep/tex-pkg.mk
# Created:			Anthony Mallet on Mon,  3 Oct 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TEXPKG_DEPEND_MK:=	${TEXPKG_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		$(addprefix tex-,$(basename ${USE_TEX_PKGS}))
endif

ifeq (+,$(TEXPKG_DEPEND_MK)) # ---------------------------------------------

DEPEND_USE+=		$(addprefix tex-,$(basename ${USE_TEX_PKGS}))
PREFER.tex-pkg?=	system

override define _tex-pkg
  PREFER.tex-$(basename $1)?=		$${PREFER.tex-pkg}
  DEPEND_ABI.tex-$(basename $1)?=	tex-$(basename $1)
  DEPEND_METHOD.tex-$(basename $1)?=	build

  SYSTEM_SEARCH.tex-$(basename $1)=\
	'{bin/,}kpsewhich:/$1/d;s/^$$$$/missing $1/p:% $1'

  SYSTEM_DESCR.tex-$(basename $1)?=	TeX package $1
  SYSTEM_PKG.Fedora.tex-$(basename $1)?=texlive-latex
  SYSTEM_PKG.Ubuntu.tex-$(basename $1)?=texlive-latex-extra
  SYSTEM_PKG.Debian.tex-$(basename $1)?=texlive-latex-extra
  SYSTEM_PKG.MacOSX.tex-$(basename $1)?=texlive
endef

ifeq (,${USE_TEX_PKGS})
  PKG_FAIL_REASON+="Dependency on tex-pkg.mk requires USE_TEX_PKGS"
endif

endif # TEXPKG_DEPEND_MK ---------------------------------------------------

$(foreach _,${USE_TEX_PKGS},$(eval $(call _tex-pkg,$_)))

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
