# $NetBSD: deinstall.mk,v 1.2 2006/06/05 17:21:55 jlam Exp $

# Set the appropriate flags to pass to pkg_delete(1) based on the value
# of DEINSTALLDEPENDS (see pkgsrc/mk/install/deinstall.mk).
#
ifneq (,$(call isyes,${DEINSTALLDEPENDS}))
_PKG_ARGS_DEINSTALL+=	-r
endif
ifneq (,$(filter all All ALL,${DEINSTALLDEPENDS}))
_PKG_ARGS_DEINSTALL+=	-r -R
endif

ifdef PKG_VERBOSE
_PKG_ARGS_DEINSTALL+=	-v
endif

ifdef PKG_PRESERVE
  ifneq (,$(call isyes,${_UPDATE_RUNNING}))
_PKG_ARGS_DEINSTALL+=	-N -f	# update w/o removing any files
  endif
endif


# --- deinstall-pkg (PRIVATE, pkgsrc/mk/install/deinstall.mk) --------
#
# pkg-deinstall removes the package from the system.
#
pkg-deinstall:
	${_PKG_SILENT}${_PKG_DEBUG}					\
	found="`${PKG_INFO} -e \"${PKGNAME}\" || ${TRUE}`";		\
	case "$$found" in						\
	"") found="`${_PKG_BEST_EXISTS} $(call quote,${PKGWILDCARD}) || ${TRUE}`" ;; \
	esac;								\
	if ${TEST} -n "$$found"; then					\
		${ECHO} "Running ${PKG_DELETE} ${_PKG_ARGS_DEINSTALL} $$found"; \
		${PKG_DELETE} ${_PKG_ARGS_DEINSTALL} "$$found" || ${TRUE} ; \
	fi
ifneq (,$(call isyes,${DEINSTALLDEPENDS}))
	${_PKG_SILENT}${_PKG_DEBUG}					\
  $(foreach _pkg_,$(word 1,$(subst :, ,${BUILD_DEPENDS})),		\
	found="`${_PKG_BEST_EXISTS} $(call quote,${_pkg_}) || ${TRUE}`";\
	if ${TEST} -n "$$found"; then					\
		${ECHO} "Running ${PKG_DELETE} ${_PKG_ARGS_DEINSTALL} $$found"; \
		${PKG_DELETE} ${_PKG_ARGS_DEINSTALL} "$$found" || ${TRUE}; \
	fi;								\
  )
endif
