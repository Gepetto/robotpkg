# robotpkg depend.mk for:	devel/hpp-model
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
	include/hppModel/hppDevice.h	\
	lib/libhppModel.la

DEPEND_USE+=		hpp-model

DEPEND_ABI.hpp-model?=	hpp-model>=1.7.5
DEPEND_DIR.hpp-model?=	../../devel/hpp-model

include ../../path/kineo-pp/depend.mk

endif # HPP_MODEL_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
