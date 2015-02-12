# robotpkg depend.mk for:	robots/tk3-mikrokopter
# Created:			Anthony Mallet on Wed, 11 Feb 2015
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
TK3_MIKROKOPTER_DEPEND_MK:=	${TK3_MIKROKOPTER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			tk3-mikrokopter
endif

ifeq (+,$(TK3_MIKROKOPTER_DEPEND_MK)) # ------------------------------------

PREFER.tk3-mikrokopter?=	robotpkg

DEPEND_USE+=			tk3-mikrokopter

DEPEND_ABI.tk3-mikrokopter?=	tk3-mikrokopter>=1.0
DEPEND_DIR.tk3-mikrokopter?=	../../robots/tk3-mikrokopter

SYSTEM_SEARCH.tk3-mikrokopter=\
  'lik/tk3-firmware/mkbl'					\
  'lib/pkgconfig/tk3-mikrokopter.pc:/Version/s/[^0-9.]//gp'

endif # TK3_MIKROKOPTER_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
