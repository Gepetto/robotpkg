# robotpkg Makefile for:	sysutils/interceptty
# Created:			Anthony Mallet on Tue,  3 Mar 2015
#

DISTNAME=	interceptty-0.6
CATEGORIES=	sysutils
MASTER_SITES=	http://www.suspectclass.com/sgifford/interceptty/files/

COMMENT=	Serial port redirector
HOMEPAGE=	http://www.suspectclass.com/sgifford/interceptty/
LICENSE=	gnu-gpl-v2
MAINTAINER=	mallet@laas.fr

GNU_CONFIGURE=	yes

# Replace perl interpreter
SUBST_CLASSES+=		perl-interp
SUBST_STAGE.perl-interp=	pre-configure
SUBST_MESSAGE.perl-interp=	Replacing perl interpreter path
SUBST_SED.perl-interp=		-e '1s|^\\\#!.*perl|\\\#!${PERL}|'
SUBST_FILES.perl-interp+=	interceptty-nicedump

include ../../mk/sysdep/perl.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk
