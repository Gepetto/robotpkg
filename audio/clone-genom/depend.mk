
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
CLONEGENOM_DEPEND_MK:=	${CLONEGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		clone-genom
endif

ifeq (+,$(CLONEGENOM_DEPEND_MK))
PREFER.clone-genom?=	robotpkg

DEPEND_USE+=		clone-genom

DEPEND_ABI.clone-genom?=	clone-genom>=1.0
DEPEND_DIR.clone-genom?=	../../audio/clone-genom

SYSTEM_SEARCH.clone-genom=\
	include/clone/cloneStruct.h		\
	lib/pkgconfig/clone.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
