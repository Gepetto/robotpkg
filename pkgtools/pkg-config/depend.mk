# robotpkg depend.mk for:	pkgtools/pkg-config
# Created:			Anthony Mallet on Sun, 25 May 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PKG_CONFIG_DEPEND_MK:=	${PKG_CONFIG_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		pkg-config
endif

ifeq (+,$(PKG_CONFIG_DEPEND_MK)) # -----------------------------------

PREFER.pkg-config?=		system

SYSTEM_SEARCH.pkg-config=	'bin/pkg-config::% --version'

DEPEND_USE+=			pkg-config
DEPEND_METHOD.pkg-config+=	build
DEPEND_ABI.pkg-config?=		pkg-config>=0.22
DEPEND_DIR.pkg-config?=		../../pkgtools/pkg-config

SYSTEM_PKG.Fedora.pkg-config=	pkgconfig
SYSTEM_PKG.NetBSD.pkg-config=		pkgsrc/devel/pkg-config


# Define the proper pkg-config environment
#
export PKG_CONFIG=		${PREFIX.pkg-config}/bin/pkg-config
export PKG_CONFIG_LIBDIR=\
  $(call prependpaths,							\
    $(addsuffix /pkgconfig,$(addprefix /usr/,$(or ${SYSLIBDIR},lib)))	\
    /usr/share/pkgconfig,)
export PKG_CONFIG_PATH=$(call prependpaths,				\
	${PREFIX}/lib/pkgconfig ${PREFIX}/share/pkgconfig		\
	$(filter-out $(subst :, ,${PKG_CONFIG_LIBDIR}),			\
	  $(patsubst %/,%,$(foreach _pkg_,${DEPEND_USE},		\
	    $(or ${PKG_CONFIG_PATH.${_pkg_}},				\
	         $(dir $(filter %.pc,${SYSTEM_FILES.${_pkg_}})))))))


# insert the compiler's "rpath" flag into pkg-config data files so that
# ``pkg-config --libs <module>'' will return the full set of compiler
# flags needed to find libraries at run-time. If this is not desirable,
# set PKG_CONFIG_OVERRIDE to an empty value before including this file.
#
# From $NetBSD: pkg-config-override.mk,v 1.3 2007/07/25 18:07:34 rillig Exp $
#
PKG_CONFIG_OVERRIDE?=	lib/pkgconfig/.*[.]pc

include ../../mk/robotpkg.prefs.mk		# _USE_RPATH
ifneq (,$(call isyes,${_USE_RPATH}))		# when using rpath flags
  ifneq (,$(strip ${PKG_CONFIG_OVERRIDE}))	# and not disabled by a package
    post-plist: pkg-config-add-rpath

    .PHONY: pkg-config-add-rpath
    pkg-config-add-rpath:
	@${STEP_MSG} "Adding run-time search paths to pkg-config files"
	${RUN} ${AWK} '/^@/ {next}					\
	  /$(subst /,\/,${PKG_CONFIG_OVERRIDE})/ {print}'		\
	  ${PLIST} | while read f; do					\
	  ${CP} ${PREFIX}/$$f ${WRKDIR}/.pkg-config-add-rpath && {	\
	  ${AWK} '					\
	    /^Libs:.*[ 	]/ {						\
	      while(match($$0, "-L[ 	]*[^ 	]*")) {			\
	        rep = rep substr($$0, 1, RSTART-1);			\
	        r = substr($$0, RSTART+2, RLENGTH-2);			\
	        $$0 = substr($$0, RSTART+RLENGTH);			\
	        sub(/[ 	]*/, "", r);					\
	        if (rep !~ "${COMPILER_RPATH_FLAG}" r)			\
	          rep = rep "${COMPILER_RPATH_FLAG}" r " ";		\
	        rep = rep "-L" r;					\
	      }								\
	      print rep $$0; next					\
	    }								\
	    {print}							\
	  ' ${WRKDIR}/.pkg-config-add-rpath >${PREFIX}/$$f || {		\
	    ${RM} -f ${PREFIX}/$$f &&					\
	    ${MV} ${WRKDIR}/.pkg-config-add-rpath ${PREFIX}/$$f;	\
	  }; };								\
	done
  endif
endif

endif # PKG_CONFIG_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
