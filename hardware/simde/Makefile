# robotpkg Makefile for:	hardware/simde
# Created:			Guilhem Saurel on Mon, 10 Oct 2022
#

ORG=		simd-everywhere
NAME=		simde
VERSION=	0.8.0

GITHUB_TAG=	v${VERSION}
DISTNAME=	${NAME}-${VERSION}

MASTER_SITES=	${MASTER_SITE_GITHUB:=${ORG}/}

CATEGORIES=	hardware
COMMENT=	Implementations of SIMD instruction sets
LICENSE=	mit
MAINTAINER=	gsaurel@laas.fr

# This uses meson. Support could be added in mk/configure/meson.mk.
# include ../../mk/sysdep/meson.mk
# For now, just do with custom install rules as this is a header-only library.
NO_BUILD=		yes
INSTALLATION_DIRS=$(addprefix include/simde/,		\
  .							\
  arm							\
  arm/neon						\
  mips							\
  mips/msa						\
  wasm							\
  x86							\
  x86/avx512)

include ../../pkgtools/install-sh/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

do-install:
	${RUN}for dir in ${INSTALLATION_DIRS}; do			\
	  ${INSTALL_DATA}						\
	    ${WRKSRC}/$${dir#include/}/*.h ${PREFIX}/$$dir/.;		\
	done
