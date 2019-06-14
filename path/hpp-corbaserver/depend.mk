# robotpkg depend.mk for:	path/hpp-corbaserver
# Created:			Anthony Mallet on Thu, 9 Apr 2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
HPP_CORBASERVER_DEPEND_MK:=	${HPP_CORBASERVER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			hpp-corbaserver
endif

ifeq (+,$(HPP_CORBASERVER_DEPEND_MK)) # ------------------------------------

PREFER.hpp-corbaserver?=	robotpkg

DEPEND_USE+=			hpp-corbaserver

DEPEND_ABI.hpp-corbaserver?=	hpp-corbaserver>=4.6.1
DEPEND_DIR.hpp-corbaserver?=	../../path/hpp-corbaserver

SYSTEM_SEARCH.hpp-corbaserver=\
  'include/hpp/corbaserver/server.hh'				\
  'lib/libhpp-corbaserver.so'					\
  'lib/pkgconfig/hpp-corbaserver.pc:/Version/s/[^0-9.]//gp'

# need omniidl_be in PYTHONPATH
PYTHONPATH.hpp-corbaserver+=	$(dir ${SYSTEM_FILES.omniORBpy})

include ../../middleware/omniORB/depend.mk
include ../../middleware/py-omniORBpy/depend.mk
include ../../path/hpp-core/depend.mk
include ../../path/hpp-constraints/depend.mk
include ../../math/hpp-pinocchio/depend.mk

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
