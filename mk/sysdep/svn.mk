# robotpkg sysdep/svn.mk
# Created:			Anthony Mallet on Wed,  6 Oct 2010
#
DEPEND_DEPTH:=	${DEPEND_DEPTH}+
SVN_DEPEND_MK:=	${SVN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=	svn
endif

ifeq (+,$(SVN_DEPEND_MK)) # ------------------------------------------------

PREFER.svn?=	system
DEPEND_USE+=	svn
DEPEND_ABI.svn?=svn>=1

SYSTEM_SEARCH.svn=	\
	'bin/svn:p:% --version --quiet'

ifdef PREFIX.svn
  export SVN=	${PREFIX.svn}/bin/svn
endif

endif # SVN_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
