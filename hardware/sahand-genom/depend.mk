# robotpkg depend.mk for:	hardware/sahand-genom
# Created:			Xavier Broquere on Tue, 26 Oct 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SAHANDGENOM_DEPEND_MK:=	${SAHANDGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sahand-genom
endif

ifeq (+,$(SAHANDGENOM_DEPEND_MK))
PREFER.sahand-genom?=	robotpkg

DEPEND_USE+=		sahand-genom

DEPEND_ABI.sahand-genom?=	sahand-genom>=1.0
DEPEND_DIR.sahand-genom?=	../../hardware/sahand-genom

SYSTEM_SEARCH.sahand-genom=\
	include/sahand/sahandStruct.h		\
	lib/pkgconfig/sahand.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
