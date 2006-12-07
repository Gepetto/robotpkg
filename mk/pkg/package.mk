# $NetBSD: package.mk,v 1.6 2006/11/03 08:01:04 joerg Exp $

PKG_SUFX?=		.tgz
PKGFILE?=		${PKGREPOSITORY}/${PKGNAME}${PKG_SUFX}
PKGREPOSITORY?=		${PACKAGES}/${PKGREPOSITORYSUBDIR}
PKGREPOSITORYSUBDIR?=	All

# --- pkg-check-installed (PRIVATE, pkgsrc/mk/package/package.mk) ----
#
# pkg-check-installed verifies that the package is installed on
# the system.
#
.PHONY: pkg-check-installed
pkg-check-installed:
	${_PKG_SILENT}${_PKG_DEBUG}					\
	${PKG_INFO} -qe ${PKGNAME};					\
	if ${TEST} $$? -ne 0; then					\
		${ERROR_MSG} "${PKGNAME} is not installed.";		\
		exit 1;							\
	fi


# --- pkg-create (PRIVATE, pkgsrc/mk/package/package.mk) -------------
#
# pkg-create creates the binary package.
#
.PHONY: package-create
pkg-create: pkg-remove ${PKGFILE} pkg-links

_PKG_ARGS_PACKAGE+=	${_PKG_CREATE_ARGS}
_PKG_ARGS_PACKAGE+=	-p ${PREFIX}
_PKG_ARGS_PACKAGE+=	-L ${PREFIX}			# @src ...

${PKGFILE}: ${_CONTENTS_TARGETS}
	${_PKG_SILENT}${_PKG_DEBUG}${MKDIR} $(dir $@)
	${_PKG_SILENT}${_PKG_DEBUG} set -e;				\
	${PKG_CREATE} ${_PKG_ARGS_PACKAGE} $@ || {			\
		exitcode=$$?;						\
		${ERROR_MSG} "$(notdir ${PKG_CREATE}) failed ($$exitcode)";	\
		${RM} -f $@;					\
		exit 1;							\
	}


# --- pkg-remove (PRIVATE) -------------------------------------------
#
# pkg-remove removes the binary package from the package
# repository.
#
.PHONY: pkg-remove
pkg-remove:
	${_PKG_SILENT}${_PKG_DEBUG}${RM} -f ${PKGFILE}


# --- pkg-links (PRIVATE) --------------------------------------------
#
# pkg-links creates symlinks to the binary package from the
# non-primary categories to which the package belongs.
#
pkg-links: pkg-delete-links
	${_PKG_SILENT}${_PKG_DEBUG}					\
$(foreach _dir_,$(addprefix ${PACKAGES}/,${CATEGORIES}),		\
	${MKDIR} ${_dir_};						\
	if ${TEST} ! -d ${_dir_}; then					\
		${ERROR_MSG} "Can't create directory "${_dir_}".";	\
		exit 1;							\
	fi;								\
	${RM} -f ${_dir_}/$(notdir ${PKGFILE}); 			\
	${LN} -s ../${PKGREPOSITORYSUBDIR}/$(notdir ${PKGFILE}) ${_dir_}; \
)


# --- pkg-delete-links (PRIVATE) -------------------------------------
#
# pkg-delete-links removes the symlinks to the binary package from
# the non-primary categories to which the package belongs.
#
pkg-delete-links:
	${_PKG_SILENT}${_PKG_DEBUG}					\
	${FIND} ${PACKAGES} -type l -name $(notdir ${PKGFILE}) -print |	\
	${XARGS} ${RM} -f


# --- tarup (PUBLIC) -------------------------------------------------
#
# tarup is a public target to generate a binary package from an
# installed package instance.
#
_PKG_TARUP_CMD= ${LOCALBASE}/bin/pkg_tarup

.PHONY: tarup
tarup: pkg-remove tarup-pkg pkg-links


# --- tarup-pkg (PRIVATE) --------------------------------------------
#
# tarup-pkg creates a binary package from an installed package instance
# using "pkg_tarup".
#
tarup-pkg:
	${_PKG_SILENT}${_PKG_DEBUG}					\
	${TEST} -x ${_PKG_TARUP_CMD} || exit 1;				\
	${SETENV} PKG_DBDIR=${_PKG_DBDIR} PKG_SUFX=${PKG_SUFX}		\
		PKGREPOSITORY=${PKGREPOSITORY}				\
		${_PKG_TARUP_CMD} ${PKGNAME}
