# robotpkg Makefile for:	lang/python3
# Created:			Séverin Lemaignan on Mon, 7 Dec 2009
#

PKGVERSION=	3.1.4
DISTNAME=	Python-${PKGVERSION_NOREV}
PKGNAME=	python31-${PKGVERSION}
MASTER_SITES=	http://www.python.org/ftp/python/${PKGVERSION_NOREV}/
EXTRACT_SUFX=   .tgz

MAINTAINER=	openrobots@laas.fr
CATEGORIES=	lang
HOMEPAGE=	http://www.python.org/
COMMENT=	Interpreted, interactive, object-oriented programming language
LICENSE=	psfl-v2

CONFLICTS+=	python3-[0-9]*
USE_LANGUAGES=	c c++

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-threads
CONFIGURE_ARGS+=--enable-shared
CONFIGURE_ARGS+=--with-system-ffi
RPATH_DIRS=	lib

# Define LDFLAGS for libffi
LIBRARY_DIRS.libffi+=	lib
RPATH_DIRS.libffi+=	lib

# Define LDFLAGS for python32
LDFLAGS+=	-L${WRKSRC}

# Install only suffixed binaries and files
INSTALL_TARGET=	altinstall

SUBST_CLASSES+=		interp
SUBST_STAGE.interp=	post-extract
SUBST_MESSAGE.interp=	Replacing python interpreter path in scripts
SUBST_FILES.interp=	Lib/cgi.py	# explicitly demanded to be patched
SUBST_FILES.interp+=	Lib/test/test_bz2.py
SUBST_FILES.interp+=	Lib/*.py Lib/*/*.py Lib/*/*/*.py
SUBST_SED.interp=	'1s|.*python[^ \t]*|\\\#!${PREFIX}/bin/python3.1|'

# python sys.platform name
include ../../mk/robotpkg.prefs.mk
ifeq (Linux,${OS_KERNEL})
  # On Linux, platform is linux2 even with linux-3.x kernel ...
  PY_PLATNAME=linux2
else
  PY_PLATNAME=\
    $(call tolower,${OS_KERNEL})$(word 1,$(subst ., ,${OS_KERNEL_VERSION}))
endif
PLIST_SUBST+=		PY_PLATNAME=${PY_PLATNAME}
PRINT_PLIST_AWK_SUBST+= gsub("${PY_PLATNAME}/", "$${PY_PLATNAME}/");

include ../../mk/sysdep/libffi.mk
include ../../mk/sysdep/openssl.mk
include ../../mk/robotpkg.mk
