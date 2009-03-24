# $LAAS: qmake-configure.mk 2009/03/24 16:42:14 mallet $
#
# Copyright (c) 2009 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice,  this list of  conditions and the following disclaimer in
#      the  documentation  and/or  other   materials provided  with  the
#      distribution.
#
# THIS  SOFTWARE IS PROVIDED BY  THE  COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND  ANY  EXPRESS OR IMPLIED  WARRANTIES,  INCLUDING,  BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES  OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR  PURPOSE ARE DISCLAIMED. IN  NO EVENT SHALL THE COPYRIGHT
# HOLDERS OR      CONTRIBUTORS  BE LIABLE FOR   ANY    DIRECT, INDIRECT,
# INCIDENTAL,  SPECIAL,  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF  SUBSTITUTE GOODS OR SERVICES; LOSS
# OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR
# TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
# USE   OF THIS SOFTWARE, EVEN   IF ADVISED OF   THE POSSIBILITY OF SUCH
# DAMAGE.
#
#                                      Anthony Mallet on Tue Mar 24 2009
#

include ${ROBOTPKG_DIR}/mk/sysdep/qmake.mk

QMAKE_ARGS?=#		empty
QMAKE_ARG_PATH?=	*.pro
_BUILD_DEFS+=		QMAKE_ARGS

QMAKE_ARGS+=		QMAKE_LFLAGS=$(call quote,${LDFLAGS})
ifneq (,$(filter c,${USE_LANGUAGES}))
  QMAKE_ARGS+=		QMAKE_CC=${CC}
  QMAKE_ARGS+=		QMAKE_CFLAGS_DEBUG=$(call quote,${CPPFLAGS} ${CFLAGS})
  QMAKE_ARGS+=		QMAKE_CFLAGS_RELEASE=$(call quote,${CPPFLAGS} ${CFLAGS})
endif
ifneq (,$(filter c++,${USE_LANGUAGES}))
  QMAKE_ARGS+=		QMAKE_CXX=${CXX}
  QMAKE_ARGS+=		QMAKE_CXXFLAGS_DEBUG=$(call quote,${CPPFLAGS} ${CXXFLAGS})
  QMAKE_ARGS+=		QMAKE_CXXFLAGS_RELEASE=$(call quote,${CPPFLAGS} ${CXXFLAGS})
endif


# --- do-configure-qmake (PRIVATE) -----------------------------------------
#
# do-configure-qmake runs the qmake program to configure the software for
# building.
#
_DO_CONFIGURE_TARGETS+=	do-configure-qmake
_CONFIGURE_QMAKE_ENV+=	${CONFIGURE_ENV}

.PHONY: do-configure-qmake
do-configure-qmake:
	${RUN}								\
$(foreach _dir_,${CONFIGURE_DIRS},					\
	cd ${WRKSRC} && cd ${_dir_} &&					\
	${SETENV} ${_CONFIGURE_QMAKE_ENV}				\
		${QMAKE} ${QMAKE_ARGS} ${QMAKE_ARG_PATH};		\
)
