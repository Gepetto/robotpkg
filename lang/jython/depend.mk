# robotpkg depend.mk for:	lang/jython
# Created:			Anthony Mallet on Fri, 10 Oct 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JYTHON_DEPEND_MK:=	${JYTHON_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		jython
endif

ifeq (+,$(JYTHON_DEPEND_MK)) # ---------------------------------------------

include ../../mk/robotpkg.prefs.mk
ifeq (NetBSD,${OPSYS})
  PREFER.jython?=	robotpkg
endif
PREFER.jython?=		system

DEPEND_USE+=		jython

DEPEND_ABI.jython?=	jython>=2.2.1
DEPEND_DIR.jython?=	../../lang/jython

SYSTEM_SEARCH.jython=\
	'bin/jython:s/Jython *//p:% -V'

endif # --- JYTHON_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
