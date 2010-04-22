#
# Copyright (c) 2008,2010 LAAS/CNRS
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
#                                       Arnaud Degroote on Wed Apr 22 2008
#

OROCOS_VERSION=		1.10.2
DISTNAME=		orocos-ocl-${OROCOS_VERSION}-src
PKGNAME=		orocos-ocl-${OROCOS_VERSION}
CATEGORIES=		architecture
MASTER_SITES=	http://www.orocos.org/stable/ocl/v${OROCOS_VERSION}/	

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.orocos.org/ocl
COMMENT=		The Orocos Component Library

USE_LANGUAGES=	c c++

WRKSRC=			${WRKDIR}/orocos-ocl-${OROCOS_VERSION}

include ../../architecture/orocos-rtt/depend.mk
include ../../mk/sysdep/cmake.mk
include ../../mk/robotpkg.mk
