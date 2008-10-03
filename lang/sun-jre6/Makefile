# $LAAS: Makefile 2008/10/03 13:41:13 mallet $
#
# Copyright (c) 2008 LAAS/CNRS
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
#                                      Anthony Mallet on Fri Oct  3 2008
#

DISTNAME=	jre-6u7-linux-i586
PKGNAME=	sun-jre6-6.0.7
MASTER_SITES=	# empty

DOWNLOAD_NAME=	Java Runtime Environment (JRE) 6u7
SHORT_NAME=	JRE

WRKSRC=		${WRKDIR}/jre1.6.0_07
JAVA_WRAPPERS=	java javaws keytool orbd policytool rmid rmiregistry \
		servertool tnameserv

LICENSE=	sun-jre6-license

include ../../lang/sun-jre6/Makefile.common
include ../../mk/robotpkg.mk

