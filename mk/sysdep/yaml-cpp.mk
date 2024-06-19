# robotpkg depend.mk for:	devel/yaml-cpp
# Created:			Anthony Mallet on Tue, 18 Oct 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
YAML_CPP_DEPEND_MK:=	${YAML_CPP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		yaml-cpp
endif

ifeq (+,$(YAML_CPP_DEPEND_MK)) # -------------------------------------------

PREFER.yaml-cpp?=	system
DEPEND_USE+=		yaml-cpp
DEPEND_ABI.yaml-cpp?=	yaml-cpp>=0.5

SYSTEM_SEARCH.yaml-cpp=\
  'include/yaml-cpp/yaml.h'					\
  'lib/libyaml-cpp.{so,a}'					\
  '{lib,share}/pkgconfig/yaml-cpp.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Arch.yaml-cpp=	yaml-cpp
SYSTEM_PKG.RedHat.yaml-cpp=	yaml-cpp-devel
SYSTEM_PKG.Debian.yaml-cpp=	libyaml-cpp-dev
SYSTEM_PKG.Gentoo.yaml-cpp=	dev-cpp/yaml-cpp
SYSTEM_PKG.NetBSD.yaml-cpp=	textproc/yaml-cpp

endif # YAML_CPP_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
