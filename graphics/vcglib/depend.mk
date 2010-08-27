# robotpkg depend.mk for:	modeling/vcglib
# Created:			nksallem on Wed, 25 Aug 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
VCGLIB_DEPEND_MK:=	${VCGLIB_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		vcglib
endif

ifeq (+,$(VCGLIB_DEPEND_MK)) # ---------------------------------------------

PREFER.vcglib?=		robotpkg

DEPEND_USE+=		vcglib

DEPEND_ABI.vcglib?=	vcglib>=20100824
DEPEND_DIR.vcglib?=	../../graphics/vcglib

SYSTEM_SEARCH.vcglib=\
	include/vcglib/vcg/complex/all_types.h		\
	include/vcglib/vcg/simplex/vertex/base.h	\
	include/vcg/space/space.h

endif # VCGLIB_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
