# robotpkg depend.mk for:	pkgtools/pkgrepo2deb
# Created:			Anthony Mallet on Fri, 12 Jul 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PKGREPO2DEB_DEPEND_MK:=	${PKGREPO2DEB_DEPEND_MK}+

ifeq (+,$(PKGREPO2DEB_DEPEND_MK)) # ----------------------------------------
  PREFER.pkgrepo2deb?=		robotpkg

  DEPEND_ABI.pkgrepo2deb?=	pkgrepo2deb>=0.9.20130712
  DEPEND_DIR.pkgrepo2deb?=	../../pkgtools/pkgrepo2deb

  SYSTEM_SEARCH.pkgrepo2deb=	\
    'sbin/pkgrepo2deb:p:% --version'
endif # PKGREPO2DEB_DEPEND_MK ----------------------------------------------

# pull-in the user preferences for inplace+robotpkg check
include ../../mk/robotpkg.prefs.mk
_pkgrepo2deb_style=$(strip ${PKGREPO2DEB_STYLE})+$(strip ${PREFER.pkgrepo2deb})

ifneq (inplace+robotpkg,${_pkgrepo2deb_style})
  # This is the regular version, for normal install
  #
  ifeq (+,$(DEPEND_DEPTH))
    DEPEND_PKG+=		pkgrepo2deb
  endif

  ifeq (+,$(PKGREPO2DEB_DEPEND_MK))
    DEPEND_USE+=		pkgrepo2deb
  endif

  export PKGREPO2DEB?=	${PREFIX.pkgrepo2deb}/sbin/pkgrepo2deb
else
  # This is the "inplace" version, for bootstrap process
  #
  pre-package: pkgrepo2deb-inplace

  .PHONY: pkgrepo2deb-inplace
  pkgrepo2deb-inplace:
	@${STEP_MSG} "Building pkgrepo2deb in place"
	${RUN} cd ${ROBOTPKG_DIR}/${PKGPATH}/${DEPEND_DIR.pkgrepo2deb};	\
	${RECURSIVE_MAKE} WRKDIR=${WRKDIR}/pkgrepo2deb build

  export PKGREPO2DEB=	${SH} ${WRKDIR}/pkgrepo2deb/pkgrepo2deb/pkgrepo2deb
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
