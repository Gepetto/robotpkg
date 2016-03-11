# robotpkg depend.mk for:	net/genomix
# Created:			Anthony Mallet on Fri, 19 Oct 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GENOMIX_DEPEND_MK:=	${GENOMIX_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		genomix
endif

ifeq (+,$(GENOMIX_DEPEND_MK)) # --------------------------------------------

DEPEND_USE+=		genomix
PREFER.genomix?=	robotpkg

SYSTEM_SEARCH.genomix=\
  'bin/genomixd:p:% --version'				\
  'lib/pkgconfig/genomix.pc:/Version/s/[^0-9.]//gp'

DEPEND_ABI.genomix?=	genomix>=1.6.1
DEPEND_DIR.genomix?=	../../net/genomix

endif # GENOMIX_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
