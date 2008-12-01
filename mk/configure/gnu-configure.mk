# $LAAS: gnu-configure.mk 2008/12/01 23:58:12 tho $
#
# Copyright (c) 2006,2008 LAAS/CNRS
# All rights reserved.
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
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
# From $NetBSD: gnu-configure.mk,v 1.1 2006/07/05 06:09:15 jlam Exp $
#
#                                       Anthony Mallet on Thu Dec  7 2006

HAS_CONFIGURE=			defined
OVERRIDE_GNU_CONFIG_SCRIPTS=	defined

CONFIG_SHELL?=	${SH}
CONFIGURE_ENV+=	CONFIG_SHELL=${CONFIG_SHELL}
CONFIGURE_ENV+=	LIBS=$(call quote,${LIBS})
CONFIGURE_ENV+=	install_sh=${INSTALL}
CONFIGURE_ENV+=	ac_given_INSTALL=${INSTALL}\ -c\ -o\ ${BINOWN}\ -g\ ${BINGRP}


GNU_CONFIGURE_PREFIX?=	${PREFIX}
CONFIGURE_ARGS+=	--prefix=${GNU_CONFIGURE_PREFIX}

# USE_GNU_CONFIGURE_HOST instructs robotpkg to guess the gnu target name
# and make the appropriate substitutions in PLIST.
#
USE_GNU_CONFIGURE_HOST?=	no
ifneq (,$(call isyes,${USE_GNU_CONFIGURE_HOST}))
  ifndef GNU_CONFIGURE_HOST
    GNU_CONFIGURE_HOST=	$(shell ${ROBOTPKG_DIR}/mk/configure/config.guess)
    MAKEOVERRIDES+=	GNU_CONFIGURE_HOST=${GNU_CONFIGURE_HOST}
  endif
  ifdef GNU_CONFIGURE_HOST
CONFIGURE_ARGS+=	--host=${GNU_CONFIGURE_HOST}
PLIST_SUBST+=\
	GNU_CONFIGURE_HOST=$(call quote,${GNU_CONFIGURE_HOST})
PRINT_PLIST_AWK_SUBST+=\
	gsub("${GNU_CONFIGURE_HOST}", "$${GNU_CONFIGURE_HOST}");
  endif
endif

# PKGINFODIR is the subdirectory of ${PREFIX} into which the info
# files are installed unless the software was configured with an
# installation prefix other than ${PREFIX}.
#
CONFIGURE_HAS_INFODIR?=	yes
GNU_CONFIGURE_INFODIR?=	${GNU_CONFIGURE_PREFIX}/${PKGINFODIR}
ifneq (,$(call isyes,${CONFIGURE_HAS_INFODIR}))
CONFIGURE_ARGS+=	--infodir=${GNU_CONFIGURE_INFODIR}
endif

# PKGMANDIR is the subdirectory of ${PREFIX} into which the man and
# catman pages are installed unless the software was configured with
# an installation prefix other than ${PREFIX}.
#
CONFIGURE_HAS_MANDIR?=	 yes
GNU_CONFIGURE_MANDIR?=	${GNU_CONFIGURE_PREFIX}/${PKGMANDIR}
ifneq (,$(call isyes,${CONFIGURE_HAS_MANDIR}))
CONFIGURE_ARGS+=	--mandir=${GNU_CONFIGURE_MANDIR}
endif


# --- configure-scripts-override (PRIVATE) ---------------------------
#
# configure-scripts-override modifies the GNU configure scripts in
# ${WRKSRC} so that the generated config.status scripts never do
# anything on "--recheck".  This is important in pkgsrc because we
# only ever want to run the configure checks during the configure
# phase, and "recheck" is often run during the build and install
# phases.
#
do-configure-pre-hook: configure-scripts-override

_SCRIPT.configure-scripts-override=					\
	${AWK} '/ *-recheck *\| *--recheck.*\)/ {			\
			print;						\
			print "	: Avoid regenerating within pkgsrc";	\
			print "	exit 0";				\
			next;						\
		}							\
		{ print }' $$file > $$file.override;			\
	${CHMOD} +x $$file.override;					\
	${MV} -f $$file.override $$file

OVERRIDE_DIRDEPTH.configure?=	${OVERRIDE_DIRDEPTH}

.PHONY: configure-scripts-override
configure-scripts-override:
	@${STEP_MSG} "Modifying GNU configure scripts to avoid --recheck"
	${_PKG_SILENT}${_PKG_DEBUG}set -e;				\
	cd ${WRKSRC};							\
	depth=0; pattern=$(notdir ${CONFIGURE_SCRIPT});			\
	while ${TEST} $$depth -le ${OVERRIDE_DIRDEPTH.configure}; do	\
		for file in $$pattern; do				\
			${TEST} -f "$$file" || continue;		\
			${_SCRIPT.$@};					\
		done;							\
		depth=`${EXPR} $$depth + 1`; pattern="*/$$pattern";	\
	done
