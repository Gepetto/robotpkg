#
# Copyright (c) 2009-2013 LAAS/CNRS
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
BUILD_DEFS+=	CMAKE_ARGS

CMAKE_CONFIGURE_PREFIX?=${PREFIX}

ifndef VERBOSE
  CMAKE_ARGS+=	--no-warn-unused-cli
endif
CMAKE_ARGS+=	-DUNIX=1
CMAKE_ARGS+=	-DCMAKE_VERBOSE_MAKEFILE=ON
CMAKE_ARGS+=\
  -DCMAKE_BUILD_TYPE=$(if $(filter debug,${PKG_OPTIONS}),Debug,Release)
CMAKE_ARGS+=	-DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_CONFIGURE_PREFIX}
CMAKE_ARGS+=	-DCMAKE_INSTALL_RPATH:PATH=${CMAKE_CONFIGURE_PREFIX}/lib
CMAKE_ARGS+=	-DCMAKE_INSTALL_RPATH_USE_LINK_PATH=TRUE

CMAKE_ARGS+=	CMAKE_EXE_LINKER_FLAGS=$(call quote,${LDFLAGS})

# C flags
CMAKE_ARGS+=\
  $(if $(filter c-compiler,${PKG_ALTERNATIVES}),		\
    -DCMAKE_C_FLAGS=$(call quote,${CPPFLAGS} ${CFLAGS})		\
    -DCMAKE_C_FLAGS_DEBUG=					\
    -DCMAKE_C_FLAGS_RELEASE=)

# C++ flags
CMAKE_ARGS+=\
  $(if $(filter c++-compiler,${PKG_ALTERNATIVES}),		\
    -DCMAKE_CXX_FLAGS=$(call quote,${CPPFLAGS} ${CXXFLAGS})	\
    -DCMAKE_CXX_FLAGS_DEBUG=					\
    -DCMAKE_CXX_FLAGS_RELEASE=)

# Fortran compiler
CMAKE_ARGS+=\
  $(if $(filter fortran-compiler,${PKG_ALTERNATIVES}),		\
    -DCMAKE_Fortran_COMPILER=${FC})

# Handle PKGINFODIR
ifneq (,$(call isyes,${CONFIGURE_HAS_INFODIR}))
  CMAKE_ARGS+=	-DPKGINFODIR=${PKGINFODIR}
endif

# Handle PKGMANDIR
ifneq (,$(call isyes,${CONFIGURE_HAS_MANDIR}))
  CMAKE_ARGS+=	-DPKGMANDIR=${PKGMANDIR}
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
	${SETENV} ${_CONFIGURE_CMAKE_ENV}				\
		${CMAKE} ${CMAKE_ARGS} ${CMAKE_ARG_PATH};		\
)
