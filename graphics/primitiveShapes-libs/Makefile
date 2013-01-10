# robotpkg Makefile for:	graphics/primitiveShapes
# Created:			Matthieu Herrb on Fri, 27 Aug 2010
#

VERSION = 	1.1
PKGNAME = 	primitiveShapes-libs-${VERSION}
DISTNAME = 	Software%20v${VERSION}
EXTRACT_SUFX = 	.zip
CATEGORIES = 	graphics

HOME_PAGE =	http://cg.cs.uni-bonn.de/en/publications/paper-details/schnabel-2007-efficient/
MASTER_SITES = 	http://cg.cs.uni-bonn.de/aigaion2root/attachments/

COMMENT = 	Efficient RANSAC for Point-Cloud Shape Detection

LICENSE = 	uni-bonn-research-license

WRKSRC = 	${WRKDIR}

pre-build:
	${SED} -e 's,@PREFIX@,${PREFIX},' \
		< ${FILESDIR}/Makefile.in > ${WRKSRC}/Makefile
	${SED} -e 's,@PREFIX@,${PREFIX},' \
	       -e 's,@PACKAGE_VERSION@,${VERSION},' \
		< ${FILESDIR}/primitiveShapes-libs.pc.in \
		> ${WRKSRC}/primitiveShapes-libs.pc

include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
