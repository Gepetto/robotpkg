# robotpkg sysdep/gdbm.mk
# Created:			Séverin Lemaignan on Mon Dec 7 2009
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GDBM_DEPEND_MK:=	${GDBM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gdbm
endif

ifeq (+,$(GDBM_DEPEND_MK)) # ------------------------------------------------

PREFER.gdbm?=		system

DEPEND_USE+=		gdbm
DEPEND_ABI.gdbm?=	gdbm

SYSTEM_SEARCH.gdbm=	\
	'include/gdbm.h'	\
	'lib/libgdbm.so'

SYSTEM_PKG.Fedora.gdbm=	gdbm-devel
SYSTEM_PKG.Ubuntu.gdbm=	libgdbm-dev
SYSTEM_PKG.Debian.gdbm=	libgdbm-dev
SYSTEM_PKG.NetBSD.gdbm=	databases/gdbm

endif # GDBM_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
