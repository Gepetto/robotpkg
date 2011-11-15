# robotpkg depend.mk for:	hardware/sahand-libs
# Created:			Matthieu Herrb on Thu, 10 Jun 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SAHAND_LIBS_DEPEND_MK:=	${SAHAND_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sahand-libs
endif

ifeq (+,$(SAHAND_LIBS_DEPEND_MK)) # ----------------------------------------

PREFER.sahand-libs?=		robotpkg

DEPEND_USE+=			sahand-libs
DEPEND_ABI.sahand-libs?=	sahand-libs>=08.08.14
DEPEND_DIR.sahand-libs?=	../../hardware/sahand-libs

SYSTEM_SEARCH.sahand-libs=	\
	'include/sahand/SAHandCtrlApi.h' \
	'lib/libsahand.so'

endif # SAHAND_LIBS_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
