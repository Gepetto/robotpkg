# robotpkg depend.mk for:	path/hpp-statistics
# Created:			Florent Lamiraux on Sat, 15 Mar 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_STATISTICS_DEPEND_MK:=	${HPP_STATISTICS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-statistics
endif

ifeq (+,$(HPP_STATISTICS_DEPEND_MK)) # ------------------------------------

PREFER.hpp-statistics?=	robotpkg

SYSTEM_SEARCH.hpp-statistics=\
	'include/hpp/statistics/distribution.hh'							\
	'lib/cmake/hpp-statistics/hpp-statisticsConfigVersion.cmake:/PACKAGE_VERSION/s/[^0-9.]//gp'	\
	'lib/libhpp-statistics.so'									\
	'lib/pkgconfig/hpp-statistics.pc:/Version/s/[^0-9.]//gp'


DEPEND_USE+=		hpp-statistics

DEPEND_ABI.hpp-statistics?=	hpp-statistics>=4.9.0
DEPEND_DIR.hpp-statistics?=	../../path/hpp-statistics

endif # HPP_STATISTICS_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
