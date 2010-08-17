# robotpkg depend.mk for:	devel/sun-jmf
# Created:			Anthony Mallet on Fri, 10 Oct 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SUN_JMF_DEPEND_MK:=	${SUN_JMF_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sun-jmf
endif

ifeq (+,$(SUN_JMF_DEPEND_MK)) # --------------------------------------

PREFER.sun-jmf?=	robotpkg

DEPEND_USE+=		sun-jmf

DEPEND_ABI.sun-jmf?=	sun-jmf>=2.1.1e
DEPEND_DIR.sun-jmf?=	../../devel/sun-jmf

SYSTEM_SEARCH.sun-jmf=\
	'{,java/sun-6/}lib/ext/jmf.jar'

endif # --- SUN_JMF_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

