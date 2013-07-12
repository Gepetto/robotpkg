# robotpkg depend.mk for:	pkgtools/pkgrepo2deb
# Created:			Anthony Mallet on Fri, 12 Jul 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PKGREPO2DEB_DEPEND_MK:=	${PKGREPO2DEB_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		pkgrepo2deb
endif

ifeq (+,$(PKGREPO2DEB_DEPEND_MK)) # ----------------------------------------

DEPEND_USE+=		pkgrepo2deb

PREFER.pkgrepo2deb?=	robotpkg

DEPEND_ABI.pkgrepo2deb?=pkgrepo2deb>=0.9.20130712
DEPEND_DIR.pkgrepo2deb?=../../pkgtools/pkgrepo2deb

SYSTEM_SEARCH.pkgrepo2deb=	\
  'sbin/pkgrepo2deb:p:% --version'

endif # PKGREPO2DEB_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
