# robotpkg depend.mk for:	hardware/gbx-hokuyo-aist
# Created:			Anthony Mallet on Wed, 17 Mar 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GBX_HOKUYO_AIST_DEPEND_MK:=${GBX_HOKUYO_AIST_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gbx-hokuyo-aist
endif

ifeq (+,$(GBX_HOKUYO_AIST_DEPEND_MK)) # ------------------------------------

PREFER.gearbox?=	robotpkg
PREFER.gbx-hokuyo-aist?=${PREFER.gearbox}

SYSTEM_SEARCH.gbx-hokuyo-aist=\
	'include/gearbox/hokuyo_aist/hokuyo_aist.h'			\
	'lib/pkgconfig/hokuyo_aist.pc:/Version/s/[^.0-9]//gp'		\
	'lib/gearbox/libhokuyo_aist.{so,a}'

DEPEND_USE+=		gbx-hokuyo-aist

DEPEND_ABI.gbx-hokuyo-aist?=	gbx-hokuyo-aist>=1.0.0
DEPEND_DIR.gbx-hokuyo-aist?=	../../hardware/gbx-hokuyo-aist

endif # GBX_HOKUYO_AIST_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
