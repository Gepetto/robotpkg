# robotpkg depend.mk for:	path/py-hpp-corbaserver
# Created:			Anthony Mallet on Thu, 9 Apr 2009
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_HPP_CORBASERVER_DEPEND_MK:=	${PY_HPP_CORBASERVER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-hpp-corbaserver
endif

ifeq (+,$(PY_HPP_CORBASERVER_DEPEND_MK)) # ------------------------------------

include ../../mk/sysdep/python.mk

PREFER.py-hpp-corbaserver?=	robotpkg

DEPEND_USE+=			py-hpp-corbaserver

DEPEND_ABI.py-hpp-corbaserver?=	${PKGTAG.python-}hpp-corbaserver>=4.7.0
DEPEND_DIR.py-hpp-corbaserver?=	../../path/py-hpp-corbaserver

SYSTEM_SEARCH.py-hpp-corbaserver=\
  'include/hpp/corbaserver/server.hh'				\
  'lib/libhpp-corbaserver.so'					\
  'lib/pkgconfig/hpp-corbaserver.pc:/Version/s/[^0-9.]//gp'

# need omniidl_be in PYTHONPATH
PYTHONPATH.py-hpp-corbaserver+=	$(dir ${SYSTEM_FILES.omniORBpy})

include ../../middleware/omniORB/depend.mk
include ../../middleware/py-omniORBpy/depend.mk
include ../../path/hpp-core/depend.mk
include ../../path/hpp-constraints/depend.mk
include ../../math/hpp-pinocchio/depend.mk

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
