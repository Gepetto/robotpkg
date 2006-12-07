# $NetBSD: package.mk,v 1.18 2006/10/09 12:25:44 joerg Exp $

# --- package (PUBLIC) -----------------------------------------------
#
# package is a public target to generate a binary package.
#
ifneq (,$(filter replace,${MAKECMDGOALS}))
_PACKAGE_TARGETS+=	replace
else
_PACKAGE_TARGETS+=	install
endif
_PACKAGE_TARGETS+=	acquire-package-lock
_PACKAGE_TARGETS+=	${_COOKIE.package}
_PACKAGE_TARGETS+=	release-package-lock

.PHONY: package
ifeq (yes,$(call exists,${_COOKIE.package}))
package:
	@${DO_NADA}
else
  ifdef _PKGSRC_BARRIER
package: ${_PACKAGE_TARGETS}
  else
package: barrier
  endif
endif

.PHONY: acquire-package-lock release-package-lock
acquire-package-lock: acquire-lock
release-package-lock: release-lock

ifeq (yes,$(call exists,${_COOKIE.package}))
${_COOKIE.package}:
	@${DO_NADA}
else
${_COOKIE.package}: real-package
endif


# --- real-package (PRIVATE) -----------------------------------------
#
# real-package is a helper target onto which one can hook all of the
# targets that do the actual packaging of the built objects.
#
_REAL_PACKAGE_TARGETS+=	package-message
_REAL_PACKAGE_TARGETS+=	pkg-check-installed
_REAL_PACKAGE_TARGETS+=	pkg-create
#_REAL_PACKAGE_TARGETS+=	error-check
_REAL_PACKAGE_TARGETS+=	package-cookie

.PHONY: real-package
real-package: ${_REAL_PACKAGE_TARGETS}

.PHONY: package-message
package-message:
	@${PHASE_MSG} "Building binary package for ${PKGNAME}"


# --- package-cookie (PRIVATE) ---------------------------------------
#
# package-cookie creates the "package" cookie file
#
.PHONY: package-cookie
package-cookie:
	${_PKG_SILENT}${_PKG_DEBUG}${TEST} ! -f ${_COOKIE.package} || ${FALSE}
	${_PKG_SILENT}${_PKG_DEBUG}${MKDIR} $(dir ${_COOKIE.package})
	${_PKG_SILENT}${_PKG_DEBUG}${ECHO} ${PKGNAME} > ${_COOKIE.package}
