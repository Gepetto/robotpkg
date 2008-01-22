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
#	PYTHON_REQD is the minimum version of python required.
#

ifneq (,$(strip $(findstring python,$(USE_TOOLS))))

PYTHON_REQD?=	#empty
TOOLS_PYTHON=		$(call pathsearch,python$(PYTHON_REQD))

# Define PYTHON_* variables that locate the site directories for
# ${PYTHON}.  These variables depend on PERL5 being properly defined
# and existing on the filesystem. 

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

endif # USE_TOOLS
