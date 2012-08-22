# This file is in the public domain
#
lib_LTLIBRARIES = libboost_log-mt.la

srcpath=libs/log/src

libboost_log_mt_la_SOURCES=\
	$(srcpath)/alignment_gap_between.hpp	\
	$(srcpath)/atomic_queue.hpp		\
	$(srcpath)/attribute_set.cpp		\
	$(srcpath)/attribute_values_view.cpp	\
	$(srcpath)/code_conversion.cpp		\
	$(srcpath)/core.cpp			\
	$(srcpath)/event_log_registry.hpp	\
	$(srcpath)/exceptions.cpp		\
	$(srcpath)/filter_parser.cpp		\
	$(srcpath)/formatter_parser.cpp		\
	$(srcpath)/global_logger_storage.cpp	\
	$(srcpath)/init_from_settings.cpp	\
	$(srcpath)/init_from_stream.cpp		\
	$(srcpath)/light_key.hpp		\
	$(srcpath)/named_scope.cpp		\
	$(srcpath)/parser_utils.cpp		\
	$(srcpath)/parser_utils.hpp		\
	$(srcpath)/process_id.cpp		\
	$(srcpath)/severity_level.cpp		\
	$(srcpath)/sink_frontends.cpp		\
	$(srcpath)/slim_string.cpp		\
	$(srcpath)/stream_provider.cpp		\
	$(srcpath)/syslog_backend.cpp		\
	$(srcpath)/text_file_backend.cpp	\
	$(srcpath)/text_ostream_backend.cpp	\
	$(srcpath)/thread_specific.cpp		\
	$(srcpath)/timer.cpp			\
	$(srcpath)/trivial.cpp			\
	$(srcpath)/windows_version.hpp

libboost_log_mt_la_LDFLAGS= -no-undefined -release $(PACKAGE_VERSION)
libboost_log_mt_la_LDFLAGS+= -rpath $(libdir)
libboost_log_mt_la_LDFLAGS+= -R$(BOOST_LIBS)/lib -L$(BOOST_LIBS)/lib
libboost_log_mt_la_LDFLAGS+= -lboost_date_time-mt
libboost_log_mt_la_LDFLAGS+= -lboost_filesystem-mt
libboost_log_mt_la_LDFLAGS+= -lboost_system-mt
libboost_log_mt_la_LDFLAGS+= -lboost_thread-mt
libboost_log_mt_la_CPPFLAGS= -I$(srcpath) -I$(BOOST_HEADERS)/include
libboost_log_mt_la_CPPFLAGS+= -DBOOST_LOG_DLL
libboost_log_mt_la_CPPFLAGS+=-DBOOST_LOG_USE_NATIVE_SYSLOG
