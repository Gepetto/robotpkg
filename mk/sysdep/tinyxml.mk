# robotpkg sysdep/tinyxml.mk
# Created:			Anthony Mallet on Thu 20 Jun 2013
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TINYXML_DEPEND_MK:=	${TINYXML_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		tinyxml
endif

ifeq (+,$(TINYXML_DEPEND_MK)) # --------------------------------------------

PREFER.tinyxml?=	system
DEPEND_USE+=		tinyxml
DEPEND_ABI.tinyxml?=	tinyxml>=2

_tinyxmlvers=/(MAJOR|MINOR|PATCH)_VERS/ {gsub(/[^0-9]/,"");v=v $$0 "."}
_tinyxmlvers+=END {gsub(/[.]$$/,"",v); print v}

SYSTEM_SEARCH.tinyxml=	\
	'include/tinyxml.h:p:${AWK} '\''${_tinyxmlvers}'\'' %'	\
	lib/libtinyxml.so

SYSTEM_PKG.Fedora.tinyxml=tinyxml-devel
SYSTEM_PKG.Ubuntu.tinyxml=libtinyxml-dev
SYSTEM_PKG.Debian.tinyxml=libtinyxml-dev
SYSTEM_PKG.NetBSD.tinyxml=wip/tinyxml

endif # TINYXML_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
