# $LAAS: readme.mk 2008/05/25 22:46:16 tho $
#
# Copyright (c) 2007-2008 LAAS/CNRS
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
# THIS SOFTWARE IS PROVIDED BY THE  AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY  EXPRESS OR IMPLIED WARRANTIES, INCLUDING,  BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES   OF MERCHANTABILITY AND  FITNESS  FOR  A PARTICULAR
# PURPOSE ARE DISCLAIMED.  IN NO  EVENT SHALL THE AUTHOR OR  CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT,  INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING,  BUT  NOT LIMITED TO, PROCUREMENT  OF
# SUBSTITUTE  GOODS OR SERVICES;  LOSS   OF  USE,  DATA, OR PROFITS;   OR
# BUSINESS  INTERRUPTION) HOWEVER CAUSED AND  ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE  USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# From $NetBSD: bsd.pkg.readme.mk,v 1.6 2006/10/17 06:28:33 rillig Exp $
#
#					Anthony Mallet on Wed May 16 2007
#

# This Makefile fragment is included by bsd.pkg.mk and encapsulates the
# code to produce README.html files in each package directory.
#
# The following are the "public" targets provided by this module.
#
#    readme		This target generates a README.html file suitable
#			for being served via FTP.
#
# The following are the user-settable variables that may be defined in
# /etc/mk.conf.
#
#    PKG_URL_HOST is the host portion of the URL to embed in each
#	README.html file to be served via FTP or HTTP, and defaults to
#	"http://softs.laas.fr".
#
#    PKG_URL_DIR is the directory portion of the URL to embed in each
#	README.html file to be served via FTP, and defaults to
#	"/openrobots/robotpkg/packages".

define htmlify
$(subst >,&gt;,$(subst <,&lt;,$(subst &,&amp;,$(1))))
endef

_HTML_PKGNAME=		$(call htmlify,${PKGNAME})
_HTML_PKGPATH=		$(call htmlify,${PKGPATH})
_HTML_PKGLINK=		<a href="../../${_HTML_PKGPATH}/README.html">${_HTML_PKGNAME}</a>

# Set to "html" by the README.html target to generate HTML code,
# or anything else to generate regular package name
# This variable is passed down via build-depends-list and run-depends-list
PACKAGE_NAME_TYPE?=	name

.PHONY: package-name
package-name:
ifeq (${PACKAGE_NAME_TYPE},"html")
	@${ECHO} $(call quote,${_HTML_PKGLINK})
else
	@${ECHO} ${PKGNAME}
endif # PACKAGE_NAME_TYPE

.PHONY: make-readme-html-help
make-readme-html-help:
	@${ECHO} '${_HTML_PKGNAME}</a>: <td>'$(call quote,$(call htmlify,${COMMENT}))

# Show (non-recursively) all the packages this package depends on.
# If PACKAGE_DEPENDS_WITH_PATTERNS is set, print as pattern (if possible)
PACKAGE_DEPENDS_WITH_PATTERNS?=true

.PHONY: run-depends-list
run-depends-list:
	${_PKG_SILENT}${_PKG_DEBUG}					\
$(foreach dep,${DEPENDS},						\
	pkg="$(firstword $(subst :, ,${dep}))";				\
	dir="$(word 2,$(subst :, ,${dep}))";				\
	cd ${CURDIR};							\
	if ${PACKAGE_DEPENDS_WITH_PATTERNS}; then			\
		${ECHO} "$$pkg";					\
	else								\
		if cd $$dir 2>/dev/null; then				\
			${RECURSIVE_MAKE} ${MAKEFLAGS} package-name PACKAGE_NAME_TYPE=${PACKAGE_NAME_TYPE}; \
		else 							\
			${ECHO_MSG} "Warning: \"$$dir\" non-existent -- @pkgdep registration incomplete" >&2; \
		fi;							\
	fi;								\
)

.PHONY: build-depends-list
build-depends-list:
	@${_DEPENDS_WALK_CMD} ${PKGPATH} |				\
	while read dir; do						\
		( cd ../../$$dir && ${RECURSIVE_MAKE} ${MAKEFLAGS} package-name PACKAGE_NAME_TYPE=${PACKAGE_NAME_TYPE}) \
	done


