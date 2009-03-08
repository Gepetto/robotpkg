# $LAAS: depend.mk 2009/03/08 19:48:36 tho $
#
# Copyright (c) 2008-2009 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice and  this list of  conditions  in the  documentation and/or
#      other materials provided with the distribution.
#
#                                       Anthony Mallet on Wed May 22 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PKG_CONFIG_DEPEND_MK:=	${PKG_CONFIG_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		pkg-config
endif

ifeq (+,$(PKG_CONFIG_DEPEND_MK)) # -----------------------------------

PREFER.pkg-config?=		system

SYSTEM_SEARCH.pkg-config=	bin/pkg-config

DEPEND_USE+=			pkg-config
DEPEND_METHOD.pkg-config+=	build
DEPEND_ABI.pkg-config?=		pkg-config>=0.22
DEPEND_DIR.pkg-config?=		../../pkgtools/pkg-config

SYSTEM_PKG.Linux-fedora.pkg-config=	pkgconfig
SYSTEM_PKG.NetBSD.pkg-config=		pkgsrc/devel/pkg-config

# TOOLS.pkg-config is the publicly-readable variable that should be
# used by Makefiles to invoke the proper pkg-config.
#
TOOLS.pkg-config?=		${PREFIX.pkg-config}/bin/pkg-config

# Define the proper pkg-config in make and configure environments
#
MAKE_ENV+=		PKG_CONFIG=$(call quote,${TOOLS.pkg-config})
CONFIGURE_ENV+=		PKG_CONFIG=$(call quote,${TOOLS.pkg-config})

# Append our path in front of PKG_CONFIG_PATH
#
CONFIGURE_ENV+= PKG_CONFIG_PATH=$(call quote,$(call \
		prependpath,${PREFIX}/lib/pkgconfig,${PKG_CONFIG_PATH}))


# insert the compiler's "rpath" flag into pkg-config data files so that
# ``pkg-config --libs <module>'' will return the full set of compiler
# flags needed to find libraries at run-time. If this is not desirable,
# set PKG_CONFIG_OVERRIDE to an empty value before including this file.
#
# From $NetBSD: pkg-config-override.mk,v 1.3 2007/07/25 18:07:34 rillig Exp $
#
OVERRIDE_DIRDEPTH.pkg-config?=	${OVERRIDE_DIRDEPTH}
PKG_CONFIG_OVERRIDE_PATTERN?=	*.pc *.pc.in

ifndef PKG_CONFIG_OVERRIDE
  # pull-in preferences now, for OVERRIDE_DIRDEPTH
  include ../../mk/robotpkg.prefs.mk

  # build the default pattern list according to the selected depth.
  # the result is a list like *.pc */*.pc */*/.pc ...
  #
  $(eval PKG_CONFIG_OVERRIDE:= ${PKG_CONFIG_OVERRIDE_PATTERN}	\
    $(call substs,{ | },$$( , ),				\
    $(call iterate,${OVERRIDE_DIRDEPTH.pkg-config},{addprefix	\
	*/|${PKG_CONFIG_OVERRIDE_PATTERN})			\
    $(call iterate,${OVERRIDE_DIRDEPTH.pkg-config},}))		\
  )
endif

ifneq (,${PKG_CONFIG_OVERRIDE})
  SUBST_CLASSES+=		pkgconfig
  SUBST_STAGE.pkgconfig=	do-configure-pre-hook
  SUBST_MESSAGE.pkgconfig=	Adding run-time search paths to pkg-config files.
  SUBST_FILES.pkgconfig=	${PKG_CONFIG_OVERRIDE}
  SUBST_SED.pkgconfig=\
	'/^Libs:.*[ 	]/s|-L\([ 	]*[^ 	]*\)|${COMPILER_RPATH_FLAG}\1 -L\1|g'
endif

endif # PKG_CONFIG_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
