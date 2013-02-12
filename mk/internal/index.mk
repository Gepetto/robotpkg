#
# Copyright (c) 2007-2013 LAAS/CNRS
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

# transform text into html embedded string - use  as the sed delimiter (!)
override define htmlify
  ${ECHO} $1 | ${SED}						\
	-e 's&\\\&amp;g'					\
	-e 's>\\\&gt;g' -e 's<\\\&lt;g'
endef


# --- index ----------------------------------------------------------------
#
# This target is used to generate index.html files.
#
$(call require,${ROBOTPKG_DIR}/mk/fetch/fetch-vars.mk)

.PHONY: index
index: index.html

# get the template name corresponding to the current depth
ifeq (2,${_ROBOTPKG_DEPTH})
  INDEX_NAME=	${TEMPLATES}/index.pkg
else ifeq (1,${_ROBOTPKG_DEPTH})
  INDEX_NAME=	${TEMPLATES}/index.category
else ifeq (0,${_ROBOTPKG_DEPTH})
  INDEX_NAME=	${TEMPLATES}/index.all
else
  $(error "robotpkg directory not found")
endif

# --- package index.html ---------------------------------------------------
#
ifeq (2,${_ROBOTPKG_DEPTH})
  .PHONY: index.html
  .PRECIOUS: index.html
  index.html:
	${RUN}								\
	export hier=;							\
	for c in `${RECURSIVE_MAKE} -C ${ROBOTPKG_DIR} show-subdir`; do	\
	  h=' href="../../'$$c'/index.html"';				\
	  case $$c in "$(subst $! $!,"|",${CATEGORIES})")		\
	     d="${PKGPATH}"; d=$${d#$$c/};				\
	     hier=$$hier'<li class="pkgcategory"><a'$$h'>'$$c'</a>';	\
	     if ! ${TEST} "$$d" = "${PKGPATH}"; then			\
	       hier=$$hier'<ul><li>'$$d'</li></ul>';			\
	     fi;							\
	     hier=$$hier'</li>';;					\
	  *) hier=$$hier'<li><a'$$h'>'$$c'</a></li>';;			\
	  esac;								\
	done;								\
	export date="`${_CDATE_CMD}`";					\
	export comment="$$($(call htmlify,$(call quote,${COMMENT})))";	\
	export descr="`${CAT} ${DESCR_SRC}`";				\
	export homepage="$$($(call htmlify,'$(strip ${HOMEPAGE})'))";	\
	if ${TEST} -n "$$homepage"; then				\
	  homepage="<a href=\"$$homepage\">$$homepage</a>";		\
	else								\
	  homepage='(none)';						\
	fi;								\
	export license="`$(call htmlify,'$(strip ${LICENSE})')`";	\
	if ${TEST} -n "$$license"; then					\
	  license="<a href=\"../../licenses/${LICENSE}\">$$license</a>";\
	else								\
	  license='(none)';						\
	fi;								\
	export distfiles=;						\
  $(foreach _,${DISTFILES},						\
    $(foreach -,$(addsuffix $_,${SITES.$(notdir $_)}),			\
	distfiles=$$distfiles'<dt><a href="$-">$-</a></dt>';))		\
	distfiles=$${distfiles:='(none)'};				\
									\
	export bdep=; export rdep=;					\
	sep=", ";							\
  $(foreach _,$(sort ${DEPEND_USE}),					\
	pkg='${DEPEND_ABI.$_}';						\
    $(if ${DEPEND_DIR.$_},						\
	html='<a href="${DEPEND_DIR.$_}/index.html">'$$pkg'</a>';,	\
	html="$$pkg";)							\
    $(if $(filter full,${DEPEND_METHOD.$_}),				\
	rdep=$$rdep$${rdep:+$$sep}$$html;,				\
	bdep=$$bdep$${bdep:+$$sep}$$html;))				\
	rdep=$${rdep:='(none)'};					\
	bdep=$${bdep:='(none)'};					\
									\
	export opts=;							\
  $(if $(strip ${PKG_GENERAL_OPTIONS}),					\
	opts=$$opts'<dt>General options:</dt><dd><dl class=options>';	\
    $(foreach _, $(sort ${PKG_GENERAL_OPTIONS}),			\
	opts=$$opts'<dt>$_</dt><dd>${PKG_OPTION_DESCR.$_}</dd>';)	\
	opts=$$opts'</dl></dd>';)					\
  $(foreach -, ${PKG_OPTIONS_REQUIRED_GROUPS},				\
	opts=$$opts'<dt>$- options:</dt><dd><dl class=options>';	\
    $(foreach _, ${PKG_OPTIONS_GROUP.$-},				\
	opts=$$opts'<dt>$_</dt><dd>${PKG_OPTION_DESCR.$_}</dd>';)	\
	opts=$$opts'</dl></dd>';)					\
  $(foreach -, ${PKG_OPTIONS_OPTIONAL_GROUPS},				\
	opts=$$opts'<dt>$- options:</dt><dd><dl class=options>';	\
    $(foreach _, ${PKG_OPTIONS_GROUP.$-},				\
	opts=$$opts'<dt>$_</dt><dd>${PKG_OPTION_DESCR.$_}</dd>';)	\
	opts=$$opts'</dl></dd>';)					\
  $(foreach -, ${PKG_OPTIONS_NONEMPTY_SETS},				\
	opts=$$opts'<dt>$- options:</td><dd><dl class=options>';	\
    $(foreach _, ${PKG_OPTIONS_SET.$-},					\
	opts=$$opts'<dt>$_</dt><dd>${PKG_OPTION_DESCR.$_}</dd>';)	\
	opts=$$opts'</dl></dd>';)					\
  $(foreach -,${PKG_ALTERNATIVES},$(if ${PKG_ALTERNATIVES.$-},		\
	opts=$$opts'<dt>$- alternatives:</td><dd><dl class=options>';	\
    $(foreach _,${PKG_ALTERNATIVES.$-},					\
      $(if $(strip ${PKG_ALTERNATIVE_SELECT.$_}),			\
	opts=$$opts'<dt>$_</dt><dd>${PKG_ALTERNATIVE_DESCR.$_}</dd>';))	\
	opts=$$opts'</dl></dd>';))					\
									\
	${AWK} '{							\
	  gsub(/@PKGPATH@/, "${PKGPATH}");				\
	  gsub(/@PKGNAME@/, "${PKGNAME_NOTAG}");			\
	  gsub(/@COMMENT@/, ENVIRON["comment"]);			\
	  gsub(/@HOMEPAGE@/, ENVIRON["homepage"]);			\
	  gsub(/@LICENSE@/, ENVIRON["license"]);			\
	  gsub(/@DISTFILES@/, ENVIRON["distfiles"]);			\
	  gsub(/@RUN_DEPENDS@/, ENVIRON["rdep"]);			\
	  gsub(/@BUILD_DEPENDS@/, ENVIRON["bdep"]);			\
	  gsub(/@DESCR@/, ENVIRON["descr"]);				\
	  gsub(/@OPTIONS@/, ENVIRON["opts"]);				\
	  gsub(/@HIER@/, ENVIRON["hier"]);				\
	  gsub(/@DATE@/, ENVIRON["date"]);				\
	  print;							\
	}' <${INDEX_NAME} >$@.tmp;					\
	if ${TEST} -f $@ && ${CMP} -s $@.tmp $@; then			\
	  ${RM} $@.tmp;							\
	else								\
	  ${ECHO_MSG} "Creating index.html for ${PKGPATH}";		\
	  ${MV} $@.tmp $@;						\
	fi
