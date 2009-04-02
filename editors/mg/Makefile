PKGNAME=	mg-20080818
DISTNAME=	mg-p-080818
EXTRACT_SUFX=	.tgz

CATEGORIES=	editors
COMMENT=	tiny emacs-like text editor

MASTER_SITES=	http://pintday.org/hack/mg/

MAINTAINER=	matthieu.herrb@laas.fr
HOMEPAGE=	http://pintday.org/hack/mg/

WRKSRC=		${WRKDIR}/mg-p

MAKE_ENV=	PREFIX=${PREFIX}
MAKE_ENV+=	LDADD=$(call quote,${LDFLAGS})

# Define CFLAGS and LDFLAGS for ncurses
DEPEND_INCDIRS.ncurses=		include
DEPEND_LIBDIRS.ncurses=		lib
DEPEND_RPATHDIRS.ncurses=	lib

include ../../mk/sysdep/ncurses.mk
include ../../mk/robotpkg.mk
