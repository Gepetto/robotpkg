# robotpkg depend.mk for:	devel/libedit
# Created:			Anthony Mallet on Sun, 3 Aug 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBEDIT_DEPEND_MK:=	${LIBEDIT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libedit
endif

ifeq (+,$(LIBEDIT_DEPEND_MK)) # --------------------------------------

PREFER.libedit?=	robotpkg

DEPEND_USE+=		libedit

DEPEND_ABI.libedit?=	libedit>=2.10
DEPEND_DIR.libedit?=	../../devel/libedit

SYSTEM_SEARCH.libedit=\
	include/histedit.h	\
	lib/libedit.*

endif # LIBEDIT_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
