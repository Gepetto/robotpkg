# $LAAS: autoconf.mk 2009/03/11 21:38:09 mallet $
#
# Copyright (c) 2009 LAAS/CNRS
# All rights reserved.
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without   fee is hereby granted, provided   that the above  copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS  SOFTWARE INCLUDING ALL  IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR  BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR  ANY DAMAGES WHATSOEVER RESULTING  FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION,   ARISING OUT OF OR IN    CONNECTION WITH THE USE   OR
# PERFORMANCE OF THIS SOFTWARE.
#
#                                             Anthony Mallet on Tue Mar 10 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
AUTOCONF_DEPEND_MK:=	${AUTOCONF_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		autoconf
endif

ifeq (+,$(AUTOCONF_DEPEND_MK)) # -------------------------------------------

PREFER.autoconf?=	system

DEPEND_USE+=		autoconf
DEPEND_ABI.autoconf?=	autoconf>=2.59
DEPEND_METHOD.autoconf?=build
SYSTEM_SEARCH.autoconf=\
	'bin/autoconf:/autoconf/{s/[^0-9.]*\([0-9.]*\).*/\1/;p;q;}:% -V' \
	'bin/autoreconf'

export AUTOCONF=		${PREFIX.autoconf}/bin/autoconf
export AUTORECONF=		${PREFIX.autoconf}/bin/autoreconf

GNU_CONFIGURE?=		yes
AUTORECONF_ARGS?=	-fi

autoreconf:
	${RUN}								\
$(foreach _dir_,${CONFIGURE_DIRS},					\
	${STEP_MSG} "Running ${AUTORECONF} in ${_dir_}";		\
	cd ${WRKSRC} && cd ${_dir_} && ${SETENV}			\
	  ${_CONFIGURE_SCRIPT_ENV} ${AUTORECONF} ${AUTORECONF_ARGS};	\
)


endif # AUTOCONF_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

