# robotpkg Makefile for:	editors/mg
# Created:			Matthieu Herrb on Tue, 15 Feb 2011
#

DISTNAME=	mg-20110905
CATEGORIES=	editors
MASTER_SITES=   http://homepage.boetes.org/software/mg/

COMMENT=	tiny emacs-like text editor
HOMEPAGE=       http://homepage.boetes.org/software/mg/
LICENSE=	modified-bsd 2-clause-bsd isc public-domain
MAINTAINER=	matthieu.herrb@laas.fr

NOT_FOR_PLATFORM=	# empty

SUBST_CLASSES+=		  fix-paths
SUBST_STAGE.fix-paths=	  pre-configure
SUBST_MESSAGE.fix-paths=  Fixing absolute paths.
SUBST_FILES.fix-paths=	  Makefile.in mg.1
SUBST_SED.fix-paths=	  -e 's,/usr/local,${PREFIX},g'

HAS_CONFIGURE=	yes

# Define CFLAGS and LDFLAGS for ncurses
INCLUDE_DIRS.ncurses+=		include
INCLUDE_DIRS.ncurses+=		$(dir $(word 1,${SYSTEM_FILES.ncurses}))
LIBRARY_DIRS.ncurses+=		lib
RPATH_DIRS.ncurses+=		lib

include ../../mk/sysdep/ncurses.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
