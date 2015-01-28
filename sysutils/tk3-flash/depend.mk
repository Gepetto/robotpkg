# robotpkg depend.mk for:	sysutils/tk3-flash
# Created:			Anthony Mallet on Tue, 27 Jan 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TK3_FLASH_DEPEND_MK:=	${TK3_FLASH_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		tk3-flash
endif

ifeq (+,$(TK3_FLASH_DEPEND_MK)) # ------------------------------------------

PREFER.tk3-flash?=	robotpkg

DEPEND_USE+=		tk3-flash

DEPEND_ABI.tk3-flash?=	tk3-flash>=1.0
DEPEND_DIR.tk3-flash?=	../../sysutils/tk3-flash

SYSTEM_SEARCH.tk3-flash=\
  'bin/tk3-flash:p:% -v'

endif # TK3_FLASH_DEPEND_MK ------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
