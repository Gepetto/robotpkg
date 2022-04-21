# robotpkg depend.mk for:	devel/py-ament-package
# Created:			Anthony Mallet on Wed, 23 Mar 2022
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PY_AMENT_PACKAGE_DEPEND_MK:=	${PY_AMENT_PACKAGE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			py-ament-package
endif

ifeq (+,$(PY_AMENT_PACKAGE_DEPEND_MK)) # -----------------------------------

include ../../meta-pkgs/ros2-core/depend.common

ROS2_DEPEND_USE+=		py-ament-package

DEPEND_ABI.py-ament-package?=	${PKGTAG.python}-ament-package>=0
DEPEND_DIR.py-ament-package?=	../../sysutils/py-ament-package

SYSTEM_SEARCH.py-ament-package=\
  '${PYTHON_SYSLIBSEARCH}/ament_package/__init__.py'			\
  'share/ament_package/package.xml:/<version>/s/[^0-9.]//gp'

DEPEND_ABI.python+= python>=3.6
include ../../mk/sysdep/python.mk

# runtime needs:
# importlib.resource for python>=3.7, but fallbacks to importlib_resources
# importlib.metadata for python>=3.8, but fallbacks to importlib_metadata
define PKG_ALTERNATIVE_SET.python27+=

  include ../../mk/sysdep/py-importlib-metadata.mk
  include ../../mk/sysdep/py-importlib-resources.mk
endef
define PKG_ALTERNATIVE_SET.python34+=

  include ../../mk/sysdep/py-importlib-metadata.mk
  include ../../mk/sysdep/py-importlib-resources.mk
endef
define PKG_ALTERNATIVE_SET.python35+=

  include ../../mk/sysdep/py-importlib-metadata.mk
  include ../../mk/sysdep/py-importlib-resources.mk
endef
define PKG_ALTERNATIVE_SET.python36+=

  include ../../mk/sysdep/py-importlib-metadata.mk
  include ../../mk/sysdep/py-importlib-resources.mk
endef
define PKG_ALTERNATIVE_SET.python37+=

  include ../../mk/sysdep/py-importlib-metadata.mk
endef

endif # PY_AMENT_PACKAGE_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
