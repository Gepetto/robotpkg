# robotpkg depend.mk for:	devel/yaml-cpp
# Created:			Anthony Mallet on Tue, 18 Oct 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
YAML_CPP_DEPEND_MK:=	${YAML_CPP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		yaml-cpp
endif

ifeq (+,$(YAML_CPP_DEPEND_MK)) # -------------------------------------------

include ../../mk/robotpkg.prefs.mk # for OPSYS

ifeq (Ubuntu,${OPSYS})
  ifneq (,$(filter 10.04 12.04,${OS_VERSION}))
    PREFER.yaml-cpp?=	robotpkg
  endif
else ifeq (NetBSD,${OPSYS})
  PREFER.yaml-cpp?=	robotpkg
endif
PREFER.yaml-cpp?=	system

DEPEND_USE+=		yaml-cpp

DEPEND_ABI.yaml-cpp?=	yaml-cpp>=0.2
DEPEND_DIR.yaml-cpp?=	../../devel/yaml-cpp

SYSTEM_SEARCH.yaml-cpp=\
	include/yaml-cpp/yaml.h					\
	'lib/libyaml-cpp.{so,a}'				\
	'lib/pkgconfig/yaml-cpp.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.yaml-cpp=	libyaml-cpp-dev
SYSTEM_PKG.Fedora.yaml-cpp=	yaml-cpp-devel
SYSTEM_PKG.Ubuntu.yaml-cpp=	libyaml-cpp-dev

endif # YAML_CPP_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
