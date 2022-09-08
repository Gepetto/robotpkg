# robotpkg depend.mk for:	optimization/tsid
# Created:			Justin Carpentier on Tue, 14 Apr 2020
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TSID_DEPEND_MK:=	${TSID_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		tsid
endif

ifeq (+,$(TSID_DEPEND_MK)) # -----------------------------------------------

PREFER.tsid?=		robotpkg

DEPEND_USE+=		tsid

DEPEND_ABI.tsid?=	tsid>=1.6.0
DEPEND_DIR.tsid?=	../../optimization/tsid

SYSTEM_SEARCH.tsid=\
  'lib/pkgconfig/tsid.pc:/Version/s/[^0-9.]//gp'

endif # TSID_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