endif

# --- category index.html --------------------------------------------------
#
# There is a tricky part for invoking only one sub make for each package.
# The sub make is invoked for rebuilding a pkg index and printing a few package
# variables (name and comment). It is piped into a read loop that either print
# informative lines on fd#9 (dupped to stdout) or variables value to fd#1. This
# loop is itself placed inside a backquote so that fd#1 can be eval'ed in the
# current shell while fd#9 goes unfiltered to stdout.
#
ifeq (1,${_ROBOTPKG_DEPTH})
  .PHONY: index.html
  .PRECIOUS: index.html
  index.html:
	@${PHASE_MSG} "Updating index for $(notdir ${CURDIR})"
	${RUN}								\
	export hier=;							\
	cat='$(notdir ${CURDIR})';					\
	for c in `${RECURSIVE_MAKE} -C ${ROBOTPKG_DIR} show-subdir`; do	\
	  h=' href="../'$$c'/index.html"';				\
	  case $$c in "$$cat")						\
	     hier=$$hier'<li class="pkgcategory">'$$c'</li>';;		\
	  *) hier=$$hier'<li><a'$$h'>'$$c'</a></li>';;			\
	  esac;								\
	done;								\
	export date="`${_CDATE_CMD}`";					\
	export comment="$$($(call htmlify,$(call quote,${COMMENT})))";	\
									\
	submake() {							\
	  ${RECURSIVE_MAKE} EXPECT_TARGETS='fetch install'		\
	    -C "$$subdir" index print-vars				\
	    VARNAMES="PKGNAME_NOTAG COMMENT" | while read l; do		\
	      case "$$l" in						\
	        'PKGNAME_NOTAG|'*|'COMMENT|'*)				\
	          ${ECHO} "$$l" | ${SED}				\
	            -e "s/'/'\"'\"'/g;s/|/='/;s/$$/'/;s/[*]/\*/g";;	\
	        *) ${ECHO} "$$l" >&9;;					\
	      esac;							\
	    done;							\
	};								\
									\
	exec 9>&1; export pkgs=;					\
	for subdir in ${SUBDIR} ""; do					\
	  ${TEST} -n "$$subdir" || continue;				\
	  eval "`submake`";						\
  $(if ${print-index-data},${ECHO}					\
	    'INDEX|'$$cat'|'$$subdir'|'$$PKGNAME_NOTAG'|'$$COMMENT;)	\
	  pkg="$$($(call htmlify,$$PKGNAME_NOTAG))";			\
	  pkg='<a href="'$$subdir'/index.html">'$$pkg'</a>';		\
	  cmt="$$($(call htmlify,$$COMMENT))";				\
	  pkgs=$$pkgs'<tr><td>'$$pkg'</td><td>'$$cmt'</td></tr>';	\
	done;								\
	exec 9>&-;							\
									\
	${AWK} '{							\
	  gsub(/@CATEGORY@/, "$(notdir ${CURDIR})");			\
	  gsub(/@COMMENT@/, ENVIRON["comment"]);			\
	  gsub(/@COMMENT@/, ENVIRON["comment"]);			\
	  gsub(/@PKGS@/, ENVIRON["pkgs"]);				\
	  gsub(/@HIER@/, ENVIRON["hier"]);				\
	  gsub(/@DATE@/, ENVIRON["date"]);				\
	  print;							\
	}' <${INDEX_NAME} >$@.tmp;					\
	if ${TEST} -f $@ && ${CMP} -s $@.tmp $@; then			\
	  ${RM} $@.tmp;							\
	else								\
	  ${ECHO_MSG} "Creating index.html for $(notdir ${CURDIR})";	\
	  ${MV} $@.tmp $@;						\
	fi
