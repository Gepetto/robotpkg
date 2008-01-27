# Copyright (c) 2008 IS/AIST-ST2I/CNRS
#      Joint Japanese-French Robotics Laboratory (JRL).
# All rights reserved.
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice,  this list of  conditions and  the following disclaimer in
#      the  documentation   and/or  other  materials   provided with  the
#      distribution.
#

#
# This Makefile fragment defines additional variables that are used
# by packages that need python.
#
# Optional variables that may be defined by the package are:
#
#	PYTHON_REQD is the version of python required, e.g. "2.4".
#

ifneq (,$(findstring python,$(USE_TOOLS)))

ifdef PYTHON_REQD
_PYTHON=	python${PYTHON_REQD}
else
_PYTHON=	python python2.5 python2.4 python2.3
endif

TOOLS_PYTHON=		$(call pathsearch,${_PYTHON},${PATH})

ifeq (,$(TOOLS_PYTHON))
PKG_FAIL_REASON+=	"[python.mk] The package uses python, but no python executable was found."
endif

# Define PYTHON_* variables that locate the site directories for
# ${TOOLS_PYTHON}.

ifndef _PYTHON_VERSION
_PYTHON_VERSION=$(word 1,$(shell $(TOOLS_PYTHON) -c "import sys; print sys.version"))
endif
ifndef _PYTHON_PREFIX
_PYTHON_PREFIX=$(shell $(TOOLS_PYTHON) -c "import sys; print sys.prefix")
endif
ifndef PYTHON_SITELIB
PYTHON_SITELIB=$(shell $(TOOLS_PYTHON) -c \
	"from distutils import sysconfig; print sysconfig.get_python_lib(0,0,prefix='')")
endif

# Add extra replacement in PLISTs
PLIST_SUBST+=\
	PLIST_PYTHON_SITELIB=$(call quote,${PYTHON_SITELIB})
PRINT_PLIST_AWK_SUBST+=\
	gsub("${PYTHON_SITELIB}/", "$${PYTHON_SITELIB}/");

endif # USE_TOOLS=python
