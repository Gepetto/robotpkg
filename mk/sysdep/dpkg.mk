# robotpkg sysdep/dpkg.mk
# Created:			Anthony Mallet on Wed, 25 Aug 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
DPKG_DEPEND_MK:=	${DPKG_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		dpkg
endif

ifeq (+,$(DPKG_DEPEND_MK)) # -----------------------------------------------

PREFER.dpkg?=		system

DEPEND_USE+=		dpkg
DEPEND_METHOD.dpkg?=	build
DEPEND_ABI.dpkg?=	dpkg>=1

SYSTEM_SEARCH.dpkg=	\
	'bin/dpkg:/version/{s/[^0-9.]//g;s/\.$$//p;q;}:% --version'

SYSTEM_PKG.Linux.dpkg=	dpkg
SYSTEM_PKG.NetBSD.dpkg=	pkgsrc/misc/dpkg

export DPKG=		$(word 1,${SYSTEM_FILES.dpkg})

endif # DPKG_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
