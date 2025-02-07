# robotpkg sysdep/libfmt.mk
# Created:			Anthony Mallet on Fri,  7 Feb 2025
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBFMT_DEPEND_MK:=	${LIBFMT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libfmt
endif

ifeq (+,$(LIBFMT_DEPEND_MK)) # ---------------------------------------------

PREFER.libfmt?=		system

DEPEND_USE+=		libfmt

DEPEND_ABI.libfmt?=	libfmt

SYSTEM_SEARCH.libfmt=\
  'include/fmt/core.h'					\
  'lib/libfmt.so'					\
  'lib/cmake/fmt/fmt-config.cmake'			\
  'lib/pkgconfig/fmt.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.libfmt=	fmt-devel
SYSTEM_PKG.Ubuntu.libfmt=	libfmt-dev
SYSTEM_PKG.NetBSD.libfmt=	texproc/fmtlib

endif # LIBFMT_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
