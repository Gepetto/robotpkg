# robotpkg Makefile for:	lang/sun-jdk6
# Created:			Anthony Mallet on Fri, 3 Oct 2008
#

DISTNAME=	jdk-6u7-linux-i586
PKGNAME=	sun-jdk6-6.0.7
MASTER_SITES=	# empty

DOWNLOAD_NAME=	JDK 6u7
SHORT_NAME=	JDK

DEPENDS+=	$(subst jdk,jre,${PKGNAME_NOREV})*:../../lang/sun-jre6

WRKSRC=		${WRKDIR}/jdk1.6.0_07
JAVA_WRAPPERS=	appletviewer apt extcheck idlj jar jarsigner \
		javac javadoc javah javap jdb rmic serialver

LICENSE=	sun-jdk6-license

include ../../lang/sun-jre6/Makefile.common
include ../../mk/robotpkg.mk

# Remove parts that are in common with the JRE
#
post-extract:
	common=`${AWK} '/^#.*/ { next } /^$$/ { next } { print }' ${FILESDIR}/common`; \
	cd ${WRKSRC}; for i in $$common; do				\
		if [ -d $$i ]; then					\
			${RM} -rf $$i;					\
		else							\
			${RM} -f $$i;					\
		fi;							\
	done
	${LN} -sf . ${WRKSRC}/jre
