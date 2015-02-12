# robotpkg sysdep/avr-libc.mk
# Created:			Anthony Mallet on Wed, 11 Feb 2015
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
AVR_LIBC_DEPEND_MK:=	${AVR_LIBC_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
  DEPEND_PKG+=		avr-libc
endif

ifeq (+,$(AVR_LIBC_DEPEND_MK)) # -------------------------------------------

PREFER.avr-libc?=	system

DEPEND_USE+=		avr-libc

DEPEND_ABI.avr-libc?=	avr-libc

SYSTEM_SEARCH.avr-libc?=	\
  '{lib/,}avr/include/avr/io.h'	\
  '{lib/,}avr/lib/libc.a'

SYSTEM_PKG.Fedora.avr-libc=avr-libc
SYSTEM_PKG.Debian.avr-libc=avr-libc
SYSTEM_PKG.NetBSD.avr-libc=cross/avr-libc

endif # AVR_LIBC_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
