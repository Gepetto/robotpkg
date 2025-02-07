# robotpkg sysdep/ode.mk
# Created:			Anthony Mallet on Fri,  7 Feb 2025
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ODE_DEPEND_MK:=		${ODE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ode
endif

ifeq (+,$(ODE_DEPEND_MK)) # ------------------------------------------------

PREFER.ode?=		system

DEPEND_USE+=		ode

DEPEND_ABI.ode?=	ode

SYSTEM_SEARCH.ode=\
  'include/ode/ode.h'				\
  'lib/libode.so'				\
  'lib/pkgconfig/ode.pc:/Version/s/[^0-9.]//gp'

SYSTEM_PKG.Fedora.ode=	ode-devel
SYSTEM_PKG.Ubuntu.ode=	libode-dev
SYSTEM_PKG.NetBSD.ode=	devel/ode

endif # ODE_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
