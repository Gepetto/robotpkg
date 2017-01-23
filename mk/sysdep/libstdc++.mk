# robotpkg sysdep/libstdc++.mk
# Created:			Anthony Mallet on Mon Jan 23 2017
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBSTDC++_DEPEND_MK:=	${LIBSTDC++_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		libstdc++
endif

ifeq (+,$(LIBSTDC++_DEPEND_MK)) # ------------------------------------------

PREFER.c-compiler?=	system
PREFER.gcc?=		${PREFER.c-compiler}
PREFER.libstdc++ ?=	${PREFER.gcc}

DEPEND_USE+=		libstdc++

DEPEND_ABI.libstdc++ ?=	libstdc++

SYSTEM_PKG.Fedora.libstdc++ =	libstdc++
SYSTEM_PKG.Ubuntu.libstdc++ =	libstdc++
SYSTEM_PKG.Debian.libstdc++ =	libstdc++

SYSTEM_SEARCH.libstdc++ =\
  'lib/libstdc++.so{,.[0-9]*}'

endif # LIBSTDC++_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
