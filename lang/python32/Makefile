# robotpkg Makefile for:	lang/python32
# Created:			Anthony Mallet on Wed, 21 Sep 2011
#

PKGVERSION=	3.2.2
DISTNAME=	Python-${PKGVERSION_NOREV}
PKGNAME=	python32-${PKGVERSION}
MASTER_SITES=	http://www.python.org/ftp/python/${PKGVERSION_NOREV}/
EXTRACT_SUFX=   .tgz

MAINTAINER=	openrobots@laas.fr
CATEGORIES=	lang
HOMEPAGE=	http://www.python.org/
COMMENT=	Interpreted, interactive, object-oriented programming language
LICENSE=	psfl-v2

CONFLICTS+=	python3-[0-9]*
USE_LANGUAGES=	c c++
MAKE_JOBS_SAFE=	no

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-threads
CONFIGURE_ARGS+=--enable-shared
CONFIGURE_ARGS+=--with-pymalloc
CONFIGURE_ARGS+=--with-system-ffi

# Define LDFLAGS for libffi
LIBRARY_DIRS.libffi+=	lib
RPATH_DIRS.libffi+=	lib

# Define LDFLAGS for python32
RPATH_DIRS=		lib
LDFLAGS+=		-L${WRKSRC}

# Install only suffixed binaries and files
INSTALL_TARGET=		altinstall

# Fix python interpreter path
SUBST_CLASSES+=		interp
SUBST_STAGE.interp=	pre-configure
SUBST_MESSAGE.interp=	Replacing python interpreter path in scripts
SUBST_FILES.interp=	Lib/cgi.py	# explicitly demanded to be patched
SUBST_FILES.interp+=	Lib/*.py Lib/*/*.py Lib/*/*/*.py
SUBST_SED.interp=	'1s|.*python[^ \t]*|\\\#!${PREFIX}/bin/python3.2|'

# python sys.platform name
PY_PLATNAME=\
  $(call tolower,${OS_KERNEL})$(word 1,$(subst ., ,${OS_KERNEL_VERSION}))
PLIST_SUBST+=		PY_PLATNAME=${PY_PLATNAME}
PRINT_PLIST_AWK_SUBST+= gsub("${PY_PLATNAME}/", "$${PY_PLATNAME}/");

include ../../mk/sysdep/libffi.mk
include ../../mk/sysdep/openssl.mk
include ../../mk/robotpkg.mk
