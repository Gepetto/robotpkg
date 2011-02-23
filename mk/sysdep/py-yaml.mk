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

USE_LANGUAGES+=		python

DEPEND_USE+=		py-yaml
DEPEND_ABI.py-yaml?=	py-yaml

_pynamespec=python{2.6,2.5,2.4,[0-9].[0-9],}
SYSTEM_SEARCH.py-yaml=\
	'lib/${_pynamespec}/{site,dist}-packages/yaml/__init__.py'

SYSTEM_PKG.Linux-fedora.py-yaml=	PyYAML
SYSTEM_PKG.NetBSD.py-yaml=		pkgsrc/textproc/py-yaml

endif # PYYAML_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
