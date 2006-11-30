# $NetBSD: bsd.depends-vars.mk,v 1.4 2006/07/13 14:02:34 jlam Exp $
#
# This Makefile fragment is included separately by bsd.pkg.mk and
# defines some variables which must be defined earlier than where
# bsd.depends.mk is included.
#
# The following variables may be set in a package Makefile:
#
#    BOOTSTRAP_DEPENDS is a list of dependencies of the form "pattern:dir"
#	for packages that should be installed before any other stage is
#	invoked.
#
BOOTSTRAP_DEPENDS?=	# empty

_COOKIE.depends=	${WRKDIR}/.depends_done

# DEPENDS_TARGET is the target that is invoked to satisfy missing
# dependencies.  This variable is user-settable in /etc/mk.conf.
#
ifndef DEPENDS_TARGET
  ifneq (,$(findstring package,${MAKECMDGOALS}))
DEPENDS_TARGET=		package
  endif
  ifneq (,$(findstring update,${MAKECMDGOALS}))
    ifneq (,$(findstring replace,${UPDATE_TARGET}))
DEPENDS_TARGET=		${UPDATE_TARGET}
    else
DEPENDS_TARGET=		update
    endif
  endif
  ifneq (,$(findstring bin-install,${MAKECMDGOALS}))
DEPENDS_TARGET=		bin-install
  endif
  ifndef DEPENDS_TARGET
DEPENDS_TARGET=		reinstall
  endif
endif

# The following are the "public" targets provided by this module:
#
#    depends, bootstrap-depends, install-depends
#

######################################################################
### depends (PUBLIC)
######################################################################
### depends is a public target to install missing dependencies for
### the package.
###
.PHONY: depends
ifndef NO_DEPENDS
  include ${PKGSRCDIR}/mk/depends/depends.mk
endif

######################################################################
### bootstrap-depends (PUBLIC, OVERRIDE)
######################################################################
### bootstrap-depends is a public target to install any missing
### dependencies needed during stages before the normal "depends"
### stage.  These dependencies are listed in BOOTSTRAP_DEPENDS.
###
.PHONY: bootstrap-depends
bootstrap-depends:


######################################################################
### install-depends (PUBLIC)
######################################################################
### install-depends is a convenience target that installs all dependencies
### and removes the cookie file afterwards, so that the state of the
### filesystem remains unchanged.
###
### XXX This target is probably not needed and might be removed.
###
.PHONY: install-depends
install-depends: depends depends-clean


######################################################################
### depends-clean (PRIVATE)
######################################################################
### depends-clean removes the state files associated with the "depends"
### target so that "depends" may be re-invoked.
###
depends-clean:
	${_PKG_SILENT}${_PKG_DEBUG}${RM} -f ${_COOKIE.depends}
	${_PKG_SILENT}${_PKG_DEBUG}					\
	${RMDIR} -p ${_COOKIE.depends:H} 2>/dev/null || ${TRUE}
