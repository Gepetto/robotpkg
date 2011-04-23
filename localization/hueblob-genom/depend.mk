# robotpkg depend.mk for:	localization/hueblob-genom
# Created:			Anthony Mallet on Wed, 24 Mar 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HUEBLOB_GENOM_DEPEND_MK:=${HUEBLOB_GENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hueblob-genom
endif

ifeq (+,$(HUEBLOB_GENOM_DEPEND_MK)) # --------------------------------------

PREFER.speet-genom?=	robotpkg

DEPEND_USE+=		hueblob-genom

DEPEND_ABI.hueblob-genom?=hueblob-genom>=1.2
DEPEND_DIR.hueblob-genom?=../../localization/hueblob-genom

SYSTEM_SEARCH.hueblob-genom=\
	include/hueblob/hueblobStruct.h					\
	'lib/pkgconfig/hueblob.pc:/Version/s/[^0-9.]//gp'


include ../../architecture/genom/depend.mk

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

