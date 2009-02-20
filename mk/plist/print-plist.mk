# $LAAS: print-plist.mk 2009/02/19 11:28:45 tho $
#
# Copyright (c) 2006-2009 LAAS/CNRS
# All rights reserved.
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice,  this list of  conditions and the following disclaimer in
#      the  documentation  and/or  other   materials provided  with  the
#      distribution.
#
# THIS  SOFTWARE IS PROVIDED BY  THE  COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND  ANY  EXPRESS OR IMPLIED  WARRANTIES,  INCLUDING,  BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES  OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR  PURPOSE ARE DISCLAIMED. IN  NO EVENT SHALL THE COPYRIGHT
# HOLDERS OR      CONTRIBUTORS  BE LIABLE FOR   ANY    DIRECT, INDIRECT,
# INCIDENTAL,  SPECIAL,  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF  SUBSTITUTE GOODS OR SERVICES; LOSS
# OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR
# TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
# USE   OF THIS SOFTWARE, EVEN   IF ADVISED OF   THE POSSIBILITY OF SUCH
# DAMAGE.
#
# From $NetBSD: print-plist.mk,v 1.11 2006/11/15 10:40:34 joerg Exp $
#
#                                      Anthony Mallet on Wed Dec  6 2006
#

#
# Automatic PLIST generation
#  - files & symlinks first
#  - @dirrm statements last
#  - empty directories are handled properly
#  - substitute for platform or package specifics substrings
#
# Usage:
#  - make install
#  - make print-PLIST | brain >PLIST
#

# The following variables affect the outpout of print-PLIST:
#
#    PRINT_PLIST_IGNORE_DIRS is a list of paths that should be ignored by
#	print-PLIST.
#
#    PRINT_PLIST_FILES_CMD is a sequence of commands, terminating in a
#	semicolon, that outputs any files modified since the package was
#	extracted.
#

PRINT_PLIST_IGNORE_DIRS?=#	empty by default
PRINT_PLIST_IGNORE_DIRS+=	${PKG_DBDIR}
PRINT_PLIST_IGNORE_DIRS+=	${ROBOTPKG_DIR}

PRINT_PLIST_FILES_CMD?=		${TRUE};

# scan $PREFIX for any files/dirs modified since the package was extracted
# will emit "@exec mkdir"-statements for empty directories
# XXX will fail for data files that were copied using tar!
# XXX should check $LOCALBASE, and add @cwd statements
#

_PRINT_PLIST_FILES_CMD=	\
  ${FIND} ${PREFIX}/. -xdev -newer ${_EXTRACT_TIMESTAMP_FILE} \! -type d -print;
_PRINT_PLIST_FILES_CMD+=	${PRINT_PLIST_FILES_CMD}

_PRINT_PLIST_DIRS_CMD=	\
  ${FIND} ${PREFIX}/. -xdev -newer ${_EXTRACT_TIMESTAMP_FILE} -type d -print

_PRINT_PLIST_AWK_SUBST={
_PRINT_PLIST_AWK_SUBST+= ${PRINT_PLIST_AWK_SUBST}
_PRINT_PLIST_AWK_SUBST+= 						\
	gsub(/${NODENAME}/, "$${NODENAME}");				\
	gsub(/$(subst .,\.,${OS_VERSION})/, "$${OS_VERSION}");		\
	gsub(/${PKGNAME_NOREV}/, "$${PKGNAME}");			\
	gsub(/$(subst .,\.,${PKGVERSION_NOREV})/, "$${PKGVERSION}");	\
	gsub("^${PKGINFODIR}/", "info/");				\
	gsub("^${PKGMANDIR}/", "man/");
_PRINT_PLIST_AWK_SUBST+=}

# The awk statement that will ignore directories from PRINT_PLIST_IGNORE_DIRS
#
_PRINT_PLIST_AWK_IGNORE:=$(foreach __dir__,${PRINT_PLIST_IGNORE_DIRS},	\
  ($$0 ~ /^$(subst /,\/,$(patsubst ${PREFIX}/%,%,${__dir__}))/) {	\
	next;								\
  })


ifneq (,$(call isyes,$(LIBTOOLIZE_PLIST)))
_PRINT_PLIST_LIBTOOLIZE_FILTER?=					\
	(								\
	  if ${TEST} -d ${WRKDIR}; then					\
	  	tmpdir="${WRKDIR}";					\
	  else								\
	  	tmpdir="$${TMPDIR-/tmp}";				\
	  fi;								\
	  fileslist="$$tmpdir/print.plist.files.$$$$";			\
	  libslist="$$tmpdir/print.plist.libs.$$$$";			\
	  while read file; do						\
		case $$file in						\
		*.la)							\
			${_LIBTOOL_EXPAND} $$file >> $$libslist;	\
			;;						\
		esac;							\
		${ECHO} "$$file";					\
	  done > $$fileslist;						\
	  if ${TEST} -f "$$libslist"; then				\
	  	${GREP} -hvxF "`${SORT} -u $$libslist`" "$$fileslist";	\
	  else								\
	  	${CAT} "$$fileslist";					\
	  fi;								\
	  ${RM} -f "$$fileslist" "$$libslist";				\
	)
else
_PRINT_PLIST_LIBTOOLIZE_FILTER?=	${CAT}
endif

.PHONY: print-PLIST
print-PLIST:
	${RUN}${ECHO} '@comment '`${_CDATE_CMD}`
	${RUN}{ ${_PRINT_PLIST_FILES_CMD} }				\
	 | ${_PRINT_PLIST_LIBTOOLIZE_FILTER}				\
	 | ${AWK}  '							\
		{ sub("${PREFIX}/(\\./)?", ""); }			\
		${_PRINT_PLIST_AWK_IGNORE}	 			\
		${_PRINT_PLIST_AWK_SUBST}				\
		{ print $$0; }'						\
	 | ${SORT} -u
	${RUN}for i in `${_PRINT_PLIST_DIRS_CMD}			\
		| ${AWK} '						\
			/$(subst /,\/,${PREFIX})\/\.$$/ { next; }	\
			{ sub("${PREFIX}/\\\./", ""); }			\
			${_PRINT_PLIST_AWK_IGNORE}			\
			{ print $$0; }'					\
		| ${SORT} -r`;						\
	do								\
		if [ `${LS} -la ${PREFIX}/$$i | ${WC} -l` = 3 ]; then	\
			${ECHO} @exec \$${MKDIR} %D/$$i | ${AWK} '	\
				${PRINT_PLIST_AWK}			\
				{ print $$0; }' ;			\
		fi ;							\
		${ECHO} @dirrm $$i | ${AWK} '				\
			${PRINT_PLIST_AWK}				\
			{ print $$0; }' ;				\
	done								\
	| ${AWK} '${_PRINT_PLIST_AWK_SUBST} { print $$0; }'
