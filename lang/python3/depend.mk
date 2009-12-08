# $LAAS: depend.mk 2009/03/10 10:12:03 mallet $
#
# Copyright (c) 2008-2009 LAAS/CNRS
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
#                                    Séverin Lemaignan on Mon Dec 7 2009
#

#
# This Makefile fragment defines additional variables that are used
# by packages that need python.
#
# Optional variables that may be defined by the package are:
#
#	PYTHON_REQD is the version of python required, e.g. "3.1.1".
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PYTHON3_DEPEND_MK:=	${PYTHON3_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		python3
endif

ifeq (+,$(PYTHON3_DEPEND_MK)) # ---------------------------------------------

PREFER.python3?=	robotpkg

PYTHON_REQD?=		3.0

DEPEND_USE+=		python3

DEPEND_ABI.python3?=	python3>=3.0.0
DEPEND_DIR.python3?=	../../lang/python3

DEPEND_METHOD.python3?=build

SYSTEM_SEARCH.python3=\
	'bin/python{[0-9].[0-9],${PYTHON_REQD},}:s/[^.0-9]//gp:% --version'

_PYTHON_VERSION=$(word 1,$(shell ${PYTHON} -c "import sys; print (sys.version)"))
_PYTHON_PREFIX=	$(shell ${PYTHON} -c "import sys; (print sys.prefix)")
PYTHON_SITELIB=	$(shell ${PYTHON} -c \
 "from distutils import sysconfig; print (sysconfig.get_python_lib(0,0,prefix=''))")

# Add extra replacement in PLISTs
#PLIST_SUBST+=\
#	PLIST_PYTHON_SITELIB=$(call quote,${PYTHON_SITELIB})
#PRINT_PLIST_AWK_SUBST+=\
#	gsub("${PYTHON_SITELIB}/", "$${PYTHON_SITELIB}/");

endif # PYTHON_DEPEND_MK ---------------------------------------------------
DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

