cmake_minimum_required(VERSION 2.8)
project(tinyxml)

include_directories(
  "${PROJECT_SOURCE_DIR}"
)

add_library(tinyxml SHARED
  tinystr.cpp
  tinyxml.cpp
  tinyxmlerror.cpp
  tinyxmlparser.cpp)

set_target_properties(tinyxml PROPERTIES VERSION "2.6.2" SOVERSION 2)

install(TARGETS tinyxml
  LIBRARY DESTINATION lib)

install(FILES tinyxml.h
  DESTINATION include)
