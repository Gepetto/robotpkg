# robotpkg depend.mk for:	audio/speett-genom
# Created:			Anthony Mallet on Wed, 24 Mar 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SPEETT_GENOM_DEPEND_MK:=${SPEETT_GENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		speett-genom
endif

ifeq (+,$(SPEETT_GENOM_DEPEND_MK)) # ---------------------------------------

PREFER.speett-genom?=	robotpkg

DEPEND_USE+=		speett-genom

DEPEND_ABI.speett-genom?=speett-genom>=1.0
DEPEND_DIR.speett-genom?=../../audio/speett-genom

SYSTEM_SEARCH.speett-genom=\
	include/speett/speett-struct.h					\
	'lib/pkgconfig/speett.pc:/Version/s/[^0-9.]//gp'


include ../../architecture/genom/depend.mk

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

