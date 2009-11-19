# $LAAS: Makefile 2009/11/18 14:18:01 mallet $
#
# Copyright (c) 2009 LAAS/CNRS
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
#                                           Thomas Moulard on Nov 17 2009
#

DISTNAME=	roboptim-core-cfsqp-plugin-0.4

CATEGORIES=	math
MASTER_SITES=	# non-free

MAINTAINER=	hpp@laas.fr
HOMEPAGE=	http://roboptim.sourceforge.net
COMMENT=	CFSQP solver back-end for roboptim-core
LICENSE=	aemdesign-cfsqp-license

RESTRICTED=	Redistribution not permitted
NO_PUBLIC_SRC=	${RESTRICTED}
NO_PUBLIC_BIN=	${RESTRICTED}

INTERACTIVE_STAGE=	fetch
FETCH_MESSAGE+=\
	"$${bf}The file ${DISTNAME}${EXTRACT_SUFX} must be put manually into:$${rm}"
FETCH_MESSAGE+= "       ${DISTDIR}/"
FETCH_MESSAGE+= ""
FETCH_MESSAGE+= " To get the source code, contact ${MAINTAINER}."

GNU_CONFIGURE=		yes
DOXYGEN_PLIST_DIR+=	share/doc/roboptim-core-cfsqp-plugin

# Make sure git-version-gen is not confused by the robotpkg ``.git''
# directory.
BUILD_MAKE_FLAGS+=    GIT_DIR=/dev/null

include ../../optimization/roboptim-core/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/doxygen.mk
include ../../mk/sysdep/unzip.mk
include ../../mk/robotpkg.mk
