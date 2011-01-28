# robotpkg depend.mk for:	pkgtools/digest
# Created:			Anthony Mallet on Tue, 27 Oct 2009
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
DIGEST_DEPEND_MK:=	${DIGEST_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		digest
endif

ifeq (+,$(DIGEST_DEPEND_MK)) # ---------------------------------------------

PREFER.digest?=		robotpkg
DEPEND_USE+=		digest

SYSTEM_SEARCH.digest=	'{s,}bin/robotpkg_digest:p:% -V'

DEPEND_METHOD.digest?=	build
DEPEND_ABI.digest?=	digest>=20080510
DEPEND_DIR.digest?=	../../pkgtools/digest

export DIGEST=		$(word 1,${SYSTEM_FILES.digest})

endif # DIGEST_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
