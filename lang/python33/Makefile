# $NetBSD: Makefile,v 1.6 2013/02/06 23:22:38 jperkin Exp $

VERSION=	3.3.5
DISTNAME=	Python-${VERSION}
PKGNAME=	python33-${VERSION}
PKGREVISION= 	4
MASTER_SITES=	http://www.python.org/ftp/python/${VERSION}/
EXTRACT_SUFX=   .tgz

MAINTAINER=	openrobots@laas.fr
CATEGORIES=	lang
HOMEPAGE=	http://www.python.org/
COMMENT=	Interpreted, interactive, object-oriented programming language
LICENSE=	psfl-v2

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=--with-threads
CONFIGURE_ARGS+=--enable-shared
CONFIGURE_ARGS+=--with-pymalloc
CONFIGURE_ARGS+=--with-system-ffi

# Define LDFLAGS for libffi
LIBRARY_DIRS.libffi+=	lib
RPATH_DIRS.libffi+=	lib

# Define LDFLAGS for python33
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
SUBST_SED.interp=	'1s|.*python[^ \t]*|\\\#!${PREFIX}/bin/python3.3|'

# python sys.platform name
include ../../mk/robotpkg.prefs.mk
ifeq (Linux,${OS_KERNEL})
  PY_PLATNAME=linux
else
  PY_PLATNAME=\
    $(call tolower,${OS_KERNEL})$(word 1,$(subst ., ,${OS_KERNEL_VERSION}))
endif
PLIST_SUBST+=		PY_PLATNAME=${PY_PLATNAME}
PRINT_PLIST_AWK_SUBST+= gsub("${PY_PLATNAME}/", "$${PY_PLATNAME}/");

# delete libpython3.so
post-install:
	${RUN}${RM} ${DESTDIR}${PREFIX}/lib/libpython3.so

DEPEND_ABI.openssl+=	openssl<1.1.0

include ../../mk/sysdep/gdbm.mk
include ../../mk/sysdep/libffi.mk
include ../../mk/sysdep/liblzma.mk
include ../../mk/sysdep/openssl.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
