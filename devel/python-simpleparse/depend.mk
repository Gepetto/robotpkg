# Copyright (c) 2010 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
#                                      Thomas Moulard on Mon Jun 07 2010
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
PYTHON_SIMPLEPARSE_DEPEND_MK:=	${PYTHON_SIMPLEPARSE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python-simpleparse
endif

ifeq (+,$(PYTHON_SIMPLEPARSE_DEPEND_MK)) # --------------------------------------

PREFER.python-simpleparse?=	robotpkg

DEPEND_USE+=			python-simpleparse

DEPEND_ABI.python-simpleparse?=	python-simpleparse>=2.1.1
DEPEND_DIR.python-simpleparse?=	../../devel/python-simpleparse

#SYSTEM_PKG.Linux-fedora.libpng=
SYSTEM_PKG.Linux-ubuntu.libpng=	python-simpleparse
#SYSTEM_PKG.Linux-debian.libpng=
#SYSTEM_PKG.NetBSD.libpng=

SYSTEM_SEARCH.python-simpleparse=		\
	'lib/python*/site-packages/SimpleParse-*.egg/simpleparse/__init__.py'

endif # PYTHON_SIMPLEPARSE_DEPEND_MK --------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
