# robotpkg sysdep/poco.mk
# Created:			Anthony Mallet on Thu 27 Jun 2013
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
POCO_DEPEND_MK:=	${POCO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		poco
endif

ifeq (+,$(POCO_DEPEND_MK)) # -----------------------------------------------

PREFER.poco?=		system
DEPEND_USE+=		poco
DEPEND_ABI.poco?=	poco>=1

SYSTEM_SEARCH.poco=	\
  'include/Poco/Poco.h'							\
  'include/Poco/{Version,Foundation}.h:p:${AWK} '\''${_poco_version}'\'' %' \
  'lib/libPocoFoundation.so'

_poco_version=	/POCO_VERSION/ {
_poco_version+=	  sub(/^.*0x/,""); gsub(/[0-9][0-9]/,"&."); split($$0,v,".");
_poco_version+=	  print v[1]+0 "." v[2]+0 "." v[3]+0;
_poco_version+=	}

SYSTEM_PKG.Fedora.poco=poco-devel
SYSTEM_PKG.Ubuntu.poco=libpoco-dev
SYSTEM_PKG.Debian.poco=libpoco-dev
SYSTEM_PKG.NetBSD.poco=devel/poco
SYSTEM_PKG.Gentoo.poco=dev-libs/poco

endif # POCO_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
