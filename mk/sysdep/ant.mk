# $LAAS: ant.mk 2009/06/03 11:11:53 mallet $
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
#                                          Séverin Lemaignan on Wed Jun  3 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ANT_DEPEND_MK:=		${ANT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ant
endif

ifeq (+,$(ANT_DEPEND_MK)) # ------------------------------------------------

PREFER.ant?=		system

DEPEND_USE+=		ant
DEPEND_ABI.ant?=	ant>=1.7
DEPEND_METHOD.ant+=	build
SYSTEM_SEARCH.ant=	'bin/ant:s/[^.0-9]//gp:% -version'

export ANT=		${PREFIX.ant}/bin/ant
ANT_ARGS?=		# empty

# modify the build target. By chance, ant accept -f <file> as make(1) does.
MAKE_PROGRAM?=		${ANT}
MAKE_FILE?=		build.xml
MAKE_ENV+=		ANT_ARGS=$(call quote,${ANT_ARGS})
MAKE_ENV+=		JAVACMD=$(call quote,${JAVA_HOME}/bin/java)

BUILD_TARGET?=		# empty

include ../../lang/sun-jdk6/depend.mk

endif # ANT_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
