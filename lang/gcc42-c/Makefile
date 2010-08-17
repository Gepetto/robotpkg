# robotpkg Makefile for:	lang/gcc42-c
# Created:			Anthony Mallet on Mon, 20 Oct 2008
#

PKGNAME=		gcc42-c-${GCC_VERSION}
SUB_COMMENT=		C compiler

GCC_LANGUAGES=		c

GENERATE_PLIST+=						\
	${FIND} ${GCC_PREFIX} \( -type f -o -type l \) -print	\
		| ${SORT} | ${SED} -e "s,${PREFIX}/,,g";

INSTALL_TARGET=		install-gcc

# don't build a shared libgcc
CONFIGURE_ARGS+=        --disable-shared

include ../../lang/gcc42/Makefile.common
include ../../mk/robotpkg.mk
