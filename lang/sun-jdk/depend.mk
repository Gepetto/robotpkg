# robotpkg depend.mk for:	lang/sun-jdk
# Created:			Anthony Mallet on Fri, 10 Oct 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SUN_JDK_DEPEND_MK:=	${SUN_JDK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sun-jdk6
endif

ifeq (+,$(SUN_JDK_DEPEND_MK)) # --------------------------------------------

DEPEND_USE+=		sun-jdk

include ../../mk/sysdep/java.mk
PREFER.sun-jdk?=	robotpkg

DEPEND_ABI.sun-jdk?=	sun-jdk>=1.6
DEPEND_DIR.sun-jdk?=	../../lang/sun-jdk
DEPEND_METHOD.sun-jdk?=	${DEPEND_METHOD.java}

_sun_jdk_v:=	{y/_/./;s/[^0-9.]//g;h;}
_sun_jdk_vv:=	/version/${_openjdk_v};/Java(TM) SE/{g;p;q;}
SYSTEM_SEARCH.openjdk=\
  'bin/{,sun-,sun[0-9]-}java:${_sun_jdk_vv}:% -version'		\
  'bin/{,sun-,sun[0-9]-}javac:1${_sun_jdk_v}:% -version'	\
  'bin/{,sun-,sun[0-9]-}jar'					\
  'bin/{,sun-,sun[0-9]-}javadoc'

SYSTEM_PKG.NetBSD.sun-jdk=	lang/sun-jdk6

export JAVA_HOME=${PREFIX.sun-jdk}
export JAVA=	$(word 1,${SYSTEM_FILES.sun-jdk})
export JAVAC=	$(word 2,${SYSTEM_FILES.sun-jdk})
export JAR=	$(word 3,${SYSTEM_FILES.sun-jdk})
export JAVADOC=	$(word 4,${SYSTEM_FILES.sun-jdk})

endif # --------------------------------------------------------------------


DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

