# robotpkg path/sysdep/libcdd.mk
# Created: Guilhem Saurel on Thu, 3 Jan 2019
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBCDD_DEPEND_MK:=	${LIBCDD_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libcdd
endif

ifeq (+,$(LIBCDD_DEPEND_MK)) # ------------------------------------------------

PREFER.libcdd?=		system
DEPEND_USE+=		libcdd
DEPEND_ABI.libcdd?=	libcdd>=0.94

SYSTEM_SEARCH.libcdd=							\
	'lib/libcdd.so'							\
	'include/{,cdd{,lib}/}cdd.h:s/,.*//;/Version/s/[^0-9a-z.]//gp'

SYSTEM_PKG.Arch.libcdd=		cddlib
SYSTEM_PKG.Debian.libcdd=	libcdd-dev
SYSTEM_PKG.Fedora.libcdd=	cddlib-devel
SYSTEM_PKG.Ubuntu.libcdd=	libcdd-dev

endif # LIBCDD_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
