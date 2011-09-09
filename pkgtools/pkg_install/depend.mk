# robotpkg depend.mk for:	pkgtools/pkg_install
# Created:			Anthony Mallet on Sat, 19 Apr 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PKG_INSTALL_DEPEND_MK:= ${PKG_INSTALL_DEPEND_MK}+

# Do not add a dependency if NO_PKGTOOLS_REQD_CHECK is required
# (currently only pkg_install itself does this).
#
ifeq (+,$(DEPEND_DEPTH))
  ifndef NO_PKGTOOLS_REQD_CHECK
    DEPEND_PKG+=		pkg_install
  endif
endif

ifeq (+,$(PKG_INSTALL_DEPEND_MK)) # ----------------------------------------

# if pkg_install is outside LOCALBASE, make it a 'system' package.
PREFIX.pkg_install?=	${ROBOTPKG_BASE}
PREFER.pkg_install?=\
  $(if $(filter $(realpath ${LOCALBASE}),                      \
       $(realpath ${PREFIX.pkg_install})),robotpkg,system)

ifndef NO_PKGTOOLS_REQD_CHECK
  DEPEND_USE+=			pkg_install

  DEPEND_METHOD.pkg_install?=	bootstrap
  DEPEND_ABI.pkg_install?=	pkg_install>=20110805.2
  DEPEND_DIR.pkg_install?=	../../pkgtools/pkg_install

  SYSTEM_SEARCH.pkg_install=\
	'{s,}bin/robotpkg_add'		\
	'{s,}bin/robotpkg_admin'	\
	'{s,}bin/robotpkg_create'	\
	'{s,}bin/robotpkg_delete'	\
	'{s,}bin/robotpkg_info:p:% -V'
endif

endif # PKG_INSTALL_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
