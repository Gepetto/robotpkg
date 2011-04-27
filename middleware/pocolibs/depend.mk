# robotpkg depend.mk for:	middleware/pocolibs
# Created:			A. degroote on Sat, 17 May 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
POCOLIBS_DEPEND_MK:=	${POCOLIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		pocolibs
endif

ifeq (+,$(POCOLIBS_DEPEND_MK))
PREFER.pocolibs?=	robotpkg

DEPEND_USE+=		pocolibs

DEPEND_ABI.pocolibs?=	pocolibs>=2.9
DEPEND_DIR.pocolibs?=	../../middleware/pocolibs

SYSTEM_SEARCH.pocolibs=\
	bin/h2		\
	include/commonStructLib.h	\
	lib/pkgconfig/pocolibs.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
