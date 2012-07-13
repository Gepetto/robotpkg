# robotpkg sysdep/openjdk.mk
# Created:			Anthony Mallet on Wed, 11 Jul 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OPENJDK_DEPEND_MK:=	${OPENJDK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		openjdk
endif

ifeq (+,$(OPENJDK_DEPEND_MK)) # --------------------------------------------

DEPEND_USE+=		openjdk

include ../../mk/sysdep/java.mk
PREFER.openjdk?=	system

DEPEND_ABI.openjdk?=	openjdk>=1.6
DEPEND_METHOD.openjdk?=	${DEPEND_METHOD.java}

_openjdk_p:=	{java/,lib/jvm/,lib/java/,}{,*openjdk*/}
_openjdk_v:=	{y/_/./;s/[^0-9.]//g;h;}
_openjdk_vv:=	/version/${_openjdk_v};/OpenJDK/{g;p;q;}
SYSTEM_SEARCH.openjdk=\
  '${_openjdk_p}bin/java:${_openjdk_vv}:% -version'		\
  '${_openjdk_p}bin/javac:${_openjdk_v}:% -version'		\
  '${_openjdk_p}bin/jar'					\
  '${_openjdk_p}bin/javadoc'					\
  '${_openjdk_p}include/jni.h'					\
  '${_openjdk_p}include/*/jni_md.h'

SYSTEM_PKG.Fedora.openjdk=	java-1.[67].0-openjdk-devel
SYSTEM_PKG.Ubuntu.openjdk=	openjdk-[67]-jdk
SYSTEM_PKG.Debian.openjdk=	openjdk-[67]-jdk
SYSTEM_PKG.NetBSD.openjdk=	lang/openjdk7

export JAVA_HOME=	$(abspath $(dir $(word 1,${SYSTEM_FILES.openjdk}))/..)
export JAVA_INCLUDE=	$(dir $(word 5,${SYSTEM_FILES.openjdk}))
export JAVA_INCLUDE_MD=	$(dir $(word 6,${SYSTEM_FILES.openjdk}))

export JAVA=	$(word 1,${SYSTEM_FILES.openjdk})
export JAVAC=	$(word 2,${SYSTEM_FILES.openjdk})
export JAR=	$(word 3,${SYSTEM_FILES.openjdk})
export JAVADOC=	$(word 4,${SYSTEM_FILES.openjdk})

endif # OPENJDK_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
