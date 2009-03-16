#
# Copyright (c) 2008-2009 LAAS/CNRS
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
# THIS SOFTWARE IS PROVIDED BY THE  AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY  EXPRESS OR IMPLIED WARRANTIES, INCLUDING,  BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES   OF MERCHANTABILITY AND  FITNESS  FOR  A PARTICULAR
# PURPOSE ARE DISCLAIMED.  IN NO  EVENT SHALL THE AUTHOR OR  CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT,  INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING,  BUT  NOT LIMITED TO, PROCUREMENT  OF
# SUBSTITUTE  GOODS OR SERVICES;  LOSS   OF  USE,  DATA, OR PROFITS;   OR
# BUSINESS  INTERRUPTION) HOWEVER CAUSED AND  ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE  USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

# Authored by Anthony Mallet on Tue May  6 2008

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
FESTLEX_POSLEX_DEPEND_MK:=${FESTLEX_POSLEX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		festlex-poslex
endif

ifeq (+,$(FESTLEX_POSLEX_DEPEND_MK)) # -------------------------------

include ../../audio/festival/depend.mk
PREFER.festlex-poslex?=	${PREFER.festival}

include ../../mk/robotpkg.prefs.mk
ifneq (${PREFER.festival},${PREFER.festlex-poslex})
  PKG_FAIL_REASON+=\
	"PREFER.festival and PREFER.festlex-poslex must be set to the same value."
endif

SYSTEM_PKG.NetBSD.festlex-poslex=	pkgsrc/audio/festlex-poslex
SYSTEM_SEARCH.festlex-poslex=\
	share/festival/lib/dicts/wsj.wp39.poslexR

DEPEND_USE+=		festlex-poslex

DEPEND_ABI.festlex-poslex?=	festlex-poslex>=1.96
DEPEND_DIR.festlex-poslex?=	../../audio/festlex-poslex

endif # FESTLEX_POSLEX_DEPEND_MK -------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
