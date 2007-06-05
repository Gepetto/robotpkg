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

# convenience target, to display make variables from command line
# i.e. "make show-var VARNAME=var", will print var's value
.PHONY: show-var
show-var:
	@${ECHO} $(call quote,${${VARNAME}})

# enhanced version of target above, to display multiple variables
.PHONY: show-vars
show-vars:
	@:; $(foreach VARNAME,${VARNAMES},${ECHO} $(call quote,${$(strip ${VARNAME})});)

LICENSE_FILE?=		${PKGSRCDIR}/licenses/${LICENSE}

show-license:
	@license=${LICENSE};						\
	license_file=${LICENSE_FILE};					\
	pager=${PAGER}	;						\
	case "$$pager" in "") pager=${CAT};; esac;			\
	case "$$license" in "") exit 0;; esac;				\
	if ${TEST} -f "$$license_file"; then				\
		$$pager "$$license_file";				\
	else								\
		${ECHO} "Generic $$license information not available";	\
		${ECHO} "See the package description (pkg_info -d ${PKGNAME}) for more information."; \
	fi

# DEPENDS_TYPE is used by the "show-depends-pkgpaths" target and specifies
# which class of dependencies to output.  The special value "all" means
# to output every dependency.
#
DEPENDS_TYPE?=  all
ifneq (,$(strip $(filter build all,${DEPENDS_TYPE})))
_ALL_DEPENDS+=	${BOOTSTRAP_DEPENDS} ${BUILD_DEPENDS}
endif
ifneq (,$(strip $(filter install package all,${DEPENDS_TYPE})))
_ALL_DEPENDS+=	${DEPENDS}
endif

# _PKG_PATHS_CMD canonicalizes package paths so that they're relative to
# ${PKGSRCDIR} and also verifies that they exist within pkgsrc.
#
_PKG_PATHS_CMD=								\
	${SETENV} ECHO=${TOOLS_ECHO} PKGSRCDIR=${PKGSRCDIR}		\
		PWD_CMD=pwd TEST=${TOOLS_TEST}				\
	${SH} ${CURDIR}/../../mk/internal/pkg_path

.PHONY: show-depends-dirs show-depends-pkgpaths
show-depends-dirs show-depends-pkgpaths:
	@${_PKG_PATHS_CMD} \
		$(sort $(foreach _d_,${_ALL_DEPENDS},$(word 2,$(subst :, ,${_d_}))))


# _DEPENDS_WALK_CMD holds the command (sans arguments) to walk the
# dependency graph for a package.
#
_DEPENDS_WALK_MAKEFLAGS?=	${MAKEFLAGS}
_DEPENDS_WALK_CMD=							\
	${SETENV} ECHO=${TOOLS_ECHO} MAKE=${MAKE}			\
		MAKEFLAGS=${_DEPENDS_WALK_MAKEFLAGS}			\
		PKGSRCDIR=${PKGSRCDIR} TEST=${TOOLS_TEST}		\
	${AWK} -f ${PKGSRCDIR}/mk/internal/depends-depth-first.awk --
