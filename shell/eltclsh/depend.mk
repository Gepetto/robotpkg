# robotpkg depend.mk for:	shell/eltclsh
# Created:			Anthony Mallet on Mon, 9 Mar 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ELTCLSH_DEPEND_MK:=	${ELTCLSH_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		eltclsh
endif

ifeq (+,$(ELTCLSH_DEPEND_MK)) # --------------------------------------------

PREFER.eltclsh?=	robotpkg

SYSTEM_SEARCH.eltclsh=	bin/eltclsh

DEPEND_USE+=		eltclsh
DEPEND_ABI.eltclsh?=	eltclsh>=1.11.1
DEPEND_DIR.eltclsh?=	../../shell/eltclsh

SYSTEM_PKG.NetBSD.eltclsh=	pkgsrc/shells/eltclsh

export ELTCLSH=		$(firstword ${SYSTEM_FILES.eltclsh})

endif # ELTCLSH_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
