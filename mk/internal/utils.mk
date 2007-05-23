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
# From $NetBSD: bsd.utils.mk,v 1.8 2006/07/27 22:01:28 jlam Exp $
#
# This Makefile fragment is included by robotpkg.mk and defines utility
# and otherwise miscellaneous variables and targets.
#

TMPDIR?=	/tmp

# _DEPENDS_WALK_CMD holds the command (sans arguments) to walk the
# dependency graph for a package.
#
_DEPENDS_WALK_MAKEFLAGS?=	${MAKEFLAGS}
_DEPENDS_WALK_CMD=							\
	${SETENV} ECHO=${TOOLS_ECHO} MAKE=${MAKE}			\
		MAKEFLAGS=${_DEPENDS_WALK_MAKEFLAGS}			\
		PKGSRCDIR=${PKGSRCDIR} TEST=${TOOLS_TEST}		\
	${AWK} -f ${PKGSRCDIR}/mk/internal/depends-depth-first.awk --
