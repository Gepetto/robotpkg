# robotpkg Makefile for:	pkgtools/robotpkgdb
# Created:			Anthony Mallet on Mon, 29 Mar 2010
#

DISTNAME=	robotpkgdb-${PKGVERSION}
CATEGORIES=	pkgtools
MASTER_SITES=	# empty
DISTFILES=	# empty

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://softs.laas.fr/openrobots/robotpkg/pkgtools/pkgdb/index.html
COMMENT=	A database of all packages included in robotpkg
LICENSE=	2-clause-bsd

NO_CHECKSUM=	yes
NO_CONFIGURE=	yes
USE_LANGUAGES=	# empty
BUILD_TARGET=	# empty
INSTALL_TARGET=	# empty

MAKE_ENV+=	ROBOTPKG_DIR=$(call quote,${ROBOTPKG_DIR})
MAKE_ENV+=	ECHO=$(call quote,${ECHO})
MAKE_ENV+=	AWK=$(call quote,${AWK})
MAKE_ENV+=	SORT=$(call quote,${SORT})
MAKE_ENV+=	INSTALL_PROGRAM_DIR=$(call quote,${INSTALL_PROGRAM_DIR})
MAKE_ENV+=	INSTALL_DATA_DIR=$(call quote,${INSTALL_DATA_DIR})
MAKE_ENV+=	INSTALL_PROGRAM=$(call quote,${INSTALL_PROGRAM})
MAKE_ENV+=	INSTALL_DATA=$(call quote,${INSTALL_DATA})

SUBST_CLASSES+=         vars
SUBST_STAGE.vars=       post-extract
SUBST_MESSAGE.vars=     Configuring sources
SUBST_FILES.vars=       robotpkg_search
SUBST_SED.vars=\
	-e 's|@SQLITE@|${SQLITE3}|g'					\
	-e 's|@ROBOTPKG_DB@|${PREFIX}/share/robotpkgdb/robotpkgdb.sqlite|g'

include ../../mk/robotpkg.prefs.mk
PKGVERSION:=	$(shell ${DATE} -u '+%Y%m%d')

# output options
PKG_OPTIONS_NONEMPTY_SETS=	output
PKG_OPTIONS_SET.output=		csv sqlite

# option for csv output generation
#
PKG_SUGGESTED_OPTIONS+= csv
PKG_OPTION_DESCR.csv=	Generate a CSV database
define PKG_OPTION_SET.csv
  BUILD_TARGET+=csv
  INSTALL_TARGET+=install-csv
endef

# option for sqlite output generation
#
PKG_SUGGESTED_OPTIONS+= sqlite
PKG_OPTION_DESCR.sqlite=Generate an sqlite3 database
define PKG_OPTION_SET.sqlite
  BUILD_TARGET+=sqlite
  INSTALL_TARGET+=install-sqlite
  MAKE_ENV+=SQLITE=$(call quote,${SQLITE3})
  include ../../mk/sysdep/sqlite3.mk
endef

include ../../mk/robotpkg.mk

# The source files are only symlinked into the WRKSRC, so that they can
# be easily modified, should the build phase fail.
#
pre-extract:
	${MKDIR} ${WRKSRC}
	${CP} ${FILESDIR}/* ${WRKSRC}
