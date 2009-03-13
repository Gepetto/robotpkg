# $LAAS: index.mk 2009/03/05 22:57:28 tho $
#
# Copyright (c) 2007-2009 LAAS/CNRS
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

# This Makefile fragment is included by robotpkg.mk and encapsulates the
# code to produce index.html files in each package directory.
#
# The following are the "public" targets provided by this module.
#
#    index		This target generates an index.html file suitable
#			for being served via HTTP.
#
# The following are the user-settable variables that may be defined in
# robotpkg.conf.
#
#    PKG_URL_HOST is the host portion of the URL to embed in each
#	index.html file to be served via FTP or HTTP, and defaults to
#	"http://softs.laas.fr".
#
#    PKG_URL_DIR is the directory portion of the URL to embed in each
#	index.html file to be served via FTP, and defaults to
#	"/openrobots/robotpkg/packages".

PKG_URL_HOST?=	http://softs.laas.fr
PKG_URL_DIR?=	/openrobots/robotpkg/packages

PKG_URL=	${PKG_URL_HOST}${PKG_URL_DIR}

HTMLIFY=	${SED} -e 's/&/\&amp;/g' -e 's/>/\&gt;/g' -e 's/</\&lt;/g'
HTML_HOMEPAGE=	$(if ${HOMEPAGE},<a href="${HOMEPAGE}">${HOMEPAGE}</a>,(none))
HTML_LICENSE=	$(if ${LICENSE},<tr><td>License:<td>${LICENSE})


# --- index ----------------------------------------------------------------
#
# This target is used to generate index.html files.
#
.PHONY: index
index: interactive index.html

# get the template name corresponding to the current depth
ifeq (2,${_ROBOTPKG_DEPTH})
  INDEX_NAME=	${TEMPLATES}/index.pkg
else ifeq (1,${_ROBOTPKG_DEPTH})
  INDEX_NAME=	${TEMPLATES}/index.category
else ifeq (0,${_ROBOTPKG_DEPTH})
  INDEX_NAME=	${TEMPLATES}/index.top
else
  $(error "robotpkg directory not found")
endif

.PHONY: index.html
.PRECIOUS: index.html
index.html:
ifeq (2,${_ROBOTPKG_DEPTH})
  # package index.html
	@>$@.bdep; >$@.rdep; bdep=; rdep=;				\
${foreach _d_,$(sort ${DEPEND_USE}),					\
	pkg='${DEPEND_ABI.${_d_}}';					\
	if test "${DEPEND_DIR.${_d_}}"; then				\
		html='<a href="${DEPEND_DIR.${_d_}}/index.html">';	\
		html="$${html}$${pkg}"'</a>';				\
	else								\
		html="$${pkg}";						\
	fi;								\
	case "${DEPEND_METHOD.${_d_}}" in				\
		build)							\
			${ECHO}	$${bdep} $${html} >>$@.bdep;		\
			bdep=';';;					\
		full)							\
			${ECHO}	$${rdep} $${html} >>$@.rdep;		\
			rdep=';';;					\
	esac;								\
}									\
	${SED} <${DESCR_SRC} -e 's/^$$/<p>/g' >$@.descr;		\
	${ECHO} $(call quote,${COMMENT}) | ${HTMLIFY} > $@.comment;	\
	${SED} <${INDEX_NAME}						\
		-e 's!%%PORT%%!${PKGPATH}!g' 				\
		-e '/%%COMMENT%%/r$@.comment' 				\
		-e '/%%COMMENT%%/d' 					\
		-e 's!%%PKG%%!${PKGNAME}!g'				\
		-e 's!%%HOMEPAGE%%!${HTML_HOMEPAGE}!g'			\
		-e 's!%%LICENSE%%!${HTML_LICENSE}!g'			\
		-e '/%%DESCR%%/r$@.descr'				\
		-e '/%%DESCR%%/d' 					\
		-e '/%%BUILD_DEPENDS%%/r$@.bdep'			\
		-e '/%%BUILD_DEPENDS%%/d'				\
		-e '/%%RUN_DEPENDS%%/r$@.rdep'				\
		-e '/%%RUN_DEPENDS%%/d'					\
		-e 's!%%BIN_PKGS%%!(none)!g'				\
		> $@.tmp;						\
	if [ -f $@ ] && ${CMP} -s $@.tmp $@; then 			\
		${RM} $@.tmp; 						\
	else 								\
		${ECHO_MSG} "creating index.html for ${PKGPATH}";	\
		${MV} $@.tmp $@;					\
	fi;								\
	${RM} -f $@.tmp $@.bdep $@.rdep $@.descr $@.comment
else
  # category or top-level index.html
	@${PHASE_MSG} "Updating index.html files" 			\
		$(if $(filter 1,${_ROBOTPKG_DEPTH}),			\
			"for $(notdir ${CURDIR})")
	@> $@.tmp; for entry in ${SUBDIR}; do 				\
	${ECHO} '<tr><td valign=top>'					\
		'<a href="'$${entry}/index.html'">'			\
