#
# Copyright (c) 2006-2009,2011-2012 LAAS/CNRS
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
#  - empty directories are handled properly
#  - substitute for platform or package specifics substrings
#
# Usage:
#  - make install
#  - make print-PLIST
#  - cat PLIST.guess | brain >PLIST
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
#    PRINT_PLIST_FILTER is a sequence of commands, terminating in a
#	semicolon, that receives the generated PLIST on stdin and is expected
#	to output the final PLIST (default: cat).
#
$(call require,${ROBOTPKG_DIR}/mk/build/build-vars.mk)

PRINT_PLIST_FILE?=		${PKGDIR}/PLIST.guess
PRINT_PLIST_IGNORE_DIRS+=	${DYNAMIC_PLIST_DIRS}
PRINT_PLIST_FILES_CMD?=		${TRUE};

PRINT_PLIST_FILTER?=		${CAT};


# Scan $PREFIX for any files/dirs that do not belong to any package.
#
_PRINT_PLIST_FILES_CMD=	\
  ${FIND} $(abspath ${PREFIX}) -xdev -ctime -1 ! -type d ! \(	\
	-path '${MAKECONF}' -o -path '${ROBOTPKG_DIR}/*' -o	\
	-path '${PKG_DBDIR}/*'					\
  \) ! -exec ${PKG_INFO} -qFe {} 2>/dev/null \; -print;
_PRINT_PLIST_FILES_CMD+= { ${PKG_INFO} -qL ${PKGNAME} 2>/dev/null||:;};
_PRINT_PLIST_FILES_CMD+= ${PRINT_PLIST_FILES_CMD}

_PRINT_PLIST_DIRS_CMD=	\
  ${FIND} $(abspath ${PREFIX}) -xdev -ctime -1 -type d -empty ! \(	\
	-path '${MAKECONF}' -o -path '${ROBOTPKG_DIR}/*' -o	\
	-path '${PKG_DBDIR}/*'					\
  \) -print;


# Perform substitutions
#
_PRINT_PLIST_AWK_SUBST={
_PRINT_PLIST_AWK_SUBST+= ${PRINT_PLIST_AWK_SUBST}
_PRINT_PLIST_AWK_SUBST+=						\
	gsub(/${NODENAME}/, "$${NODENAME}");				\
	gsub(/$(subst .,\.,${OS_VERSION})/, "$${OS_VERSION}");		\
	gsub(/$(subst .,\.,${OS_KERNEL_VERSION})/,			\
					"$${OS_KERNEL_VERSION}");	\
	gsub(/${PKGNAME_NOREV}/, "$${PKGNAME}");			\
	gsub(/$(subst .,\.,${PKGVERSION_NOREV})/, "$${PKGVERSION}");	\
	gsub("^${PKGINFODIR}/", "$${PKGINFODIR}/");			\
	gsub("^${PKGMANDIR}/", "$${PKGMANDIR}/");
_PRINT_PLIST_AWK_SUBST+=}


# The awk statement that will ignore directories from PRINT_PLIST_IGNORE_DIRS
#
_PRINT_PLIST_AWK_IGNORE:=$(foreach __dir__,				\
  $(patsubst $(abspath ${PREFIX})/%,%,${PRINT_PLIST_IGNORE_DIRS}),	\
  ($$0 ~ /^$(subst /,\/,${__dir__})/) { next; })


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

do-print-PLIST: print-PLIST-message
	${RUN} exec >${PRINT_PLIST_FILE};				\
	${ECHO} '@comment '`${_CDATE_CMD}`;				\
	{ ${_PRINT_PLIST_FILES_CMD} }					\
	 | ${_PRINT_PLIST_LIBTOOLIZE_FILTER}				\
	 | ${SORT} -u							\
	 | ${AWK}  '							\
		{ sub("^$(abspath ${PREFIX})/+", ""); }			\
		${_PRINT_PLIST_AWK_IGNORE}				\
		${_PRINT_PLIST_AWK_SUBST}				\
		{ print $$0; }'						\
	 | { ${PRINT_PLIST_FILTER} };					\
	{ ${_PRINT_PLIST_DIRS_CMD} }					\
	  | ${SORT} -r							\
	  | ${AWK} '							\
		{ sub("^$(abspath ${PREFIX})/+", ""); }			\
		/^$$/ { next; }						\
		${_PRINT_PLIST_AWK_IGNORE}				\
		${_PRINT_PLIST_AWK_SUBST}				\
		{ print "@pkgdir " $$0; }'
	@${STEP_MSG} "Created ${PRINT_PLIST_FILE}"


.PHONY: print-PLIST-message
print-PLIST-message:
	@${PHASE_MSG} "Generating PLIST";				\
	${ECHO_MSG} '... this may take a long time'
