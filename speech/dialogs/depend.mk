# Copyright (c) 2010 LAAS/CNRS
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
#                                        Severin Lemaignan on 25 Jan 2011

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
DIALOGS_DEPEND_MK:=	${DIALOGS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		dialogs
endif

ifeq (+,$(DIALOGS_DEPEND_MK)) # -----------------------------------------------

PREFER.dialogs?=		robotpkg

DEPEND_USE+=		dialogs
DEPEND_ABI.dialogs?=	dialogs>=0.5
DEPEND_DIR.dialogs?=	../../speech/dialogs

DEPEND_PYTHONPATH.py-setuptools=\
	$(dir $(word 1,${SYSTEM_FILES.dialogs}))..

_pynamespec=python{2.6,2.5,2.4,[0-9].[0-9],}
SYSTEM_SEARCH.dialogs=\
	'lib/${_pynamespec}/{site,dist}-packages/dialogs/__init__.py'

endif # DIALOGS_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
