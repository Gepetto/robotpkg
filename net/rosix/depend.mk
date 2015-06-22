# robotpkg depend.mk for:	net/rosix
# Created:			Anthony Mallet on Mon, 22 Jun 2015
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ROSIX_DEPEND_MK:=	${ROSIX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		rosix
endif

ifeq (+,$(ROSIX_DEPEND_MK)) # ----------------------------------------------

DEPEND_USE+=		rosix
PREFER.rosix?=		robotpkg

SYSTEM_SEARCH.rosix=\
  'bin/rosix:p:% --version'

DEPEND_ABI.rosix?=	rosix>=1.0
DEPEND_DIR.rosix?=	../../net/rosix

endif # ROSIX_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
