# Copyright (c) 2010 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice  and this list of  conditions in the documentation   and/or
#      other materials provided with the distribution.
#
#                                      Thomas Moulard on Mon Jun 07 2010
#

PKGNAME=		python-simpleparse-${VERSION}
DISTNAME=		SimpleParse-${VERSION}
VERSION=		2.1.1a2

CATEGORIES=		scripts
MASTER_SITES=		${MASTER_SITE_SOURCEFORGE:=simpleparse/simpleparse/${VERSION}/}
MASTER_REPOSITORY=

MAINTAINER=		mcfletch@vrplumber.com

COMMENT= SimpleParse allows you to generate parsers directly from your	\
EBNF grammar.

USE_LANGUAGES=		c Python

GNU_CONFIGURE=		no
NO_CONFIGURE= 		yes

include ../../mk/robotpkg.mk

# Generate empty Makefile with targets RobotPkg expects.
generate-dummmy-makefile:
	echo -e "all install:\n\ttrue" > ${WRKSRC}/Makefile

pre-build: generate-dummmy-makefile
	cd ${WRKSRC} && python setup.py build

pre-install:
	cd ${WRKSRC} && python setup.py install --prefix ${PREFIX}
