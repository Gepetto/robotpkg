DISTNAME=	Python-3.1.1
PKGNAME=	python3-3.1.1
CATEGORIES=	lang python
MASTER_SITES=	http://www.python.org/ftp/python/3.1.1/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	openrobots@laas.fr
HOMEPAGE=	http://www.python.org/
COMMENT=	Interpreted, interactive, object-oriented programming language


GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--with-threads
CONFIGURE_ARGS+=	--enable-shared
CONFIGURE_ARGS+=	OPT=${CFLAGS:M*:Q}
CONFIGURE_ARGS+=	--with-system-ffi

LDFLAGS+=		-L${WRKSRC}

USE_LANGUAGES=		c c++

PTHREAD_OPTS+=	require

PY_VER_SUFFIX=		3.1

#PLIST_SRC=	${.CURDIR}/../../wip/python31/PLIST.common
#if exists(${.CURDIR}/../../wip/python31/PLIST.${OPSYS})
#PLIST_SRC+=	${.CURDIR}/../../wip/python31/PLIST.${OPSYS}
#endif

#PLIST_SRC+=	${.CURDIR}/../../wip/python31/PLIST.common_end

#PLIST_SUBST+=	PY_PLATNAME=${PY_PLATNAME:Q}

#if (${MACHINE_ARCH} == "alpha") || (${MACHINE_ARCH} == "amd64") || \
#    (${MACHINE_ARCH} == "sparc64") || (${MACHINE_ARCH} == "x86_64") || \
#    (defined(ABI) && ${ABI} == "64")
#IS_64BIT_PLATFORM?=	yes
#else
#IS_64BIT_PLATFORM?=	no
#endif

# the dl module isn't built for 64 bit archs
#PLIST_VARS+=	dl
#if empty(IS_64BIT_PLATFORM:M[yY][eE][sS])
#PLIST.dl=	yes
#endif

# builds additional modules if OpenSSL < 0.9.8
#PLIST_VARS+=		openssl097
#CHECK_BUILTIN.openssl:=	no
#include "../../security/openssl/builtin.mk"
#CHECK_BUILTIN.openssl:=	yes
#.if !empty(USE_BUILTIN.openssl:M[yY][eE][sS]) && \
#    !empty(BUILTIN_PKG.openssl:Mopenssl-0.9.[67]*)
#PLIST.openssl097=	yes
#.endif

# setup.py causes some modules to be built if the platform is *not* 64bit.
#PLIST_VARS+=	extra-so
#.if !empty(IS_64BIT_PLATFORM:M[nN][oO])
#PLIST.extra-so=	yes
#.endif

#PLIST_SUBST+=	PY_VER_SUFFIX=${PY_VER_SUFFIX:Q}

#PRINT_PLIST_AWK+=        { gsub(/${PY_PLATNAME}/, "$${PY_PLATNAME}") }
#PRINT_PLIST_AWK+=        { gsub(/python${PY_VER_SUFFIX}/, \
#				"python$${PY_VER_SUFFIX}") }

TEST_TARGET=	test
INSTALL_TARGET=	altinstall

REPLACE_INTERPRETER+=	py31
REPLACE.py31.old=	.*python[^ ]*
REPLACE.py31.new=	${PREFIX}/bin/python${PY_VER_SUFFIX}
REPLACE_FILES.py31=	Lib/cgi.py	# explicitly demanded to be patched
REPLACE_FILES.py31+=	Lib/test/test_bz2.py
REPLACE_FILES.py31+=	Lib/test/test_largefile.py Lib/test/test_optparse.py


include ../../mk/sysdep/gdbm.mk
include ../../mk/sysdep/openssl.mk
include ../../mk/sysdep/tcl.mk
include ../../mk/sysdep/tk.mk
include ../../mk/robotpkg.mk

do-install:
	${LN} -sf ${PREFIX}/bin/python${PY_VER_SUFFIX} ${PREFIX}/bin/python

