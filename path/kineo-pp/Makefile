# $LAAS: $
#
# Copyright (c) 2006-2008 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
#                                      Anthony Mallet on Sat Dec  9 2006
#

KPPVERSION=		2.04
KPPPATCH=		501
PKGREVISION=		1

PKGNAME=		kineo-pp-${KPPVERSION}.${KPPPATCH}
DISTNAME=		KPPSDK_${KPPVERSION}.${KPPPATCH}
EXTRACT_SUFX=		.tgz

WRKSRC=			${WRKDIR}/KPPSDK_${KPPVERSION}.${KPPPATCH}

CATEGORIES=		path
MASTER_SITES=		${MASTER_SITE_OPENROBOTS}

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.kineocam.org/
COMMENT=		Software component dedicated to motion planning.

LICENSE=                kineocam-license

SUBST_CLASSES+=			kineopc
SUBST_STAGE.kineopc=		pre-configure
SUBST_MESSAGE.kineopc=		Generating pkg-config files.
SUBST_SED.kineopc=						\
	-e 's|@PREFIX@|${PREFIX}|g'				\
	-e 's|@KPPVERSION@|${KPPVERSION}|g'			\
	-e 's|@KPPPATCH@|${KPPPATCH}|g'

SUBST_FILES.kineopc=						\
	KineoController.pc					\
	KineoPathPlanner.pc

INTERACTIVE_STAGE=	fetch
FETCH_MESSAGE+= " The file ${DISTNAME}${EXTRACT_SUFX} containing KPP ${KPPVERSION}"
FETCH_MESSAGE+= ""
FETCH_MESSAGE+= " must be put manually into:"
FETCH_MESSAGE+= "       ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX}"

NO_BUILD=		yes

include ../../mk/robotpkg.mk

KINEO_DIR=		${PREFIX}/kineo

post-extract:
	${CHMOD} -R u+w ${WRKSRC}
	${CP} ${FILESDIR}/KineoController.pc ${WRKSRC}
	${CP} ${FILESDIR}/KineoPathPlanner.pc ${WRKSRC}
	${CP} ${FILESDIR}/KineoSetDebug ${WRKSRC}/bin/i386-linux/.

do-install:
	${PAX} -rw -pm -s '|${WRKSRC}/bin/i386-linux||' ${WRKSRC}/bin/i386-linux/Kineo* ${KINEO_DIR}/bin
	${PAX} -rw -pm -s '|${WRKSRC}/bin/i386-linux||' ${WRKSRC}/bin/i386-linux/*.sh ${KINEO_DIR}/bin
	${PAX} -rw -pm -s '|${WRKSRC}/bin/i386-linux/dynlib||' ${WRKSRC}/bin/i386-linux/dynlib ${KINEO_DIR}/lib
	${PAX} -rw -pm -s '|${WRKSRC}/bin/i386-linux/modules||' ${WRKSRC}/bin/i386-linux/modules ${KINEO_DIR}/lib/modules
	${PAX} -rw -pm -s '|${WRKSRC}/bin/i386-linux/debugModules||' ${WRKSRC}/bin/i386-linux/debugModules ${KINEO_DIR}/lib/modules
	${PAX} -rw -pm -s '|${WRKSRC}/interfaces||' ${WRKSRC}/interfaces ${KINEO_DIR}/include
	${PAX} -rw -pm -s '|${WRKSRC}/lib||' ${WRKSRC}/lib ${KINEO_DIR}/lib
	${PAX} -rw -pm -s '|${WRKSRC}/res||' ${WRKSRC}/res ${KINEO_DIR}/res
	${PAX} -rw -pm -s '|${WRKSRC}/doc||' ${WRKSRC}/doc ${KINEO_DIR}/share/doc
	${PAX} -rw -pm -s '|${WRKSRC}/demos||' ${WRKSRC}/demos ${KINEO_DIR}/share/demos
	${PAX} -rw -pm -s '|${WRKSRC}/examples||' ${WRKSRC}/examples ${KINEO_DIR}/share/examples
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
