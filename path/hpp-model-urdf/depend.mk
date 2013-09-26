# robotpkg depend.mk for:	path/hpp-model-urdf
# Created:			Florent Lamiraux on Tue, 30 Jul 2013
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_MODEL_URDF_DEPEND_MK:=	${HPP_MODEL_URDF_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-model-urdf
endif

ifeq (+,$(HPP_MODEL_URDF_DEPEND_MK)) # --------------------------------------

PREFER.hpp-model-urdf?=	robotpkg

DEPEND_USE+=		hpp-model-urdf

DEPEND_ABI.hpp-model-urdf?=	hpp-model-urdf>=0.4
DEPEND_DIR.hpp-model-urdf?=	../../path/hpp-model-urdf

SYSTEM_SEARCH.hpp-model-urdf=			\
	lib/libhpp-model-urdf.so		\
	include/hpp/model/urdf/parser.hh	\
	'lib/pkgconfig/hpp-model-urdf.pc:/Version/s/[^0-9.]//gp'

endif # HPP_MODEL_URDF_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
