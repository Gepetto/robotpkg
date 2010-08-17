# robotpkg depend.mk for:	lang/sun-jdk6
# Created:			Anthony Mallet on Fri, 10 Oct 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SUN_JDK_DEPEND_MK:=	${SUN_JDK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sun-jdk6
endif

ifeq (+,$(SUN_JDK_DEPEND_MK))
PREFER.sun-jdk6?=	robotpkg

DEPEND_USE+=		sun-jdk6

DEPEND_ABI.sun-jdk6?=	sun-jdk6>=6.0.0
DEPEND_DIR.sun-jdk6?=	../../lang/sun-jdk6

DEPEND_METHOD.sun-jdk6?=build

SYSTEM_SEARCH.sun-jdk6=\
	'bin/javac{,-sun6}'

JAVA_HOME=		${LOCALBASE}/java/sun-6
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

