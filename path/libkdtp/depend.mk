# robotpkg depend.mk for:	path/libkdtp
# Created:			Anthony Mallet on Tue, 13 Dec 2016
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBKDTP_DEPEND_MK:=	${LIBKDTP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libkdtp
endif

ifeq (+,$(LIBKDTP_DEPEND_MK)) # --------------------------------------------

PREFER.libkdtp?=	robotpkg

DEPEND_USE+=		libkdtp

DEPEND_ABI.libkdtp?=	libkdtp>=1.1
DEPEND_DIR.libkdtp?=	../../path/libkdtp

SYSTEM_SEARCH.libkdtp=\
  'include/libkdtp.h'					\
  'lib/pkgconfig/libkdtp.pc:/Version/s/[^0-9.]//gp'

endif # LIBKDTP_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
