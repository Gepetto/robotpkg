# cmake file for lapack-3.1
#
project(lapack)
cmake_minimum_required(VERSION 2.6)

enable_language(Fortran)
include(FindBLAS)

# sources
file(GLOB sources
	  SRC/*.f
	  INSTALL/dlamch.f
	  INSTALL/dsecnd.f
	  INSTALL/lsame.f
	  INSTALL/second.f
	  INSTALL/slamch.f)

# shared library
add_library(lapack SHARED ${sources})
target_link_libraries(lapack ${BLAS_LIBRARIES})
set_target_properties(lapack
	PROPERTIES
	CLEAN_DIRECT_OUTPUT 1
	VERSION		3.1.0
	SOVERSION	3
)

# static library
add_library(lapack-static STATIC ${sources})
target_link_libraries(lapack-static BLAS_LIBRARIES)
set_target_properties(lapack-static
	PROPERTIES
	CLEAN_DIRECT_OUTPUT 1
	OUTPUT_NAME lapack)

# install
install(TARGETS lapack lapack-static
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib)
