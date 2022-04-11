# robotpkg sysdep/tinyxml2.mk
# Created:                      Anthony Mallet on Tue  4 Sep 2018
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TINYXML2_DEPEND_MK:=	${TINYXML2_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		tinyxml2
endif

ifeq (+,$(TINYXML2_DEPEND_MK)) # -------------------------------------------

PREFER.tinyxml2?=	system
DEPEND_USE+=		tinyxml2

DEPEND_ABI.tinyxml2?=	tinyxml2>=2

define _tinyxml2vers
  /^static.*VERSION/{s//./;s/[^0-9.]//g;H;};$${g;s/\n//g;s/^[.]//p;}
endef

SYSTEM_SEARCH.tinyxml2=	\
  'include/{,tinyxml2/}tinyxml2.h:${_tinyxml2vers}'	\
  'lib/libtinyxml2.so'

SYSTEM_PKG.Ubuntu.tinyxml2=libtinyxml2-dev
SYSTEM_PKG.RedHat.tinyxml2=tinyxml2-devel
SYSTEM_PKG.Debian.tinyxml2=libtinyxml2-dev
SYSTEM_PKG.NetBSD.tinyxml2=textproc/tinyxml2

endif # TINYXML2_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
