# robotpkg depend.mk for:	audio/clone-genom
# Created:			Matthieu Herrb on Wed, 21 Jan 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
CLONEGENOM_DEPEND_MK:=	${CLONEGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		clone-genom
endif

ifeq (+,$(CLONEGENOM_DEPEND_MK))
PREFER.clone-genom?=	robotpkg

DEPEND_USE+=		clone-genom

DEPEND_ABI.clone-genom?=	clone-genom>=0.1
DEPEND_DIR.clone-genom?=	../../audio/clone-genom

SYSTEM_SEARCH.clone-genom=\
	include/clone/cloneStruct.h		\
	'lib/pkgconfig/clone.pc:/Version/s/[^0-9.]*//p'

include ../../architecture/genom/depend.mk

endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
