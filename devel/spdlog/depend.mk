# robotpkg depend.mk for:	devel/spdlog
# Created:			Anthony Mallet on Thu, 7 Apr 2022
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SPDLOG_DEPEND_MK:=	${SPDLOG_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		spdlog
endif

ifeq (+,$(SPDLOG_DEPEND_MK)) # ---------------------------------------------

include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (Debian,${OPSYS})
  ifneq (,$(filter 9 10,${OS_VERSION}))
    PREFER.spdlog?=	robotpkg
  endif
else ifeq (Ubuntu,${OPSYS})
  ifneq (,$(filter 16.04% 18.04%,${OS_VERSION}))
    PREFER.spdlog?=	robotpkg
  endif
endif
PREFER.spdlog?=		system

DEPEND_USE+=		spdlog

DEPEND_METHOD.spdlog?=	build
DEPEND_ABI.spdlog?=	spdlog>=1.5.0
DEPEND_DIR.spdlog?=	../../devel/spdlog

SYSTEM_SEARCH.spdlog=\
  'include/spdlog/logger.h'				\
  'lib/cmake/spdlog/spdlogConfig.cmake'			\
  'lib/pkgconfig/spdlog.pc:/Version/s/[^0-9.]//gp'

endif # SPDLOG_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
