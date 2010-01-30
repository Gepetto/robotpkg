#
# Copyright (c) 2008,2010 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice,  this list of  conditions and  the following disclaimer in
#      the  documentation   and/or  other  materials   provided with  the
#      distribution.
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
#
# From $NetBSD: libtool-override.mk,v 1.9 2006/11/05 12:40:01 rillig Exp $
#
#                                       Anthony Mallet on Wed May 19 2008

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBTOOL_DEPEND_MK:=	${LIBTOOL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libtool
endif

ifeq (+,$(LIBTOOL_DEPEND_MK)) # --------------------------------------

PREFER.libtool?=	system

# on Darwin, libtool is glibtool
ifeq (Darwin,${OPSYS})
  _libtool=glibtool
else
  _libtool=libtool
endif

SYSTEM_SEARCH.libtool=\
  'bin/${_libtool}:/libtool/{s/^[^0-9]*//;s/[^.0-9].*$$//;p;}:% --version' \
  'share/aclocal/libtool.m4'			\
  'share/libtool/{,config/}config.guess'	\
  'share/libtool/{,config/}config.sub'		\
  'share/libtool/{,config/}ltmain.sh'

DEPEND_USE+=		libtool
DEPEND_METHOD.libtool+=	build
DEPEND_ABI.libtool?=	libtool>=1.5.22
DEPEND_DIR.libtool?=	../../pkgtools/libtool
DEPEND_INCDIRS.libtool?=# empty
DEPEND_LIBDIRS.libtool?=# empty

# LIBTOOL is the publicly-readable variable that should be used by Makefiles to
# invoke the proper libtool.
#
export LIBTOOL?=	$(word 1,${SYSTEM_FILES.libtool})
TOOLS.config.guess?=	$(word 3,${SYSTEM_FILES.libtool})
TOOLS.config.sub?=	$(word 4,${SYSTEM_FILES.libtool})
TOOLS.ltmain.sh?=	$(word 5,${SYSTEM_FILES.libtool})


# libtool-override replace any existing libtool files under ${WRKSRC}
# with the version found by robotpkg.
#
#pre-configure: libtool-override

LIBTOOL_OVERRIDE?=		libtool config.guess config.sub ltmain.sh
OVERRIDE_DIRDEPTH.libtool?=	${OVERRIDE_DIRDEPTH}

OVERRIDE_PATH.libtool?=		${LIBTOOL}
OVERRIDE_PATH.config.guess?=	${TOOLS.config.guess}
OVERRIDE_PATH.config.sub?=	${TOOLS.config.sub}
OVERRIDE_PATH.ltmain.sh?=	${TOOLS.ltmain.sh}

define _SCRIPT.libtool-override
	${CHMOD} +w $$$$file;						\
	${CAT} ${OVERRIDE_PATH.${1}} > $$$$file
endef

.PHONY: libtool-override
libtool-override:
	@${STEP_MSG} "Modifying libtool scripts to use ${PREFER.libtool} libtool"
	${RUN}								\
	cd ${WRKSRC};							\
$(foreach pattern,${LIBTOOL_OVERRIDE},					\
	depth=0; pattern=${pattern};					\
	while [ $$depth -le ${OVERRIDE_DIRDEPTH.libtool} ]; do		\
		for file in $$pattern; do				\
			[ -f "$$file" ] || [ -h "$$file" ] || continue; \
			${CHMOD} +w $$file;				\
			${CAT} ${OVERRIDE_PATH.${pattern}} > $$file;	\
		done;							\
		depth=`${EXPR} $$depth + 1`; pattern="*/$$pattern";	\
	done;								\
)

endif # LIBTOOL_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
