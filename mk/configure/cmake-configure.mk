# $LAAS: cmake-configure.mk 2010/02/10 11:25:29 mallet $
#
# Copyright (c) 2009-2010 LAAS/CNRS
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
#                                      Anthony Mallet on Thu Jan 22 2009
#

include ${ROBOTPKG_DIR}/mk/sysdep/cmake.mk

CMAKE_ARGS?=#	empty
CMAKE_ARG_PATH?=.
_BUILD_DEFS+=	CMAKE_ARGS

CMAKE_CONFIGURE_PREFIX?=${PREFIX}

CMAKE_ARGS+=	-DUNIX=1
CMAKE_ARGS+=	-DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_CONFIGURE_PREFIX}
CMAKE_ARGS+=	-DCMAKE_INSTALL_RPATH:PATH=${CMAKE_CONFIGURE_PREFIX}/lib
CMAKE_ARGS+=	-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=TRUE

CMAKE_ARGS+=	CMAKE_EXE_LINKER_FLAGS=$(call quote,${LDFLAGS})
ifneq (,$(filter c,${USE_LANGUAGES}))
  CMAKE_ARGS+=	-DCMAKE_C_COMPILER=${CC}
  CMAKE_ARGS+=	-DCMAKE_C_FLAGS_DEBUG=$(call quote,${CPPFLAGS} ${CFLAGS})
  CMAKE_ARGS+=	-DCMAKE_C_FLAGS_RELEASE=$(call quote,${CPPFLAGS} ${CFLAGS})
endif
ifneq (,$(filter c++,${USE_LANGUAGES}))
  CMAKE_ARGS+=	-DCMAKE_CXX_COMPILER=${CXX}
  CMAKE_ARGS+=	-DCMAKE_CXX_FLAGS_DEBUG=$(call quote,${CPPFLAGS} ${CXXFLAGS})
  CMAKE_ARGS+=	-DCMAKE_CXX_FLAGS_RELEASE=$(call quote,${CPPFLAGS} ${CXXFLAGS})
endif
ifneq (,$(filter fortran,${USE_LANGUAGES}))
  CMAKE_ARGS+=	-DCMAKE_Fortran_COMPILER=${FC}
endif


# --- do-configure-cmake (PRIVATE) -----------------------------------------
#
# do-configure-cmake runs the cmake program to configure the software for
# building.
#
_DO_CONFIGURE_TARGETS+=	do-configure-cmake
_CONFIGURE_CMAKE_ENV+=	${CONFIGURE_ENV}

.PHONY: do-configure-cmake
do-configure-cmake:
	${RUN}								\
$(foreach _dir_,${CONFIGURE_DIRS},					\
	cd ${WRKSRC} && cd ${_dir_} &&					\
	${CONFIGURE_LOGFILTER} ${SETENV} ${_CONFIGURE_CMAKE_ENV}	\
		${CMAKE} ${CMAKE_ARGS} ${CMAKE_ARG_PATH};		\
)
