# robotpkg depend.mk for:	optimization/qpOASES
# Created:			Rohan Budhiraja on Fri, 8 Apr 2016
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
QPOASES_DEPEND_MK:=	${QPOASES_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		qpoases
endif

ifeq (+,$(QPOASES_DEPEND_MK)) # --------------------------------------------

PREFER.qpoases?=	robotpkg

DEPEND_USE+=		qpoases

DEPEND_ABI.qpoases?=	qpoases>=3.2
DEPEND_DIR.qpoases?=	../../optimization/qpoases

SYSTEM_SEARCH.qpoases=\
  'include/qpOASES.hpp:/\\version/s/[^0-9.]//gp'	\
  'lib/libqpOASES.{so,a}'

endif # qpOASES_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
