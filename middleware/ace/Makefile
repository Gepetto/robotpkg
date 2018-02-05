# robotpkg Makefile for:	middleware/ace
# Created:			Anthony Mallet on Wed, 23 Jan 2008
#

ACE_VERSION=		6.4.6
DISTNAME=		ACE-${ACE_VERSION}
PKGNAME=		ace-${ACE_VERSION}
CATEGORIES=		middleware
MASTER_SITES=		http://download.dre.vanderbilt.edu/previous_versions/

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.cs.wustl.edu/~schmidt/ACE.html
COMMENT=		The ADAPTATIVE Communication Environment ACE(tm)
LICENSE=		doc

WRKSRC=			${WRKDIR}/ACE_wrappers

MAKE_FILE=		GNUmakefile
MAKE_ENV+=		ACE_ROOT=${WRKSRC}
MAKE_ENV+=		INSTALL_PREFIX=${PREFIX}

# Archive contains pax extended attributes - sadly, NetBSD pax (and maybe
# others) does not support them.
DEPEND_ABI.gtar=       gtar>=1.14
DEPEND_METHOD.gtar=    bootstrap
EXTRACT_USING=         ${GTAR}

# Replace perl
include ../../mk/sysdep/perl.mk
SUBST_CLASSES+=         perl-interp
SUBST_FILES.perl-interp+= MPC/*.pl bin/*.pl bin/*.pm ace/GNUmakefile.ACE
SUBST_FILES.perl-interp+= */GNUmakefile.* */*/GNUmakefile.* */*/*/GNUmakefile.*
SUBST_SED.perl-interp+=	-e 's|\([^/]\)perl|\1${PERL}|g'

OVERRIDE_DIRDEPTH.pkg-config=	3

include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/gtar.mk
include ../../mk/sysdep/perl.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk

# create the config file
pre-configure: ace-config ace-platform

.PHONY: ace-config ace-platform
ace-config:
	${RUN} {						\
	  ${ECHO} '#include "config-${LOWER_OS_KERNEL}.h"';	\
	} >${WRKSRC}/ace/config.h

ace-platform:
	${RUN} {						\
	  ${ECHO} xt=;						\
	  ${ECHO} fl=;						\
	  ${ECHO} fox=;						\
	  ${ECHO} tk=;						\
	  ${ECHO} qt=;						\
	  ${ECHO} qt4=;						\
	  ${ECHO} ssl=;						\
	  ${ECHO} rapi=;					\
	  ${ECHO} stlport=;					\
	  ${ECHO} sctp=;					\
								\
	  ${ECHO} 'include'					\
	  '$$(ACE_ROOT)/include/makeinclude/platform_${LOWER_OS_KERNEL}.GNU';\
	} >>${WRKSRC}/include/makeinclude/platform_macros.GNU
