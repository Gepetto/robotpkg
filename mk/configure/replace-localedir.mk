#
# Copyright (c) 2006 LAAS/CNRS                        --  Thu Dec  7 2006
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
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
#
# From $NetBSD: replace-localedir.mk,v 1.2 2006/08/03 16:49:48 salo Exp $
# Copyright (c) 1994-2006 The NetBSD Foundation, Inc.
#
#   3. All advertising materials mentioning   features or use of this
#      software must display the following acknowledgement:
#        This product includes software developed by the NetBSD
#        Foundation, Inc. and its contributors.
#   4. Neither the  name  of The NetBSD Foundation  nor the names  of its
#      contributors  may be  used to endorse or promote  products derived
#      from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHORS AND CONTRIBUTORS ``AS IS'' AND
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
# 

# --- replace-localedir (PRIVATE) ------------------------------------
#
# replace-localedir replaces the path to the locale directory in
# various Makefiles with the one chosen by pkgsrc (PKGLOCALEDIR).
#
.PHONY: replace-localedir
replace-localedir:
	@${DO_NADA}

replace-localedir: subst-pkglocaledir

_PKGLOCALEDIR=	${PREFIX}/${PKGLOCALEDIR}/locale
REPLACE_LOCALEDIR?=	# empty
REPLACE_LOCALEDIR_PATTERNS?=	# empty

_REPLACE_LOCALEDIR_PATTERNS=	${REPLACE_LOCALEDIR_PATTERNS}
ifdef HAS_CONFIGURE
_REPLACE_LOCALEDIR_PATTERNS+=	[Mm]akefile.in*
else
_REPLACE_LOCALEDIR_PATTERNS+=	[Mm]akefile*
endif
_REPLACE_LOCALEDIR_PATTERNS_FIND_cmd=					\
	cd ${WRKSRC} &&							\
	${ECHO} ${REPLACE_LOCALEDIR} && 				\
	${FIND} . \( $(wordlist 2, 99, $(patsubst %,-o -name "%",${_REPLACE_LOCALEDIR_PATTERNS})) \) \! -name "*.orig" -print | \
	${SED} -e 's|^\./||' |						\
	${SORT} -u

_REPLACE_LOCALEDIR= ${_REPLACE_LOCALEDIR_PATTERNS_FIND_cmd}

ifeq (,$(call isno,${USE_PKGLOCALEDIR}))
SUBST_CLASSES+=			pkglocaledir
endif
SUBST_STAGE.pkglocaledir=	do-configure-pre-hook
SUBST_MESSAGE.pkglocaledir=	Fixing locale directory references.
SUBST_FILES.pkglocaledir=	`${_REPLACE_LOCALEDIR}`
SUBST_SED.pkglocaledir=		\
	-e 's|^\(localedir[ 	:]*=\).*|\1 ${_PKGLOCALEDIR}|'		\
	-e 's|^\(itlocaledir[ 	:]*=\).*|\1 ${_PKGLOCALEDIR}|'		\
	-e 's|^\(gnulocaledir[ 	:]*=\).*|\1 ${_PKGLOCALEDIR}|'		\
	-e 's|\(-DLOCALEDIR[ 	]*=\)[^ 	]*\(\.\*\)|\1"\\"${_PKGLOCALEDIR}\\""\2|'
