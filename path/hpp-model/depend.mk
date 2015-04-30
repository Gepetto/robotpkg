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

# This package leaks eigen3 in its public headers.
# And it requires eigen3 >= 3.2: override PREFER defaults where needed.
# This works only if this file is included before math/eigen3/depend.mk
ifneq (,$(filter eigen3,${DEPEND_USE}))
  PKG_FAIL_REASON +=\
    "You have to include path/hpp-model/depend.mk before math/eigen3/depend.mk"
endif

DEPEND_ABI.eigen3 += eigen3>=3.2.0
include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Ubuntu,${OPSYS})
  ifneq (,$(filter 12.04,${OS_VERSION}))
    PREFER.eigen3?=	robotpkg
  endif
endif
include ../../math/eigen3/depend.mk

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