# If PACKAGES is set to the default (../../pkgsrc/packages), the current
# ${MACHINE_ARCH} and "release" (uname -r) will be used. Otherwise a directory
# structure of ...pkgsrc/packages/`uname -r`/${MACHINE_ARCH} is assumed.
# The PKG_URL is set from PKG_URL_*.
.PHONY: binpkg-list
binpkg-list:
	@if ${TEST} -d ${PACKAGES}; then					\
		cd ${PACKAGES};						\
		case ${CURDIR} in					\
		*/pkgsrc/packages)					\
			for pkg in ${PKGREPOSITORYSUBDIR}/${PKGWILDCARD}${PKG_SUFX} ; \
			do 						\
				if [ -f "$$pkg" ] ; then		\
					pkgname=`${ECHO} $$pkg | ${SED} 's@.*/@@'`; \
					${ECHO} "<tr><td>${MACHINE_ARCH}:<td><a href=\"${PKG_URL}/$$pkg\">$$pkgname</a><td>(${OPSYS} ${OS_VERSION})"; \
				fi ;					\
			done ; 						\
			;;						\
		*)							\
			cd ${PACKAGES}/../..;				\
			for i in [1-9].*/*; do  			\
				if cd ${PACKAGES}/../../$$i/${PKGREPOSITORYSUBDIR} 2>/dev/null; then \
					for j in ${PKGWILDCARD}${PKG_SUFX}; \
					do 				\
						if [ -f "$$j" ]; then	\
							${ECHO} $$i/$$j;\
						fi;			\
					done; 				\
				fi; 					\
			done | ${AWK} -F/ '				\
				{					\
					release = $$1;			\
					arch = $$2; 			\
					pkg = $$3;			\
					gsub("\\.tgz","", pkg);		\
					if (arch != "m68k" && arch != "mipsel") { \
						if (arch in urls)	\
							urls[arch "/" pkg "/" release] = "<a href=\"${PKG_URL}/" release "/" arch "/${PKGREPOSITORYSUBDIR}/" pkg "${PKG_SUFX}\">" pkg "</a>, " urls[arch]; \
						else			\
							urls[arch "/" pkg "/" release] = "<a href=\"${PKG_URL}/" release "/" arch "/${PKGREPOSITORYSUBDIR}/" pkg "${PKG_SUFX}\">" pkg "</a> "; \
					}				\
				} 					\
				END { 					\
					for (av in urls) {		\
						split(av, ava, "/");	\
						arch=ava[1];		\
						pkg=ava[2];		\
						release=ava[3];		\
						print "<tr><td>" arch ":<td>" urls[av] "<td>(${OPSYS} " release ")"; \
					}				\
				}' | ${SORT}				\
			;;						\
		esac;							\
	fi

# This target generates an index entry suitable for aggregation into
# a large index.  Format is:
#
# distribution-name|package-path|installation-prefix|comment| \
#  description-file|maintainer|categories|build deps|run deps|for arch| \
#  not for opsys
#
.PHONY: describe
describe:
	@${ECHO_N} "${PKGNAME}|${CURDIR}|";				\
	${ECHO_N} "${PREFIX}|";						\
	${ECHO_N} $(call quote,${COMMENT});				\
	if [ -f ${DESCR_SRC} ]; then					\
		${ECHO_N} "|${DESCR_SRC}";				\
	else								\
		${ECHO_N} "|/dev/null";					\
	fi;								\
	${ECHO_N} "|${MAINTAINER}|${CATEGORIES}|";			\
	case "A${BUILD_DEPENDS}B${DEPENDS}C" in	\
		ABC) ;;							\
		*) cd ${CURDIR} && ${ECHO_N} `${RECURSIVE_MAKE} ${MAKEFLAGS} build-depends-list | ${SORT} -u`;; \
	esac;								\
	${ECHO_N} "|";							\
	if [ "${DEPENDS}" != "" ]; then					\
		cd ${CURDIR} && ${ECHO_N} `${RECURSIVE_MAKE} ${MAKEFLAGS} run-depends-list | ${SORT} -u`; \
	fi;								\
	${ECHO_N} "|";							\
	if [ "${ONLY_FOR_PLATFORM}" = "" ]; then			\
		${ECHO_N} "any";					\
	else								\
		${ECHO_N} "${ONLY_FOR_PLATFORM}";			\
	fi;								\
	${ECHO_N} "|";							\
	if [ "${NOT_FOR_PLATFORM}" = "" ]; then				\
		${ECHO_N} "any";					\
	else								\
		${ECHO_N} "not ${NOT_FOR_PLATFORM}";			\
	fi;								\
	${ECHO} ""


# This target is used to generate README.html files
PKG_URL_HOST?=	http://softs.laas.fr
PKG_URL_DIR?=	/openrobots/robotpkg/packages
.PHONY: readme
readme:
	@cd ${CURDIR} && ${RECURSIVE_MAKE} ${MAKEFLAGS} README.html PKG_URL=${PKG_URL_HOST}${PKG_URL_DIR}


README_NAME=	${TEMPLATES}/README.pkg

# set up the correct license information as a sed expression
ifdef LICENSE
SED_LICENSE_EXPR=	-e 's|%%LICENSE%%|<p>Please note that this package has a ${LICENSE} license.</p>|'
else
SED_LICENSE_EXPR=	-e 's|%%LICENSE%%||'
endif

# set up the "more info URL" information as a sed expression
ifdef HOMEPAGE
SED_HOMEPAGE_EXPR=	-e 's|%%HOMEPAGE%%|<p>This package has a home page at <a HREF="${HOMEPAGE}">${HOMEPAGE}</a>.</p>|'
else
SED_HOMEPAGE_EXPR=	-e 's|%%HOMEPAGE%%||'
endif


# If PACKAGES is set to the default (../../packages), the current
# ${MACHINE_ARCH} and "release" (uname -r) will be used. Otherwise a directory
# structure of ...pkgsrc/packages/`uname -r`/${MACHINE_ARCH} is assumed.
# The PKG_URL is set from FTP_PKG_URL_*.
.PHONY .PRECIOUS: README.html
README.html:
	@${SETENV} MAKE=${MAKE} ${SH} ../../mk/internal/mkdatabase -f $@.tmp1
	${AWK} -f ../../mk/internal/genreadme.awk \
		builddependsfile=/dev/null \
		dependsfile=/dev/null \
		AWK=${AWK} \
		CMP=${CMP} \
		DISTDIR=${DISTDIR} \
		GREP=${GREP} \
		PACKAGES=${PACKAGES} \
		PKG_INFO=$(call quote,${PKG_INFO}) \
		PKG_SUFX=${PKG_SUFX} \
		PKG_URL=${PKG_URL} \
		ROBOTPKG_DIR=${ROBOTPKG_DIR} \
		SED=${SED} \
		SETENV=${SETENV} \
		SORT=${SORT} \
		TMPDIR=${TMPDIR} \
		SINGLEPKG=${PKGPATH} \
		$@.tmp1
	@${RM} $@.tmp1

.PHONY: print-build-depends-list
print-build-depends-list:
ifneq (,$(BUILD_DEPENDS)$(DEPENDS))
	@${ECHO_N} 'This package requires package(s) "'
	@${ECHO_N} `${RECURSIVE_MAKE} ${MAKEFLAGS} build-depends-list | ${SORT} -u`
	@${ECHO} '" to build.'
endif

.PHONY: print-run-depends-list
print-run-depends-list:
ifneq (,$(DEPENDS))
	@${ECHO_N} 'This package requires package(s) "'
	@${ECHO_N} `${RECURSIVE_MAKE} ${MAKEFLAGS} run-depends-list | ${SORT} -u`
	@${ECHO} '" to run.'
endif

# This target is used by the mk/scripts/mkreadme script to generate
# README.html files
.PHONY: print-summary-data
print-summary-data:
	@${ECHO} depends ${PKGPATH} $(call quote,${DEPENDS})
	@${ECHO} build_depends ${PKGPATH} $(call quote,${BUILD_DEPENDS})
	@${ECHO} conflicts ${PKGPATH} ${CONFLICTS}
	@${ECHO} index ${PKGPATH} ${PKGNAME}
	@${ECHO} htmlname ${PKGPATH} $(call quote,${_HTML_PKGLINK})
	@${ECHO} homepage ${PKGPATH} $(call quote,${HOMEPAGE})
	@${ECHO} wildcard ${PKGPATH} $(call quote,${PKGWILDCARD})
	@${ECHO} comment ${PKGPATH} $(call quote,${COMMENT})
	@${ECHO} license ${PKGPATH} $(call quote,${LICENSE})
	@if [ "${ONLY_FOR_PLATFORM}" = "" ]; then			\
		${ECHO} "onlyfor ${PKGPATH} any";			\
	else								\
		${ECHO} "onlyfor ${PKGPATH} ${ONLY_FOR_PLATFORM}";	\
	fi
	@if [ "${NOT_FOR_PLATFORM}" = "" ]; then			\
		${ECHO} "notfor ${PKGPATH} any";			\
	else								\
		${ECHO} "notfor ${PKGPATH} not ${NOT_FOR_PLATFORM}";	\
	fi;
	@${ECHO} "maintainer ${PKGPATH} ${MAINTAINER}"
	@${ECHO} "categories ${PKGPATH} ${CATEGORIES}"
	@if [ -f ${DESCR_SRC} ]; then					\
		${ECHO}  "descr ${PKGPATH} ${DESCR_SRC}"; 		\
	else								\
		${ECHO}  "descr ${PKGPATH} /dev/null";			\
	fi
	@${ECHO} "prefix ${PKGPATH} ${PREFIX}"
