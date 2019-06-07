# robotpkg depend.mk for:	pkgtools/pkgrepo2deb
# Created:			Anthony Mallet on Fri, 12 Jul 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PKGREPO2DEB_DEPEND_MK:=	${PKGREPO2DEB_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
  DEPEND_PKG+=		$(filter-out ${PKGBASE},pkgrepo2deb)
endif

ifeq (+,$(PKGREPO2DEB_DEPEND_MK)) # --------------------------------------
  # if pkgrepo2deb is outside LOCALBASE, make it a 'system' package.
  PREFIX.pkgrepo2deb?=	${ROBOTPKG_BASE}
  PREFER.pkgrepo2deb?=\
    $(if $(filter $(realpath ${LOCALBASE}),                      \
       $(realpath ${PREFIX.pkgrepo2deb})),robotpkg,system)

  DEPEND_USE+=		pkgrepo2deb

  DEPEND_METHOD.pkgrepo2deb?=	bootstrap
  DEPEND_ABI.pkgrepo2deb?=	pkgrepo2deb>=1.6.1
  DEPEND_DIR.pkgrepo2deb?=	../../pkgtools/pkgrepo2deb

  SYSTEM_SEARCH.pkgrepo2deb=	\
    'sbin/pkgrepo2deb:p:% --version'

  export PKGREPO2DEB?=	${PREFIX.pkgrepo2deb}/sbin/pkgrepo2deb
endif # PKGREPO2DEB_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

# pull GPG_HOMEDIR settings
DEPEND_METHOD.gnupg+=	bootstrap
include ../../mk/sysdep/gnupg.mk
