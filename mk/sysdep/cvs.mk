# robotpkg sysdep/cvs.mk
# Created:			Anthony Mallet on Wed,  6 Oct 2010
#
DEPEND_DEPTH:=	${DEPEND_DEPTH}+
CVS_DEPEND_MK:=	${CVS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=	cvs
endif

ifeq (+,$(CVS_DEPEND_MK)) # ------------------------------------------------

PREFER.cvs?=	system
DEPEND_USE+=	cvs
DEPEND_ABI.cvs?=cvs>=1

SYSTEM_SEARCH.cvs=	\
	'bin/cvs:/^Concurrent Versions/s/[^0-9.]//gp:% --version'

ifdef PREFIX.cvs
  export CVS=	${PREFIX.cvs}/bin/cvs
endif

endif # CVS_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
