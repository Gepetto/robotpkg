# robotpkg depend.mk for:	pkgtools/pkg_install
# Created:			Anthony Mallet on Sat, 19 Apr 2008
#

# Authored by Anthony Mallet on Sat Apr 19 2008

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
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
