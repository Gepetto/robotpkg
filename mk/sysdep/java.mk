#
# Copyright (c) 2012 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use  in  source  and binary  forms,  with  or  without
# modification, are permitted provided that the following conditions are met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
# THE SOFTWARE  IS PROVIDED "AS IS"  AND THE AUTHOR  DISCLAIMS ALL WARRANTIES
# WITH  REGARD   TO  THIS  SOFTWARE  INCLUDING  ALL   IMPLIED  WARRANTIES  OF
# MERCHANTABILITY AND  FITNESS.  IN NO EVENT  SHALL THE AUTHOR  BE LIABLE FOR
# ANY  SPECIAL, DIRECT,  INDIRECT, OR  CONSEQUENTIAL DAMAGES  OR  ANY DAMAGES
# WHATSOEVER  RESULTING FROM  LOSS OF  USE, DATA  OR PROFITS,  WHETHER  IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR  OTHER TORTIOUS ACTION, ARISING OUT OF OR
# IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
#
#                                           Anthony Mallet on Wed Jul 11 2012
#

#
# Java language definitions
#
# This file determines which JVM version is used as a dependency for a
# package.
#
# === User-settable variables ===
#
# PREFER_ALTERNATIVE.java
#	The preferred JVM version to use. The order of the entries matters,
#	since earlier entries are preferred over later ones.
#
#	Possible values: openjdk sun
#	Default: openjdk sun
#
# === Package-settable variables ===
#
# DEPEND_ABI.java
#	The JVM versions that are acceptable for the package.
#
#	Possible values: any pattern
#	Default: java>=6
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JAVA_DEPEND_MK:=	${JAVA_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
  DEPEND_PKG+=		${PKG_ALTERNATIVE.java}
endif

ifeq (+,$(JAVA_DEPEND_MK)) # -----------------------------------------------

DEPEND_USE+=		${PKG_ALTERNATIVE.java}

DEPEND_ABI.java?=	java>=1.6
DEPEND_METHOD.java?=	full

# define an alternative for available jvm packages
PKG_ALTERNATIVES+=		java
PKG_ALTERNATIVES.java?=		openjdk sun

PREFER_ALTERNATIVE.java?=	openjdk sun

PKG_ALTERNATIVE_DESCR.openjdk=	Use openjdk JVM
PKG_ALTERNATIVE_SELECT.openjdk:=ok # non-empty
define PKG_ALTERNATIVE_SET.openjdk
  DEPEND_ABI.openjdk?=	$(subst java,openjdk,${DEPEND_ABI.java})
  include ../../mk/sysdep/openjdk.mk
endef

PKG_ALTERNATIVE_DESCR.sun=	Use sun JVM
PKG_ALTERNATIVE_SELECT.sun:=	ok # non-empty
define PKG_ALTERNATIVE_SET.sun
  DEPEND_ABI.sun-jdk?=	$(subst java,sun-jdk,${DEPEND_ABI.java})
  include ../../lang/sun-jdk/depend.mk
endef

endif # JAVA_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
