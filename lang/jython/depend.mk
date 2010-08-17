# robotpkg depend.mk for:	lang/jython
# Created:			Anthony Mallet on Fri, 10 Oct 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JYTHON_DEPEND_MK:=	${JYTHON_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		jython
endif

ifeq (+,$(JYTHON_DEPEND_MK)) # ---------------------------------------

PREFER.jython?=		robotpkg

DEPEND_USE+=		jython

DEPEND_ABI.jython?=	jython>=2.2.1
DEPEND_DIR.jython?=	../../lang/jython

SYSTEM_SEARCH.jython=\
	bin/jython

JYTHON_HOME=		${LOCALBASE}/java/jython

endif # --- SUN_JYTHON_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

