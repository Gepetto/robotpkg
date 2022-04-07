# robotpkg sysdep/libyaml.mk
# Created:			Anthony Mallet on Thu, Apr  7 2022

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBYAML_DEPEND_MK:=	${LIBYAML_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libyaml
endif

ifeq (+,$(LIBYAML_DEPEND_MK)) # --------------------------------------------

PREFER.libyaml?=	system
DEPEND_USE+=		libyaml

DEPEND_ABI.libyaml?=	libyaml>=0

SYSTEM_SEARCH.libyaml=\
  'include/yaml.h'					\
  'lib/libyaml.so'					\
  'lib/pkgconfig/yaml-0.1.pc:/^Version/s/[^0-9.]//gp'

SYSTEM_PKG.Debian.libyaml=	libyaml-dev
SYSTEM_PKG.Fedora.libyaml=	libyaml-devel

endif # LIBYAML_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
