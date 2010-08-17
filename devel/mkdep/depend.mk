# robotpkg depend.mk for:	devel/mkdep
# Created:			Anthony Mallet on Mon, 29 Dec 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MKDEP_DEPEND_MK:=	${MKDEP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		mkdep
endif

ifeq (+,$(MKDEP_DEPEND_MK)) # ----------------------------------------------

PREFER.mkdep?=	robotpkg

DEPEND_USE+=		mkdep

DEPEND_ABI.mkdep?=	mkdep>=2.6
DEPEND_DIR.mkdep?=	../../devel/mkdep
DEPEND_METHOD.mkdep?=	build

SYSTEM_SEARCH.mkdep=\
	bin/mkdep						\
	'lib/pkgconfig/mkdep.pc:/Version/s/[^.0-9]//gp'

endif # MKDEP_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
