VERSION=	08.08.14
PKGNAME=	sahand-libs-${VERSION}
DISTNAME=	sahapi_$(subst .,,${VERSION})

CATEGORIES=	hardware
COMMENT=	Schunk Antropomorphic Hand API

INTERACTIVE_STAGE=	fetch
FETCH_MESSAGE+= " The file ${DISTNAME}${EXTRACT_SUFX} containing the sahand API version ${VERSION}"
FETCH_MESSAGE+= ""
FETCH_MESSAGE+= " must be put manually into:"
FETCH_MESSAGE+= "       ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}"

pre-build:
	$(RM) -f $(WRKSRC)/libsahand.so

do-install:
	(cd $(WRKSRC); $(INSTALL_DATA) SAHandCtrlApi.h ${PREFIX}/include)
	(cd $(WRKSRC); $(INSTALL_DATA) libsahand.so ${PREFIX}/lib)

include ../../mk/robotpkg.mk
