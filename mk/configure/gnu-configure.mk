#
# Copyright (c) 2006 LAAS/CNRS                        --  Thu Dec  7 2006
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
# From $NetBSD: gnu-configure.mk,v 1.1 2006/07/05 06:09:15 jlam Exp $

HAS_CONFIGURE=			defined
OVERRIDE_GNU_CONFIG_SCRIPTS=	defined

CONFIG_SHELL?=	${SH}
CONFIGURE_ENV+=	CONFIG_SHELL=${CONFIG_SHELL}
CONFIGURE_ENV+=	LIBS=${LIBS}
CONFIGURE_ENV+=	install_sh=${INSTALL}
CONFIGURE_ENV+=	ac_given_INSTALL=${INSTALL}\ -c\ -o\ ${BINOWN}\ -g\ ${BINGRP}

#.if (defined(USE_LIBTOOL) || !empty(PKGPATH:Mdevel/libtool-base)) && \
#    defined(_OPSYS_MAX_CMDLEN_CMD)
#CONFIGURE_ENV+=	lt_cv_sys_max_cmd_len=${_OPSYS_MAX_CMDLEN_CMD:sh}
#.endif

GNU_CONFIGURE_PREFIX?=	${PREFIX}
CONFIGURE_ARGS+=	--prefix=${GNU_CONFIGURE_PREFIX}

#USE_GNU_CONFIGURE_HOST?=	yes
#.if !empty(USE_GNU_CONFIGURE_HOST:M[yY][eE][sS])
#CONFIGURE_ARGS+=	--host=${MACHINE_GNU_PLATFORM:Q}
#.endif

# PKGINFODIR is the subdirectory of ${PREFIX} into which the info
# files are installed unless the software was configured with an
# installation prefix other than ${PREFIX}.
#
#CONFIGURE_HAS_INFODIR?=	yes
#.if ${GNU_CONFIGURE_PREFIX} == ${PREFIX}
#GNU_CONFIGURE_INFODIR?=	${GNU_CONFIGURE_PREFIX}/${PKGINFODIR}
#.else
#GNU_CONFIGURE_INFODIR?=	${GNU_CONFIGURE_PREFIX}/info
#.endif
#.if defined(INFO_FILES) && !empty(CONFIGURE_HAS_INFODIR:M[yY][eE][sS])
#CONFIGURE_ARGS+=	--infodir=${GNU_CONFIGURE_INFODIR:Q}
#.endif

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
