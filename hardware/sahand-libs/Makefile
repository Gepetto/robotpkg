VERSION=	08.08.14
PKGNAME=	sahand-libs-${VERSION}
DISTNAME=	sahapi_$(subst .,,${VERSION})
PKGREVISION=	1

CATEGORIES=	hardware
COMMENT=	Schunk Antropomorphic Hand API

INTERACTIVE_STAGE=	fetch
FETCH_MESSAGE+= " The file ${DISTNAME}${EXTRACT_SUFX} containing the sahand API version ${VERSION}"
FETCH_MESSAGE+= ""
FETCH_MESSAGE+= " must be put manually into:"
FETCH_MESSAGE+= "       ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}"

INSTALLATION_DIRS+= ${PREFIX}/include/sahand
INSTALLATION_DIRS+= ${PREFIX}/share/doc/sahand

pre-build:
	$(RM) -f $(WRKSRC)/libsahand.so

do-install:
	(cd $(WRKSRC); $(INSTALL_DATA) SAHandCtrlApi.h \
		CY9449.h DLRHITDpr.h SAHandCtrlApiDef.h \
		${PREFIX}/include/sahand)
	(cd $(WRKSRC); $(INSTALL_DATA) libsahand.so ${PREFIX}/lib)
	(cd $(WRKSRC); $(INSTALL_DATA) Hand_Manual.pdf \
		${PREFIX}/share/doc/sahand )

include ../../mk/robotpkg.mk
