# robotpkg depend.mk for:	motion/libmwalk
# Created:			Anthony Mallet on Wed, 28 Jul 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBMWALK_DEPEND_MK:=	${LIBMWALK_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libmwalk
endif

ifeq (+,$(LIBMWALK_DEPEND_MK)) # -------------------------------------------

PREFER.libmwalk?=	robotpkg

DEPEND_USE+=		libmwalk

DEPEND_ABI.libmwalk?=	libmwalk>=1.1
DEPEND_DIR.libmwalk?=	../../motion/libmwalk

SYSTEM_SEARCH.libmwalk=\
	include/mwalk/MwalkGenerator.h				\
	'lib/pkgconfig/libmwalk.pc:/Version/s/[^0-9.]//gp'

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
