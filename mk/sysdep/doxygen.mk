# $LAAS: doxygen.mk 2009/10/06 10:43:58 mallet $
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
#                                      Anthony Mallet on Fri Dec 12 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
DOXYGEN_DEPEND_MK:=	${DOXYGEN_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		doxygen
endif

ifeq (+,$(DOXYGEN_DEPEND_MK)) # --------------------------------------------

PREFER.doxygen?=	system

DEPEND_USE+=		doxygen
DEPEND_ABI.doxygen?=	doxygen>=1.5
DEPEND_METHOD.doxygen+=	build
SYSTEM_SEARCH.doxygen=	'bin/doxygen:p:% --version'

SYSTEM_PKG.Linux.doxygen=	"doxygen"
SYSTEM_PKG.NetBSD.doxygen=	"pkgsrc/devel/doxygen"

# Automatic PLIST generation for doxygen generated files
ifdef DOXYGEN_PLIST_DIR
  GENERATE_PLIST+=							\
	${FIND} $(addprefix ${PREFIX}/,${DOXYGEN_PLIST_DIR})		\
		 \( -type f -o -type l \) -print | ${SORT}		\
		| ${SED} -e "s,${PREFIX}/,,g";				\
	${FIND} $(addprefix ${PREFIX}/,${DOXYGEN_PLIST_DIR})		\
		 -type d -print 					\
		| ${SORT} -r | ${SED} -e "s,${PREFIX}/,@dirrm ,g";

  PRINT_PLIST_IGNORE_DIRS+=${DOXYGEN_PLIST_DIR}
endif

export DOXYGEN=		${PREFIX.doxygen}/bin/doxygen

endif # DOXYGEN_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
