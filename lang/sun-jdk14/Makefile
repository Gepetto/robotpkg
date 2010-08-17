# robotpkg Makefile for:	lang/sun-jdk14
# Created:			Anthony Mallet on Fri, 5 Jan 2007
#

DISTNAME=	j2sdk-1_4_2_13-linux-i586
PKGNAME=	sun-jdk14-2.13
MASTER_SITES=	# empty

SHORT=		SDK
COMMENT=	Sun's Java(tm) 2 SDK, Standard Edition 1.4.2 #'

DEPENDS+=	sun-jre14>=2.9:../../lang/sun-jre14

WRKSRC=		${WRKDIR}/j2sdk1.4.2_13
JAVA_WRAPPERS+=	appletviewer extcheck idlj jar jarsigner \
		javac javadoc javah javap jdb rmic serialver


include ../../lang/sun-jre14/Makefile.common

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
