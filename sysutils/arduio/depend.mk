# robotpkg depend.mk for:	sysutils/arduio
# Created:			Anthony Mallet on Wed,  1 Mar 2017
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ARDUIO_DEPEND_MK:=	${ARDUIO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		arduio
endif

ifeq (+,$(ARDUIO_DEPEND_MK)) # ---------------------------------------------

PREFER.arduio?=		robotpkg

DEPEND_USE+=		arduio

DEPEND_ABI.arduio?=	arduio>=1.0
DEPEND_DIR.arduio?=	../../sysutils/arduio

SYSTEM_SEARCH.arduio=\
  'lik/arduio-firmware/uno'					\
  'lib/pkgconfig/arduio.pc:/Version/s/[^0-9.]//gp'

endif # ARDUIO_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
