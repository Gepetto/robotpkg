# robotpkg sysdep/mingw32-c.mk
# Created:			Anthony Mallet on Mon Oct 17 2011
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
MINGW32_C_DEPEND_MK:=	${MINGW32_C_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			mingw32-c
endif

ifeq (+,$(MINGW32_C_DEPEND_MK)) # ------------------------------------------

PREFER.mingw32-c?=		system

DEPEND_USE+=			mingw32-c
DEPEND_METHOD.mingw32-c?=	build

DEPEND_ABI.mingw32-c?=		mingw32-c>=3

SYSTEM_DESCR.mingw32-c?=	Minimalist GNU for Windows, C compiler
SYSTEM_PKG.Debian.mingw32-c=	gcc-mingw32
SYSTEM_PKG.Fedora.mingw32-c=	mingw32-gcc
SYSTEM_PKG.Ubuntu.mingw32-c=	gcc-mingw32
SYSTEM_PKG.NetBSD.mingw32-c=	cross/mingw-gcc

SYSTEM_SEARCH.mingw32-c?=	\
	'{,cross/}bin/${_pattern.mingw32}-gcc::% -dumpversion'		\
	'{,cross/}bin/${_pattern.mingw32}-cpp::% -dumpversion'

_pattern.mingw32=i[3456]86-{,-,pc-}mingw32{,msvc}

# make sure to use += here, for chainable compilers definitions.
ROBOTPKG_CC+=$(word 1,${SYSTEM_FILES.mingw32-c})
ROBOTPKG_CPP+=$(word 2,${SYSTEM_FILES.mingw32-c})

ifdef GNU_CONFIGURE
  CONFIGURE_ARGS+=	--host=i386-mingw32
endif # GNU_CONFIGURE

endif # MINGW32_C_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
