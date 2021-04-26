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

include ../../meta-pkgs/hpp/depend.common
DEPEND_ABI.py-hpp-corbaserver?=	${PKGTAG.python-}hpp-corbaserver>=${HPP_MIN_VERSION}
DEPEND_DIR.py-hpp-corbaserver?=	../../path/py-hpp-corbaserver

SYSTEM_SEARCH.py-hpp-corbaserver=								\
  'include/hpp/corbaserver/config.hh:/HPP_CORBASERVER_VERSION /s/[^0-9.]//gp'			\
  'lib/cmake/hpp-corbaserver/hpp-corbaserverConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
  'lib/libhpp-corbaserver.so'									\
  'lib/pkgconfig/hpp-corbaserver.pc:/Version/s/[^0-9.]//gp'					\
  'share/hpp-corbaserver/package.xml:/<version>/s/[^0-9.]//gp'

# need omniidl_be in PYTHONPATH
PYTHONPATH.py-hpp-corbaserver+=	$(dir ${SYSTEM_FILES.omniORBpy})

include ../../middleware/omniORB/depend.mk
include ../../middleware/py-omniORBpy/depend.mk
include ../../path/hpp-core/depend.mk
include ../../path/hpp-constraints/depend.mk
include ../../math/hpp-pinocchio/depend.mk

endif # --------------------------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
