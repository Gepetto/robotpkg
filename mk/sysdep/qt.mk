#
# Copyright (c) 2018-2019 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use  in  source  and binary  forms,  with  or  without
# modification, are permitted provided that the following conditions are met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
# THE SOFTWARE  IS PROVIDED "AS IS"  AND THE AUTHOR  DISCLAIMS ALL WARRANTIES
# WITH  REGARD   TO  THIS  SOFTWARE  INCLUDING  ALL   IMPLIED  WARRANTIES  OF
# MERCHANTABILITY AND  FITNESS.  IN NO EVENT  SHALL THE AUTHOR  BE LIABLE FOR
# ANY  SPECIAL, DIRECT,  INDIRECT, OR  CONSEQUENTIAL DAMAGES  OR  ANY DAMAGES
# WHATSOEVER  RESULTING FROM  LOSS OF  USE, DATA  OR PROFITS,  WHETHER  IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR  OTHER TORTIOUS ACTION, ARISING OUT OF OR
# IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
#                                           Anthony Mallet on Mon Nov 12 2018
#

#
# Qt alternative definition
#
# This file determines which Qt version is used as a dependency for
# a package.
#
# === User-settable variables ===
#
# PREFER_ALTERNATIVE.qt
#	The preferred Qt version to use.
#
#	Possible values: qt4 qt5
#	Default: qt5 qt4
#
# === Package-settable variables ===
#
# DEPEND_ABI.qt
#	The Qt versions that are acceptable for the package.
#
#	Possible values: any pattern
#	Default: qt>=4
#
# QT_SELF_CONFLICT
#       If set to "yes", additional CONFLICTS entries are added for
#       registering a conflict between qtN-<modulename> packages.
#
#       Possible values: yes no
#       Default: no
#
# === Defined variables ===
#
# PKGTAG.qt
#       The prefix to use in PKGNAME for extensions which are meant
#       to be installed for multiple Qt versions.
#
#       Example: qt5
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
QT_DEPEND_MK:=		${QT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
  DEPEND_PKG+=		${PKG_ALTERNATIVE.qt}
endif

ifeq (+,$(QT_DEPEND_MK)) # -------------------------------------------------

PREFER.qt?=		system
DEPEND_ABI.qt?=		qt>=4

# Additional CONFLICTS
ifneq (,$(call isyes,${QT_SELF_CONFLICT}))
  CONFLICTS_SUBST+=	${PKGTAG.qt-}=qt[0-9]-
  CONFLICTS+=		${PKGWILDCARD}
endif

# set default preferences depending on OS/VERSION
PREFER_ALTERNATIVE.qt?=		qt5 qt4

# define an alternative for available qt packages
PKG_ALTERNATIVES+=	qt
PKG_ALTERNATIVES.qt=	qt4 qt5

PKG_ALTERNATIVE_DESCR.qt4= Use qt-4
PKGTAG.qt4 =		qt4
define PKG_ALTERNATIVE_SELECT.qt4
  $(call preduce,${DEPEND_ABI.qt} qt>=4<5)
endef
define PKG_ALTERNATIVE_SET.qt4
  include ../../mk/sysdep/qt4-libs.mk
  DEPEND_ABI.qt4-libs+=$(subst qt,qt4-libs,${PKG_ALTERNATIVE_SELECT.qt4})
endef

PKG_ALTERNATIVE_DESCR.qt5= Use qt-5
PKGTAG.qt5 =		qt5
define PKG_ALTERNATIVE_SELECT.qt5
  $(call preduce,${DEPEND_ABI.qt} qt>=5<6)
endef
define PKG_ALTERNATIVE_SET.qt5
  include ../../mk/sysdep/qt5-qtbase.mk
  DEPEND_ABI.qt5-qtbase+=$(subst qt,qt5-qtbase,${PKG_ALTERNATIVE_SELECT.qt5})
endef

endif # QT_DEPEND_MK -------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
