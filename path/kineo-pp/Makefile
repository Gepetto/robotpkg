# Copyright (c) 2006 LAAS/CNRS                         -- Sat Dec  9 2006
# All rights  reserved.
#

KPPVERSION=		2.04
KPPPATCH=		001
PKGNAME=		kineo-pp-${KPPVERSION}.${KPPPATCH}
DISTNAME=		KPPSDK_${KPPVERSION}.${KPPPATCH}
EXTRACT_SUFX=		.tgz

WRKSRC=			${WRKDIR}/KPPSDK_${KPPVERSION}

CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.kineocam.org/
COMMENT=		Software component dedicated to motion planning.

LICENSE=                kineocam-license

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

do-install:
	${PAX} -rw -pm -s '|${WRKSRC}/bin/i386-linux||' ${WRKSRC}/bin/i386-linux/Kineo* ${KINEO_DIR}/bin
	${PAX} -rw -pm -s '|${WRKSRC}/bin/i386-linux||' ${WRKSRC}/bin/i386-linux/*.sh ${KINEO_DIR}/bin
	${PAX} -rw -pm -s '|${WRKSRC}/bin/i386-linux/dynlib||' ${WRKSRC}/bin/i386-linux/dynlib ${KINEO_DIR}/lib
	${PAX} -rw -pm -s '|${WRKSRC}/demos||' ${WRKSRC}/demos ${KINEO_DIR}/share/demos
	${PAX} -rw -pm -s '|${WRKSRC}/doc||' ${WRKSRC}/doc ${KINEO_DIR}/share/doc
	${PAX} -rw -pm -s '|${WRKSRC}/examples||' ${WRKSRC}/examples ${KINEO_DIR}/share/examples
	${PAX} -rw -pm -s '|${WRKSRC}/interfaces||' ${WRKSRC}/interfaces ${KINEO_DIR}/include
	${PAX} -rw -pm -s '|${WRKSRC}/lib||' ${WRKSRC}/lib ${KINEO_DIR}/lib
	${PAX} -rw -pm -s '|${WRKSRC}/licenses||' ${WRKSRC}/licenses ${KINEO_DIR}/licenses
	${PAX} -rw -pm -s '|${WRKSRC}/res||' ${WRKSRC}/res ${KINEO_DIR}/res
	for f in 							\
		KineoAddonBuilder					\
		KineoPathPlannerd					\
		KineoPathPlanner; do 					\
		${SED} -e 's|@KINEO_DIR@|${KINEO_DIR}|' 		\
			< ${FILESDIR}/wrapper.sh > ${PREFIX}/bin/$$f;	\
		${CHMOD} a+x ${PREFIX}/bin/$$f;				\
	done
