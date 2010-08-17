# robotpkg depend.mk for:	devel/gbx-flexiport
# Created:			Anthony Mallet on Wed, 17 Mar 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GBX_FLEXIPORT_DEPEND_MK:=${GBX_FLEXIPORT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gbx-flexiport
endif

ifeq (+,$(GBX_FLEXIPORT_DEPEND_MK)) # --------------------------------------

PREFER.gearbox?=	robotpkg
PREFER.gbx-flexiport?=	${PREFER.gearbox}

SYSTEM_SEARCH.gbx-flexiport=\
	'include/gearbox/flexiport/flexiport.h'			\
	'lib/pkgconfig/flexiport.pc:/Version/s/[^.0-9]//gp'	\
	'lib/gearbox/libflexiport.*'

DEPEND_USE+=		gbx-flexiport

DEPEND_ABI.gbx-flexiport?=	gbx-flexiport>=1.0.0
DEPEND_DIR.gbx-flexiport?=	../../devel/gbx-flexiport

endif # GBX_FLEXIPORT_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
