# Makefile.am for jsoncpp - replace bundled scons scripts
# This file is in the public domain

lib_LTLIBRARIES=	libjson.la
libjson_la_SOURCES=\
	src/lib_json/json_reader.cpp	\
	src/lib_json/json_value.cpp	\
	src/lib_json/json_writer.cpp

libjson_la_CPPFLAGS=	-Isrc/lib_json -Iinclude
libjson_la_LDFLAGS=	-release ${PACKAGE_VERSION}

jsondir=	${includedir}/json
json_HEADERS=\
	include/json/autolink.h		\
	include/json/features.h		\
	include/json/json.h		\
	include/json/value.h		\
	include/json/config.h		\
	include/json/forwards.h		\
	include/json/reader.h		\
	include/json/writer.h
