# robotpkg sysdep/tdom.mk
# Created:			Anthony Mallet on Fri Dec 12 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
DOXYGEN_DEPEND_MK:=	${DOXYGEN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		doxygen
endif

ifeq (+,$(DOXYGEN_DEPEND_MK)) # --------------------------------------------

PREFER.doxygen?=	system

DEPEND_USE+=		doxygen
DEPEND_ABI.doxygen?=	doxygen>=1.5
DEPEND_METHOD.doxygen+=	build
SYSTEM_SEARCH.doxygen=	'bin/doxygen:p:% --version'

SYSTEM_PKG.NetBSD.doxygen=	devel/doxygen
SYSTEM_PKG.Gentoo.doxygen=	app-doc/doxygen

# Legacy automatic PLIST generation for doxygen generated files.
# Now, this should be replaced by DYNAMIC_PLIST_DIRS
ifdef DOXYGEN_PLIST_DIR
  $(shell echo >&2 'Warning: DOXYGEN_PLIST_DIR in ${PKGPATH} is deprecated.')
  $(shell echo >&2 'Warning: use DYNAMIC_PLIST_DIRS instead.')
  DYNAMIC_PLIST_DIRS+=	${DOXYGEN_PLIST_DIR}
endif

export DOXYGEN=		${PREFIX.doxygen}/bin/doxygen

# if latex or pdflatex are to be used, make sure they are in the PATH: doxygen
# relies on this
PATH.doxygen+=		$(patsubst %,%/bin, ${PREFIX.latex} ${PREFIX.pdflatex})

endif # DOXYGEN_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
