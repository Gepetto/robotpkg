# $LAAS: depend.mk 2009/12/04 23:17:48 tho $
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
#                                      Anthony Mallet on Thu Oct  9 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
BOOST_JAM_DEPEND_MK:=	${BOOST_JAM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		boost-jam
endif

ifeq (+,$(BOOST_JAM_DEPEND_MK)) # ------------------------------------

PREFER.boost?=		system
PREFER.boost-jam?=	${PREFER.boost}

SYSTEM_SEARCH.boost-jam=\
	bin/bjam

DEPEND_USE+=		boost-jam

DEPEND_ABI.boost-jam?=	boost-jam>=1.34.1
DEPEND_DIR.boost-jam?=	../../devel/boost-jam

DEPEND_METHOD.boost-jam?=	build

BJAM=			${PREFIX.boost-jam}/bin/bjam

BJAM_ARGS+=		--builddir=${WRKSRC}/build
BJAM_ARGS+=		--layout=tagged
BJAM_ARGS+=		--toolset=${BOOST_TOOLSET}
BJAM_ARGS+=		--disable-long-double
BJAM_ARGS+=		${BJAM_BUILD}

BJAM_BUILD+=		release
BJAM_BUILD+=		threading=multi
BJAM_BUILD+=		link=shared,static

ifneq (,$(call isno,${MAKE_JOBS_SAFE}))
BJAM_JOBS=		# nothing
else ifneq (,$(MAKE_JOBS))
BJAM_JOBS=		-j${MAKE_JOBS}
endif

BJAM_CMD=		${SETENV} ${MAKE_ENV} ${BJAM} ${BJAM_ARGS}

bjam-build:
	@cd ${WRKSRC} && ${BUILD_LOGFILTER}			\
		${BJAM_CMD} ${BJAM_JOBS}  --prefix=${PREFIX} stage

bjam-install:
	@cd ${WRKSRC} && ${INSTALL_LOGFILTER}			\
		${BJAM_CMD} --prefix=${PREFIX} install

endif # BOOST_JAM_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

