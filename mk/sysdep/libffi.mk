# robotpkg sysdep/libffi.mk
# Created:			Anthony Mallet on Tue, 20 Sep 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBFFI_DEPEND_MK:=	${LIBFFI_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libffi
endif

ifeq (+,$(LIBFFI_DEPEND_MK)) # ---------------------------------------------

PREFER.libffi?=		system

DEPEND_USE+=		libffi

DEPEND_ABI.libffi?=	libffi>=3

SYSTEM_SEARCH.libffi=\
	'{,lib/libffi*/}include/ffi.h'					\
	'lib/libffi.{so,a}'						\
	'lib/pkgconfig/libffi.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.libffi=	libffi-devel
SYSTEM_PKG.Ubuntu.libffi=	libffi-dev
SYSTEM_PKG.NetBSD.libffi=	pkgsrc/devel/libffi

endif # LIBFFI_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
