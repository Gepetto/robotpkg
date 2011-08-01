#
# Copyright (c) 2011 LAAS/CNRS
# All rights reserved.
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without   fee is hereby granted, provided   that the above  copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS  SOFTWARE INCLUDING ALL  IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR  BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR  ANY DAMAGES WHATSOEVER RESULTING  FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION,   ARISING OUT OF OR IN    CONNECTION WITH THE USE   OR
# PERFORMANCE OF THIS SOFTWARE.
#
#                                            Anthony Mallet on Mon Aug  1 2011
#

$(call require, ${ROBOTPKG_DIR}/mk/depends/depends-vars.mk)


# --- print-depends (PRIVATE) ----------------------------------------------

# List the direct dependencies and check if they are installed

.PHONY: print-depends
print-depends: $(call add-barrier, bootstrap-depends, print-depends)
print-depends: print-depends-full

_chkdep_type=			full build bootstrap

_chkdep_filter.full=		full build bootstrap
_chkdep_filter.build=		build bootstrap
_chkdep_filter.bootstrap=	bootstrap

print-depends-build: $(call add-barrier, bootstrap-depends, print-depends-build)
print-depends-full: $(call add-barrier, bootstrap-depends, print-depends-full)

$(addprefix print-depends-,${_chkdep_type}): print-depends-%: .FORCE
	${RUN}								\
  $(foreach _pkg_,${DEPEND_USE},					\
    $(if $(filter ${_chkdep_filter.$*},${DEPEND_METHOD.${_pkg_}}),	\
      $(if $(filter robotpkg,${PREFER.${_pkg_}}),			\
	  ${_PKG_BEST_EXISTS} '${DEPEND_ABI.${_pkg_}}' | ${AWK}		\
	    'BEGIN { pkg="-" } NR==1 { pkg=$$0 } END {			\
		printf("print-depends|robotpkg|%s|%s|%s\n",		\
		  "${DEPEND_ABI.${_pkg_}}", pkg,			\
		  "${DEPEND_DIR.${_pkg_}}")}';				\
	,								\
	{ exec 9>&1; ${_PREFIXSEARCH_CMD}				\
	     -p $(call quote,$(or ${PREFIX.${_pkg_}},${SYSTEM_PREFIX}))	\
		$(call quote,${_pkg_})					\
		$(call quote,${DEPEND_ABI.${_pkg_}})			\
		${SYSTEM_SEARCH.${_pkg_}} 2>&1 1>&9 | ${WARNING_CAT};	\
	} | ${AWK}							\
	    -v pkg="-" -v prefix=$(call quote,$(strip			\
		$(or ${SYSTEM_PKG.${OPSYS}-${OPSUBSYS}.${_pkg_}},	\
		     ${SYSTEM_PKG.${OPSYS}.${_pkg_}},			\
		     ${DEPEND_ABI.${_pkg_}}))) '			\
	     NR==1 { pkg=$$0 } NR==2 { split($$0, p, ":="); prefix=p[2]}\
	     END {							\
	       printf("print-depends|system|%s|%s|%s\n",		\
		 "${DEPEND_ABI.${_pkg_}}", pkg,	prefix)			\
	     }';							\
  )))
