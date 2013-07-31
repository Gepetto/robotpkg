# robotpkg depend.mk for:	archivers/pax
# Created:			Anthony Mallet on Sun, 20 Apr 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PAX_DEPEND_MK:=		${PAX_DEPEND_MK}+

ifeq (+,$(PAX_DEPEND_MK)) # ------------------------------------------------

PREFER.pax?=		system

SYSTEM_SEARCH.pax=	\
	'{,s}bin/pax'	\
	'{,s}bin/tar'

SYSTEM_DESCR.pax?=	pax and tar archivers
SYSTEM_PKG.Fedora.pax=	pax tar
SYSTEM_PKG.Ubuntu.pax=	pax tar
SYSTEM_PKG.Debian.pax=	pax tar

DEPEND_METHOD.pax?=	build
DEPEND_ABI.pax?=	pax
DEPEND_DIR.pax?=	../../archivers/pax

endif # PAX_DEPEND_MK ------------------------------------------------------

# pull-in the user preferences for inplace+robotpkg check
include ../../mk/robotpkg.prefs.mk
_pax_style=$(strip ${PAX_STYLE})+$(strip ${PREFER.pax})

ifneq (inplace+robotpkg,${_pax_style})
  # This is the regular version, for normal install
  #
  ifeq (+,$(DEPEND_DEPTH))
    DEPEND_PKG+=		pax
  endif

  ifeq (+,$(PAX_DEPEND_MK))
    DEPEND_USE+=		pax

    export PAX=		$(word 1,${SYSTEM_FILES.pax})
    export TAR=		$(word 2,${SYSTEM_FILES.pax})
  endif
else
  # This is the "inplace" version, for bootstrap process
  #
  pre-configure: pax-inplace

  .PHONY: pax-inplace
  pax-inplace:
	@${STEP_MSG} "Building pax in place"
	${RUN} cd ${ROBOTPKG_DIR}/${PKGPATH}/${DEPEND_DIR.pax};		\
	${RECURSIVE_MAKE} build						\
	  WRKDIR=${WRKDIR}/pax						\
	  NO_PKGTOOLS_REQD_CHECK=yes;					\
	${LN} -s pax ${WRKDIR}/pax/pax-20080110/tar

  export PAX=		${WRKDIR}/pax/pax-20080110/pax
  export TAR=		${WRKDIR}/pax/pax-20080110/tar
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