endif

# --- toplevel index -------------------------------------------------------
#
# Generate list of all packages by extracting information from the
# category/index.html pages.
#
ifeq (0,${_ROBOTPKG_DEPTH})
  .PHONY: index.html
  .PRECIOUS: index.html
  index.html:
	@${PHASE_MSG} "Updating index for robotpkg"
	${RUN} ${TEST} -t 1 && echo='ECHO_MSG=${ECHO}';			\
	export hier=;							\
	for subdir in ${SUBDIR} ""; do					\
	  ${TEST} -n "$$subdir" || continue;				\
	  hier=$$hier'<li>';						\
	  hier=$$hier'<a href="'$$subdir'/index.html">'$$subdir'</a>';	\
	  hier=$$hier'</li>';						\
	done;								\
	export date="`${_CDATE_CMD}`";					\
									\
	exec 9>&1;							\
	for subdir in ${SUBDIR} ""; do					\
	  ${TEST} -n "$$subdir" || continue;				\
	  ${RECURSIVE_MAKE} $$echo					\
	    -C "$$subdir" index print-index-data=yes |			\
	  while read l; do						\
	    case "$$l" in						\
	      'INDEX|'*) ${ECHO} "$${l#INDEX|}";;			\
	      *) ${ECHO} "$$l" >&9;;					\
	    esac;							\
	  done;								\
	done | ${SORT} -f -t '|' -k 2 | ${AWK} '			\
	NR == FNR {							\
	  split($$0, p, "|"); cat=p[1] "/" p[2];			\
	  pkgs=pkgs "<tr><td>";						\
	  pkgs=pkgs "<a href=\"" p[1] "/index.html\">" p[1] "</a>";	\
	  pkgs=pkgs "</td><td>";					\
	  pkgs=pkgs "<a href=\"" cat "/index.html\">" p[3] "</a>";	\
	  pkgs=pkgs "</td><td>" p[4] "</td></tr>";			\
	  npkgs++;							\
	  next;								\
	}								\
	{								\
	  gsub(/@NPKGS@/, npkgs);					\
	  gsub(/@PKGS@/, pkgs);						\
	  gsub(/@HIER@/, ENVIRON["hier"]);				\
	  gsub(/@DATE@/, ENVIRON["date"]);				\
	  print;							\
	}' - ${INDEX_NAME} >$@.tmp;					\
	if ${TEST} -f $@ && ${CMP} -s $@.tmp $@; then			\
	  ${RM} $@.tmp;							\
	else								\
	  ${ECHO_MSG} "Creating toplevel index.html";			\
	  ${MV} $@.tmp $@;						\
	fi


