# robotpkg depend.mk for:	pkgtools/pkg_install
# Created:			Anthony Mallet on Sat, 19 Apr 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PKG_INSTALL_DEPEND_MK:= ${PKG_INSTALL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		pkg_install
endif

ifeq (+,$(PKG_INSTALL_DEPEND_MK))
# it is mandatory to use the robotpkg version of these tools
PREFER.pkg_install=		robotpkg

DEPEND_USE+=			pkg_install

DEPEND_METHOD.pkg_install?=	bootstrap
DEPEND_ABI.pkg_install?=	pkg_install>=20091115
DEPEND_DIR.pkg_install?=	../../pkgtools/pkg_install

SYSTEM_SEARCH.pkg_install=\
	'{s,}bin/robotpkg_add'		\
	'{s,}bin/robotpkg_admin'	\
	'{s,}bin/robotpkg_create'	\
	'{s,}bin/robotpkg_delete'	\
	'{s,}bin/robotpkg_info:p:% -V'

endif # PKG_INSTALL_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