$(if $(filter 0,${_ROBOTPKG_DEPTH}),					\
		`${ECHO} $${entry} | ${HTMLIFY}`,			\
		`cd $${entry} && 					\
			${RECURSIVE_MAKE} show-var VARNAME=PKGNAME |	\
			${HTMLIFY}` 					\
)									\
		'</a>:<td>'						\
		`cd $${entry} && ${RECURSIVE_MAKE} show-comment |	\
			${HTMLIFY}` >>$@.tmp; 				\
	done;								\
	${SORT} -t '>' -k 3,4 $@.tmp > $@.tmp2;				\
	${SED} <${INDEX_NAME}						\
		-e 's/%%CATEGORY%%/$(notdir ${CURDIR})/g' 		\
		-e 's/%%NUMITEMS%%/$(words ${SUBDIR})/g'		\
		-e '/%%NUMITEMS%%/d' 					\
		-e '/%%DESCR%%/d' 					\
		-e '/%%SUBDIR%%/r$@.tmp2'				\
		-e '/%%SUBDIR%%/d' 					\
		> $@.tmp3;						\
	if [ -f $@ ] && ${CMP} -s $@.tmp3 $@; then 			\
		${RM} $@.tmp3; 						\
	else 								\
		${ECHO_MSG} "creating index.html for"			\
			"$(notdir ${CURDIR})";				\
		${MV} $@.tmp3 $@;					\
	fi;								\
	${RM} -f $@.tmp $@.tmp2 $@.tmp3;				\
	for subdir in ${SUBDIR} ""; do					\
		if [ "X$$subdir" = "X" ]; then continue; fi;		\
		(cd $${subdir} && ${RECURSIVE_MAKE} index);		\
	done
endif

# --- index-all ------------------------------------------------------------
#
# Generate list of all packages by extracting information from the
# category/index.html pages
#
ifeq (0,${_ROBOTPKG_DEPTH})
  index: index-all

  .PHONY: index-all
  index-all: index-all.html

  .PHONY: index-all.html
  .PRECIOUS: index-all.html
  index-all.html:
	@${RM} -f $@.new $@.newsorted;					\
	${PHASE_MSG} "Processing categories for $@";			\
	hl() { echo '<a href="'$$1'/index.html">'$$1'</a>'; };		\
	for category in ${SUBDIR} ""; do 				\
		if [ "X$$category" = "X" ]; then continue; fi; 		\
		if [ -f $${category}/index.html ]; then 		\
			${ECHO} "processing $${category}"; 		\
			${SED} -n $(join ,'/^<tr>/{			\
				s!href="!&'$${category}'/!;		\
				s!</a>:!&<td>('"`hl $${category}`"')!;	\
				s!<tr>!<tr valign=top>!;		\
				s!<td valign=top>!<td>!;		\
			p;}') <$${category}/index.html >>$@.new;	\
		fi; 							\
	done;								\
	if [ ! -f $@.new ]; then 					\
		${ERROR_MSG} ${hline};					\
		${ERROR_MSG} "There are no categories with index.html"	\
			"files available."; 				\
		${ERROR_MSG} "You need to run \`${MAKE} index' to"	\
			"generate them before running this target."; 	\
		${FALSE}; 						\
	fi;								\
	${SORT} -f -t '>' -k 4,4 <$@.new >$@.newsorted;			\
	${AWK} '{ ++n } END { print n }' <$@.newsorted >$@.npkgs;	\
	${SED} 	-e '/%%NPKGS%%/r$@.npkgs' 				\
		-e '/%%NPKGS%%/d' 					\
		-e '/%%PKGS%%/r$@.newsorted' 				\
		-e '/%%PKGS%%/d' 					\
		<${TEMPLATES}/index.all >$@.tmp;			\
	if [ -f $@ ] && ${CMP} -s $@.tmp $@; then 			\
		${RM} $@.tmp; 						\
	else 								\
		${ECHO_MSG} "creating index-all.html";			\
		${MV} $@.tmp $@;					\
	fi;								\
	${RM} -f $@.tmp $@.npkgs $@.new $@.newsorted
endif


# This target is used by the toplevel.mk file to generate pkg database file
.PHONY: print-summary-data
print-summary-data:
	@${ECHO} depends ${PKGPATH} $(call quote,${DEPENDS});		\
	${ECHO} build_depends ${PKGPATH} $(call quote,${BUILD_DEPENDS});\
	${ECHO} conflicts ${PKGPATH} ${CONFLICTS};			\
	${ECHO} index ${PKGPATH} ${PKGNAME};				\
	${ECHO} htmlname ${PKGPATH}					\
		'<a href="../../'`${ECHO} ${PKGPATH} | ${HTMLIFY}`'/index.html">'`${ECHO} ${PKGNAME} | ${HTMLIFY}`'</a>';					\
	${ECHO} homepage ${PKGPATH} $(call quote,${HOMEPAGE});		\
	${ECHO} wildcard ${PKGPATH} $(call quote,${PKGWILDCARD});	\
	${ECHO} comment ${PKGPATH} $(call quote,${COMMENT});		\
	${ECHO} license ${PKGPATH} $(call quote,${LICENSE});		\
	if [ "${ONLY_FOR_PLATFORM}" = "" ]; then			\
		${ECHO} "onlyfor ${PKGPATH} any";			\
	else								\
		${ECHO} "onlyfor ${PKGPATH} ${ONLY_FOR_PLATFORM}";	\
	fi;								\
	if [ "${NOT_FOR_PLATFORM}" = "" ]; then				\
		${ECHO} "notfor ${PKGPATH} any";			\
	else								\
		${ECHO} "notfor ${PKGPATH} not ${NOT_FOR_PLATFORM}";	\
	fi;								\
	${ECHO} "maintainer ${PKGPATH} ${MAINTAINER}";			\
	${ECHO} "categories ${PKGPATH} ${CATEGORIES}";			\
	if [ -f ${DESCR_SRC} ]; then					\
		${ECHO}  "descr ${PKGPATH} ${DESCR_SRC}"; 		\
	else								\
		${ECHO}  "descr ${PKGPATH} /dev/null";			\
	fi;								\
	${ECHO} "prefix ${PKGPATH} ${PREFIX}"