# hl() { echo '<a href="'$$1'/index.html">'$$1'</a>'; };		\
	# for category in ${SUBDIR} ""; do 				\
	# 	if [ "X$$category" = "X" ]; then continue; fi; 		\
	# 	if [ -f $${category}/index.html ]; then 		\
	# 		${ECHO} "processing $${category}"; 		\
	# 		${SED} -n $(join ,'/^<tr>/{			\
	# 			s!href="!&'$${category}'/!;		\
	# 			s!</a>:!&<td>('"`hl $${category}`"')!;	\
	# 			s!<tr>!<tr valign=top>!;		\
	# 			s!<td valign=top>!<td>!;		\
	# 		p;}') <$${category}/index.html >>$@.new;	\
	# 	fi; 							\
	# done;								\
	# if [ ! -f $@.new ]; then 					\
	# 	${ERROR_MSG} ${hline};					\
	# 	${ERROR_MSG} "There are no categories with index.html"	\
	# 		"files available."; 				\
	# 	${ERROR_MSG} "You need to run \`${MAKE} index' to"	\
	# 		"generate them before running this target."; 	\
	# 	${FALSE}; 						\
	# fi;								\
	# ${SORT} -f -t '>' -k 4,4 <$@.new >$@.newsorted;			\
	# ${AWK} '{ ++n } END { print n }' <$@.newsorted >$@.npkgs;	\
	# ${SED} 	-e '/%%NPKGS%%/r$@.npkgs' 				\
	# 	-e '/%%NPKGS%%/d' 					\
	# 	-e '/%%PKGS%%/r$@.newsorted' 				\
	# 	-e '/%%PKGS%%/d' 					\
	# 	<${TEMPLATES}/index.all >$@.tmp;			\
	# if [ -f $@ ] && ${CMP} -s $@.tmp $@; then 			\
	# 	${RM} $@.tmp; 						\
	# else 								\
	# 	${ECHO_MSG} "creating index-all.html";			\
	# 	${MV} $@.tmp $@;					\
	# fi;								\
	# ${RM} -f $@.tmp $@.npkgs $@.new $@.newsorted
endif


# --- print-summary-data ---------------------------------------------------
#
# This target is used by the toplevel.mk file to generate pkg database file
#
ifeq (2,${_ROBOTPKG_DEPTH})
  .PHONY: print-summary-data
  print-summary-data:
	${RUN}								\
	${ECHO} index ${PKGPATH} ${PKGBASE};				\
	${ECHO} version ${PKGPATH} ${PKGVERSION};			\
	${ECHO} wildcard ${PKGPATH} $(call quote,${PKGWILDCARD});	\
	${ECHO} comment ${PKGPATH} $(call quote,${COMMENT});		\
	${ECHO} categories ${PKGPATH} ${CATEGORIES};			\
	${ECHO} homepage ${PKGPATH} $(call quote,${HOMEPAGE});		\
	${ECHO} distfiles ${PKGPATH} $(call quote,${DISTFILES});	\
	${ECHO} mastersites ${PKGPATH} $(call quote,${MASTER_SITES});	\
	${ECHO} masterrepository ${PKGPATH}				\
		$(call quote,${MASTER_REPOSITORY});			\
	${ECHO} maintainer ${PKGPATH} ${MAINTAINER};			\
	${ECHO} license ${PKGPATH} $(call quote,${LICENSE});		\
	${ECHO} depends ${PKGPATH} $(foreach _pkg_,${DEPEND_USE},	\
	  $(if $(filter full,${DEPEND_METHOD.${_pkg_}}),		\
	    $(call quote,${DEPEND_ABI.${_pkg_}}:${DEPEND_DIR.${_pkg_}})	\
	));								\
	${ECHO} build_depends ${PKGPATH} $(foreach _pkg_,${DEPEND_USE},	\
	  $(if $(filter build,${DEPEND_METHOD.${_pkg_}}),		\
	    $(call quote,${DEPEND_ABI.${_pkg_}}:${DEPEND_DIR.${_pkg_}})	\
	));								\
	${ECHO} conflicts ${PKGPATH} $(call quote,${CONFLICTS});	\
	${ECHO} onlyfor ${PKGPATH} $(call quote,${ONLY_FOR_PLATFORM});	\
	${ECHO} notfor ${PKGPATH} $(call quote,${NOT_FOR_PLATFORM});	\
	if [ -f ${DESCR_SRC} ]; then					\
	  ${ECHO}  descr ${PKGPATH} ${DESCR_SRC}; 			\
	else								\
	  ${ECHO}  descr ${PKGPATH} /dev/null;				\
	fi;								\
	${ECHO} prefix ${PKGPATH} ${PREFIX}
endif
