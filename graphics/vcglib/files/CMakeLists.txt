cmake_minimum_required(VERSION 2.6)

project(VCGLib CXX)
set(version 20100824)

# headers
install(DIRECTORY vcg wrap img DESTINATION include/vcglib
        FILES_MATCHING PATTERN "*.h")

# doxygen
find_package(Doxygen)
if(DOXYGEN_FOUND)
  add_custom_target(doc
	${DOXYGEN_EXECUTABLE} doxyfile
	WORKING_DIRECTORY ${VCGLib_SOURCE_DIR}/docs/Doxygen
	COMMENT "Generating API documentation with Doxygen" VERBATIM)
  add_custom_target(install-doc ${CMAKE_COMMAND} -E copy_directory ${VCGLib_SOURCE_DIR}/docs/Doxygen/html ${CMAKE_INSTALL_PREFIX}/share/doc/vcglib/html
		COMMAND ${CMAKE_COMMAND} -E copy "introduction to vcg.ppt"  ${CMAKE_INSTALL_PREFIX}/share/doc/vcglib/
		COMMAND ${CMAKE_COMMAND} -E copy StyleGuide.html ${CMAKE_INSTALL_PREFIX}/share/doc/vcglib/
		COMMAND ${CMAKE_COMMAND} -E copy style.txt ${CMAKE_INSTALL_PREFIX}/share/doc/vcglib/
		COMMAND ${CMAKE_COMMAND} -E copy vcgstructure.txt ${CMAKE_INSTALL_PREFIX}/share/doc/vcglib/
		COMMAND ${CMAKE_COMMAND} -E copy_directory ${VCGLib_SOURCE_DIR}/apps ${CMAKE_INSTALL_PREFIX}/share/doc/vcglib/examples
		WORKING_DIRECTORY ${VCGLib_SOURCE_DIR}/docs
		COMMENT "Installing documentation" VERBATIM)
	add_dependencies(install-doc doc)
endif(DOXYGEN_FOUND)

# libply
include_directories(wrap/ply)
add_library(vcgply SHARED wrap/ply/plylib.cpp)
set_property(TARGET vcgply PROPERTY VERSION ${version})

install(TARGETS vcgply LIBRARY DESTINATION lib)
