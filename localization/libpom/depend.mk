# robotpkg depend.mk for:	localization/libpom
# Created:			Anthony Mallet on Tue, 27 Oct 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBPOM_DEPEND_MK:=	${LIBPOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libpom
endif

ifeq (+,$(LIBPOM_DEPEND_MK)) # ---------------------------------------------

PREFER.libpom?=		robotpkg

DEPEND_USE+=		libpom

DEPEND_ABI.libpom?=	libpom>=1.2
DEPEND_DIR.libpom?=	../../localization/libpom

SYSTEM_SEARCH.libpom=\
	include/libpom/lib.h	\
	'lib/pkgconfig/libpom.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
