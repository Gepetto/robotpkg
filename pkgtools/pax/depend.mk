# robotpkg depend.mk for:	pkgtools/pax
# Created:			Anthony Mallet on Sun, 20 Apr 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PAX_DEPEND_MK:=		${PAX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		pax
endif

ifeq (+,$(PAX_DEPEND_MK)) # ------------------------------------------------

PREFER.pax?=		system

SYSTEM_SEARCH.pax=	\
	'{,s}bin/{,robotpkg_}pax'	\
	'{,s}bin/{,robotpkg_}tar'

SYSTEM_DESCR.pax?=	pax and tar archivers
SYSTEM_PKG.Linux-fedora.pax=	pax tar
SYSTEM_PKG.Linux-ubuntu.pax=	pax tar
SYSTEM_PKG.Linux-debian.pax=	pax tar

DEPEND_USE+=		pax

DEPEND_METHOD.pax?=	build
DEPEND_ABI.pax?=	pax
DEPEND_DIR.pax?=	../../pkgtools/pax

export PAX=		$(word 1,${SYSTEM_FILES.pax})
export TAR=		$(word 2,${SYSTEM_FILES.pax})

endif # PAX_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
