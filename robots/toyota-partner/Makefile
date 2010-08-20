# robotpkg Makefile for:	robots/toyota-partner
# Created:			florent on Fri, 20 Aug 2010
#

DISTNAME=	toyota-partner-1.0.1
EXTRACT_SUFX=	.zip

CATEGORIES=	robots
MASTER_SITES=		# confidential
MASTER_REPOSITORY=	# confidential

MAINTAINER=	florent@laas.fr
COMMENT=	Model of Toyota Partner robot

LICENSE=	cnrs-stackoftasks-license
RESTRICTED=     Redistribution not permitted
NO_PUBLIC_SRC=  ${RESTRICTED}
NO_PUBLIC_BIN=  ${RESTRICTED}

INTERACTIVE_STAGE=      fetch
FETCH_MESSAGE+=\
        "${bf}The file ${DISTNAME}${EXTRACT_SUFX} must be put manually into:${rm}"
FETCH_MESSAGE+= "       ${DISTDIR}/"
FETCH_MESSAGE+= ""
FETCH_MESSAGE+= " To get the source code, contact ${MAINTAINER}."
FETCH_MESSAGE+= " Type \`${MAKE} show-license' for more information."

DOXYGEN_PLIST_DIR+=	share/doc/toyota-partner

include ../../pkgtools/pkg-config/depend.mk
include ../../devel/hpp-model/depend.mk
include ../../path/hpp-core/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/robotpkg.mk
