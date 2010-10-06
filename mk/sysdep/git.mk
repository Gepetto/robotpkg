# robotpkg sysdep/git.mk
# Created:			Anthony Mallet on Wed,  6 Oct 2010
#
DEPEND_DEPTH:=	${DEPEND_DEPTH}+
GIT_DEPEND_MK:=	${GIT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=	git
endif

ifeq (+,$(GIT_DEPEND_MK)) # ------------------------------------------------

PREFER.git?=	system
DEPEND_USE+=	git
DEPEND_ABI.git?=git>=1.6

SYSTEM_SEARCH.git=	\
	'bin/git:s/[^0-9.]//gp:% --version'

ifdef PREFIX.git
  export GIT=	${PREFIX.git}/bin/git
endif

endif # GIT_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
