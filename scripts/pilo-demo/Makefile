# robotpkg Makefile for:	scripts/pilo-demo
# Created:			Matthieu Herrb on Mon, 12 Apr 2010
#
DISTNAME=		pilo-demo-0.1
CATEGORIES=		scripts
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=pilo-demo/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/pilo-demo

MAINTAINER=		openrobots@laas.fr
COMMENT=		Demo application using pilo, locoDemo, Gdhe and picoweb
LICENSE=		isc

NO_CONFIGURE=		yes
NO_BUILD=		yes

include ../../motion/pilo-genom/depend.mk
DEPEND_ABI.pilo-genom+=	pilo-genom~locoDemo

include ../../motion/locoDemo-genom/depend.mk
include ../../www/picoweb/depend.mk
include ../../graphics/gdhe/depend.mk
include ../../shell/eltclsh/depend.mk
include ../../mk/sysdep/tcl.mk
include ../../mk/sysdep/tk.mk
include ../../mk/robotpkg.mk

do-install:
	mkdir -p ${PREFIX}/share/example/pilo-demo
	cd ${WRKSRC} && ${PAX} -rwp amp . ${PREFIX}/share/example/pilo-demo
