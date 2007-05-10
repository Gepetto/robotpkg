# Copyright (c) 2006 LAAS/CNRS                         -- Sat Dec  9 2006
# All rights  reserved.
#

KPPVERSION=		2.04
KPPPATCH=		300
PKGREVISION=		1
PKGNAME=		kineo-pp-${KPPVERSION}.${KPPPATCH}
DISTNAME=		KPPSDK_${KPPVERSION}.${KPPPATCH}
EXTRACT_SUFX=		.tgz

WRKSRC=			${WRKDIR}/kppsdk_${KPPVERSION}

CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.kineocam.org/
COMMENT=		Software component dedicated to motion planning.

LICENSE=                kineocam-license

SUBST_CLASSES+=			kineopc
SUBST_STAGE.kineopc=		pre-install
SUBST_MESSAGE.kineopc=		Generating pkg-config files.
SUBST_SED.kineopc=						\
	-e 's|@PREFIX@|${PREFIX}|g'				\
	-e 's|@KPPVERSION@|${KPPVERSION}|g'			\
	-e 's|@KPPPATCH@|${KPPPATCH}|g'

SUBST_FILES.kineopc=$(call quote,				\
	KineoController.pc					\
	KineoPathPlanner.pc)

INTERACTIVE_STAGE=	fetch
FETCH_MESSAGE+= " The file ${DISTNAME}${EXTRACT_SUFX} containing KPP ${KPPVERSION}"
FETCH_MESSAGE+= ""
FETCH_MESSAGE+= " must be put manually into:"
FETCH_MESSAGE+= "       ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}"

NO_CONFIGURE=		yes
NO_BUILD=		yes

include ../../mk/robotpkg.mk

KINEO_DIR=		${PREFIX}/kineo

post-extract:
	${CHMOD} -R u+w ${WRKSRC}
	${CP} ${FILESDIR}/KineoController.pc ${WRKSRC}
	${CP} ${FILESDIR}/KineoPathPlanner.pc ${WRKSRC}

do-install:
	${PAX} -rw -pm -s '|${WRKSRC}/bin/i386-linux||' ${WRKSRC}/bin/i386-linux/Kineo* ${KINEO_DIR}/bin
	${PAX} -rw -pm -s '|${WRKSRC}/bin/i386-linux||' ${WRKSRC}/bin/i386-linux/*.sh ${KINEO_DIR}/bin
	${PAX} -rw -pm -s '|${WRKSRC}/bin/i386-linux/dynlib||' ${WRKSRC}/bin/i386-linux/dynlib ${KINEO_DIR}/lib
	${PAX} -rw -pm -s '|${WRKSRC}/demos||' ${WRKSRC}/demos ${KINEO_DIR}/share/demos
	${PAX} -rw -pm -s '|${WRKSRC}/examples||' ${WRKSRC}/examples ${KINEO_DIR}/share/examples
	${PAX} -rw -pm -s '|${WRKSRC}/doc||' ${WRKSRC}/doc ${KINEO_DIR}/share/doc
	${PAX} -rw -pm -s '|${WRKSRC}/interfaces||' ${WRKSRC}/interfaces ${KINEO_DIR}/include
	${PAX} -rw -pm -s '|${WRKSRC}/lib||' ${WRKSRC}/lib ${KINEO_DIR}/lib
	${PAX} -rw -pm -s '|${WRKSRC}/res||' ${WRKSRC}/res ${KINEO_DIR}/res
	for f in 							\
		KineoAddonBuilder					\
		KineoPathPlannerd					\
		KineoPathPlanner; do 					\
		${SED} -e 's|@KINEO_DIR@|${KINEO_DIR}|' 		\
			< ${FILESDIR}/wrapper.sh > ${PREFIX}/bin/$$f;	\
		${CHMOD} a+x ${PREFIX}/bin/$$f;				\
	done
	for f in 							\
		KineoController.pc					\
		KineoPathPlanner.pc; do 				\
		${INSTALL_DATA} ${WRKSRC}/$$f ${PREFIX}/lib/pkgconfig/$$f;\
	done
