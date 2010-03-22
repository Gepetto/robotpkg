#
# Copyright (c) 2010 LAAS/CNRS
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
#                                          Séverin Lemaignan on Mon 22 Mar 2010
#


DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OROALTERITE_DEPEND_MK:=	${OROALTERITE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		oro-alterite
endif

ifeq (+,$(OROALTERITE_DEPEND_MK)) # -----------------------------------------------

PREFER.oro-alterite?=		robotpkg

DEPEND_USE+=		oro-alterite
DEPEND_ABI.oro-alterite?=	oro-alterite>=1.0
DEPEND_DIR.oro-alterite?=	../../knowledge/oro-alterite

SYSTEM_SEARCH.oro-alterite=\
	java/oro-server/plugins/Alterite.jar

endif # OROALTERITE_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
