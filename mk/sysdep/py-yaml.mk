# robotpkg sysdep/py-yaml.mk
# Created:			Anthony Mallet on Thu,  9 Sep 2010
#

# YAML is a data serialization format designed for human readability and
# interaction with scripting languages.  PyYAML is a YAML parser and
# emitter for Python.

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYYAML_DEPEND_MK:=	${PYYAML_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		py-yaml
endif

ifeq (+,$(PYYAML_DEPEND_MK)) # ---------------------------------------------

PREFER.py-yaml?=	system

DEPEND_USE+=		py-yaml
DEPEND_ABI.py-yaml?=	${PKGTAG.python-}yaml>=3

SYSTEM_SEARCH.py-yaml=\
	'${PYTHON_SYSLIBSEARCH}/yaml/__init__.py:/__version__/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.py-yaml=	PyYAML (python-${PYTHON_VERSION})
SYSTEM_PKG.Ubuntu.py-yaml=	python-yaml (python-${PYTHON_VERSION})
SYSTEM_PKG.Debian.py-yaml=	python-yaml (python-${PYTHON_VERSION})
SYSTEM_PKG.NetBSD.py-yaml=	pkgsrc/textproc/${PKGTAG.python-}yaml
SYSTEM_PKG.Gentoo.py-yaml=	dev-python/pyyaml (python-${PYTHON_VERSION})

include ../../mk/sysdep/python.mk

endif # PYYAML_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
