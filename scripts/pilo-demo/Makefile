DISTNAME=		pilo-demo-0.1
CATEGORIES=		scripts
MASTER_SITES=		${MASTER_SITE_OPENROBOTS:=pilo-demo/}
MASTER_REPOSITORY=	git ssh://trac.laas.fr/git/robots/pilo-demo

MAINTAINER=		openrobots@laas.fr
COMMENT=		Demo application using pilo, locoDemo, Gdhe and picoweb

USE_LANGUAGES=		# empty

REQD_BUILD_OPTIONS.pilo-genom=	locoDemo

do-configure:		

do-build:
	@/bin/true

do-install:
	mkdir -p ${PREFIX}/share/example/pilo-demo
	cd ${WRKSRC} && ${PAX} -rwp amp . ${PREFIX}/share/example/pilo-demo

include ../../motion/locoDemo-genom/depend.mk
include ../../motion/pilo-genom/depend.mk
include ../../www/picoweb/depend.mk
include ../../graphics/gdhe/depend.mk
include ../../shell/eltclsh/depend.mk
include ../../mk/sysdep/tcl.mk
include ../../mk/sysdep/tk.mk
include ../../mk/robotpkg.mk
