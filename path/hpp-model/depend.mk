# robotpkg depend.mk for:	path/hpp-model
# Created:			Anthony Mallet on Wed, 14 May 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_MODEL_DEPEND_MK:=	${HPP_MODEL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-model
endif

ifeq (+,$(HPP_MODEL_DEPEND_MK)) # ------------------------------------

PREFER.hpp-model?=	robotpkg

SYSTEM_SEARCH.hpp-model=\
	include/hpp/model/device.hh	\
	lib/libhpp-model.so

DEPEND_USE+=		hpp-model

DEPEND_ABI.hpp-model?=	hpp-model>=3.1.1
DEPEND_DIR.hpp-model?=	../../path/hpp-model

endif # HPP_MODEL_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
