# robotpkg depend.mk for:	lang/sun-jre6
# Created:			Anthony Mallet on Fri, 3 Oct 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SUN_JRE_DEPEND_MK:=	${SUN_JRE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sun-jre6
endif

ifeq (+,$(SUN_JRE_DEPEND_MK))
PREFER.sun-jre6?=	robotpkg

DEPEND_USE+=		sun-jre6

DEPEND_ABI.sun-jre6?=	sun-jre6>=6.0.0
DEPEND_DIR.sun-jre6?=	../../lang/sun-jre6

SYSTEM_SEARCH.sun-jre6=\
	'bin/java{,-sun6}'

JAVA_HOME=		${LOCALBASE}/java/sun-6
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

