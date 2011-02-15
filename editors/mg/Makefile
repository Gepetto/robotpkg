# robotpkg Makefile for:	editors/mg
# Created:			Matthieu Herrb on Tue, 15 Feb 2011
#

DISTNAME=	mg-20110122
EXTRACT_SUFX=	.tgz

CATEGORIES=	editors
COMMENT=	tiny emacs-like text editor
LICENSE=	modified-bsd 2-clause-bsd isc public-domain
MASTER_SITES=	http://pintday.org/hack/mg/

MAINTAINER=	matthieu.herrb@laas.fr
HOMEPAGE=	http://pintday.org/hack/mg/

NOT_FOR_PLATFORM=	# empty

SUBST_CLASSES+=		  fix-paths
SUBST_STAGE.fix-paths=	  pre-configure
SUBST_MESSAGE.fix-paths=  Fixing absolute paths.
SUBST_FILES.fix-paths=	  Makefile.in
SUBST_SED.fix-paths=	  -e 's,/usr/local,${PREFIX},g'

HAS_CONFIGURE=	yes

MAKE_ENV=	PREFIX=${PREFIX}

include ../../mk/sysdep/ncurses.mk
include ../../mk/robotpkg.mk
