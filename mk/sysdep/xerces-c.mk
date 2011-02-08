# robotpkg sysdep/xerces-c.mk
# Created:			Anthony Mallet on Tue, 2 Nov 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
XERCES_C_DEPEND_MK:=	${XERCES_C_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		xerces-c
endif

ifeq (+,$(XERCES_C_DEPEND_MK)) # -------------------------------------------

PREFER.xerces-c?=	system

DEPEND_USE+=		xerces-c
DEPEND_ABI.xerces-c?=	xerces-c>=3

SYSTEM_SEARCH.xerces-c=	\
	'include/xercesc/util/XercesVersion.hpp:${_xerces_version_sed}'	\
	'lib/libxerces-c.{a,so}'

# extracting version from the .hpp file is challenging...
_xerces_version_sed=\
 /^\#define XERCES_VERSION_\(MAJOR\|MINOR\|REVISION\)[ \t]*/{s///;H;};
_xerces_version_sed+=\
 $${x;s/\n/./g;s/^.//;p;}

SYSTEM_PKG.Linux-fedora.xerces-c=	xerces-c-devel
SYSTEM_PKG.Linux-ubuntu.xerces-c=	libxerces-c-dev
SYSTEM_PKG.Linux-debian.xerces-c=	libxerces-c-dev
SYSTEM_PKG.NetBSD.xerces-c=		pkgsrc/textproc/xerces-c

endif # XERCES_C_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
