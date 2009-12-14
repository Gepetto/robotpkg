# cmake file for blas-3.1
#
project(blas Fortran)
cmake_minimum_required(VERSION 2.6)

# sources
file(GLOB sources *.f)

# shared library
add_library(blas SHARED ${sources})
set_target_properties(blas
	PROPERTIES
	CLEAN_DIRECT_OUTPUT 1
	VERSION		3.1.0
	SOVERSION	3
)

# static library
add_library(blas-static STATIC ${sources})
set_target_properties(blas-static
	PROPERTIES
	CLEAN_DIRECT_OUTPUT 1
	OUTPUT_NAME blas)

# install
install(TARGETS blas blas-static
        LIBRARY DESTINATION lib
        ARCHIVE DESTINATION lib)
