# robotpkg depend.mk for:	path/hpp-openhrp
# Created:			Anthony Mallet on Wed, 10 Dec 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_OPENHRP_DEPEND_MK:=	${HPP_OPENHRP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-openhrp
endif

ifeq (+,$(HPP_OPENHRP_DEPEND_MK)) # ----------------------------------

PREFER.hpp-openhrp?=	robotpkg

DEPEND_USE+=		hpp-openhrp

DEPEND_ABI.hpp-openhrp?=hpp-openhrp>=1.6
DEPEND_DIR.hpp-openhrp?=../../path/hpp-openhrp

SYSTEM_SEARCH.hpp-openhrp=\
	include/hppOpenHRP/parserOpenHRPKineo.h		\
	'lib/pkgconfig/hppOpenHRP.pc:/Version/s/[^0-9.]//gp'

endif # HPP_OPENHRP_DEPEND_MK ----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
