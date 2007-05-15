#
# Copyright (c) 2007 LAAS/CNRS                        --  Tue May 15 2007
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


# --- libtool-override -----------------------------------------------

# libtool-override replace any existing libtool under ${WRKSRC} with the
# version installed by pkgsrc.
#

do-configure-post-hook: libtool-override

OVERRIDE_DIRDEPTH.libtool?=	${OVERRIDE_DIRDEPTH}
_OVERRIDE_PATH.libtool=		${_LIBTOOL}

_SCRIPT.libtool-override=						\
	${RM} -f $$file;						\
	${ECHO} "\#!"${SH} > $$file;				\
	${ECHO} "exec" ${_OVERRIDE_PATH.libtool} '"$$@"' >> $$file;	\
	${CHMOD} +x $$file

.PHONY: libtool-override
libtool-override:
	@${STEP_MSG} "Modifying libtool scripts to use robotpkg libtool"
ifdef LIBTOOL_OVERRIDE
	${_PKG_SILENT}${_PKG_DEBUG}set -e;				\
	cd ${WRKSRC};							\
	set -- dummy ${LIBTOOL_OVERRIDE}; shift;			\
	while [ $$# -gt 0 ]; do						\
		file="$$1"; shift;					\
		[ -f "$$file" ] || [ -h "$$file" ] || continue;		\
		${_SCRIPT.$@};						\
	done
else
	${_PKG_SILENT}${_PKG_DEBUG}set -e;				\
	cd ${WRKSRC};							\
	depth=0; pattern=libtool;					\
	while [ $$depth -le ${OVERRIDE_DIRDEPTH.libtool} ]; do		\
		for file in $$pattern; do				\
			[ -f "$$file" ] || [ -h "$$file" ] || continue; \
			${_SCRIPT.$@};					\
		done;							\
		depth=`${EXPR} $$depth + 1`; pattern="*/$$pattern";	\
	done
endif
