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
FESTIVAL_DEPEND_MK:=	${FESTIVAL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		festival
endif

ifeq (+,$(FESTIVAL_DEPEND_MK)) # -------------------------------------

PREFER.festival?=	system

DEPEND_USE+=		festival
DEPEND_ABI.festival?=	festival>=1.96
DEPEND_DIR.festival?=	../../audio/festival

SYSTEM_SEARCH.festival=\
	bin/festival			\
	include/festival/festival.h	\
	'lib/libFestival.{a,so}'

SYSTEM_PKG.Linux-fedora.festival=	festival festival-devel
SYSTEM_PKG.NetBSD.festival=		pkgsrc/audio/festival

ifneq (,$(findstring ogireslpc,${REQD_BUILD_OPTIONS.festival}))
  # ogireslpc isn't packaged on most systems
  include ../../mk/robotpkg.prefs.mk
  ifneq (robotpkg,${PREFER.festival})
    PKG_FAIL_REASON+=\
	"You must set PREFER.festival=robotpkg for the ogireslpc option."
  endif

  SYSTEM_DESCR.festival='${DEPEND_ABI.festival} with OGIreslpc synthetiser'
  SYSTEM_SEARCH.festival+=share/festival/lib/ogi_configure_voice.scm
endif

endif # FESTIVAL_DEPEND_MK -------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
