# $NetBSD: print-plist.mk,v 1.11 2006/11/15 10:40:34 joerg Exp $

###
### Automatic PLIST generation
###  - files & symlinks first
###  - @dirrm statements last
###  - empty directories are handled properly
###  - substitute for platform or package specifics substrings
###
### Usage:
###  - make install
###  - make print-PLIST | brain >PLIST
###

#_PRINT_PLIST_AWK_SUBST={						\
#	gsub(/${OPSYS}/, "$${OPSYS}");					\
#	gsub(/$(subst .,\.,${OS_VERSION})/, "$${OS_VERSION}");		\
#	gsub(/${MACHINE_GNU_PLATFORM}/, "$${MACHINE_GNU_PLATFORM}");	\
#	gsub(/${MACHINE_ARCH}/, "$${MACHINE_ARCH}");			\
#	gsub(/${MACHINE_GNU_ARCH}/, "$${MACHINE_GNU_ARCH}");		\
#	gsub(/$(subst .,\.,${LOWER_OS_VERSION})/, "$${LOWER_OS_VERSION}");	\
#	gsub(/${LOWER_OPSYS}/, "$${LOWER_OPSYS}");
_PRINT_PLIST_AWK_SUBST+= {						\
	gsub(/${PKGNAME_NOREV}/, "$${PKGNAME}");			\
	gsub(/$(subst .,\.,$(shell echo ${PKGVERSION} | ${SED} -e 's/r[0-9]*$$//'))/, "$${PKGVERSION}");\
	gsub("^${PKGINFODIR}/", "info/");				\
	gsub("^${PKGMANDIR}/", "man/");					\
}

_PRINT_PLIST_AWK_IGNORE=	($$0 ~ /^$(subst /,\/,$(patsubst ${PREFIX}/%,%,${PKG_DBDIR}))\//)
_PRINT_PLIST_AWK_IGNORE+=	|| ($$0 ~ /^$(subst /,\/,${PKGSRCDIR})\//)
#ifdef INFO_FILES
#_PRINT_PLIST_AWK_IGNORE+=	|| ($$0 ~ /^${PKGINFODIR:S|/|\\/|g}\/[^\/]+(-[0-9]+)(\.gz)?$$/)
#_PRINT_PLIST_AWK_IGNORE+=	|| ($$0 ~ /^([^\/]*\/)*(info\/[^\/]+|[^\/]+\.info)(-[0-9]+)(\.gz)?$$/)
#endif

# scan $PREFIX for any files/dirs modified since the package was extracted
# will emit "@exec mkdir"-statements for empty directories
# XXX will fail for data files that were copied using tar (e.g. emacs)!
# XXX should check $LOCALBASE, and add @cwd statements

_PRINT_PLIST_FILES_CMD=	\
	${FIND} ${PREFIX}/. -xdev -newer ${_COOKIE.extract} \! -type d -print
_PRINT_PLIST_DIRS_CMD=	\
	${FIND} ${PREFIX}/. -xdev -newer ${_COOKIE.extract} -type d -print

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
	${_PKG_SILENT}${_PKG_DEBUG}\
	${ECHO} '@comment $$'NetBSD'$$'
	${_PKG_SILENT}${_PKG_DEBUG}\
	${_PRINT_PLIST_FILES_CMD}					\
	 | ${_PRINT_PLIST_LIBTOOLIZE_FILTER}				\
	 | ${SORT}							\
	 | ${AWK} '							\
		{ sub("${PREFIX}/\\./", ""); }				\
		${_PRINT_PLIST_AWK_IGNORE} { next; } 			\
		${PRINT_PLIST_AWK}					\
		${_PRINT_PLIST_AWK_SUBST}				\
		{ print $$0; }'
	${_PKG_SILENT}${_PKG_DEBUG}\
	for i in `${_PRINT_PLIST_DIRS_CMD}				\
			| ${SORT} -r					\
			| ${AWK} '					\
				/$(subst /,\/,${PREFIX})\/\.$$/ { next; }	\
				/$(subst /,\/,${PKG_DBDIR})\// { next; }	\
				{ sub("${PREFIX}/\\\\./", ""); }	\
				{ sub("^${PKGINFODIR}/", "info/"); }	\
				{ sub("^${PKGMANDIR}/", "man/"); }	\
				/^$(subst /,\/,$(patsubst ${PREFIX}/%,%,${PKG_DBDIR}))(\/|$$)/ { next; } \
				{ print $$0; }'` ;\
	do								\
		if [ `${LS} -la ${PREFIX}/$$i | ${WC} -l` = 3 ]; then	\
			${ECHO} @exec \$${MKDIR} %D/$$i | ${AWK} '	\
			${PRINT_PLIST_AWK}				\
			{ print $$0; }' ;				\
		fi ;							\
		${ECHO} @dirrm $$i | ${AWK} '				\
			${PRINT_PLIST_AWK}				\
			{ print $$0; }' ;				\
	done								\
	| ${AWK} '${_PRINT_PLIST_AWK_SUBST} { print $$0; }'
