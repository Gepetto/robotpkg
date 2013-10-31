# robotpkg depend.mk for:	path/hpp-environment-data
# Created:			Anthony Mallet on Wed, 17 Sep 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPPENVIRONMENTDATA_DEPEND_MK:=	${HPPENVIRONMENTDATA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-environment-data
endif

ifeq (+,$(HPPENVIRONMENTDATA_DEPEND_MK)) # --------------------------------------

PREFER.hpp-environment-data?=	robotpkg

DEPEND_USE+=		hpp-environment-data

DEPEND_ABI.hpp-environment-data?=	hpp-environment-data>=1.0
DEPEND_DIR.hpp-environment-data?=	../../path/hpp-environment-data

SYSTEM_SEARCH.hpp-environment-data=\
	'lib/pkgconfig/hpp-environment-data.pc:/Version/s/[^0-9.]//gp'

endif # HPPENVIRONMENTDATA_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
