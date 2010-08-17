# robotpkg depend.mk for:	devel/hpp-kwsio
# Created:			Anthony Mallet on Wed, 17 Sep 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
HPP_KWSIO_DEPEND_MK:=	${HPP_KWSIO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		hpp-kwsio
endif

ifeq (+,$(HPP_KWSIO_DEPEND_MK)) # ------------------------------------

PREFER.hpp-kwsio?=	robotpkg

SYSTEM_SEARCH.hpp-kwsio=\
	include/kwsIO/kwsioConfig.h	\
	lib/libkwsIO.la

DEPEND_USE+=		hpp-kwsio

DEPEND_ABI.hpp-kwsio?=	hpp-kwsio>=1.0.1
DEPEND_DIR.hpp-kwsio?=	../../devel/hpp-kwsio

include ../../path/kineo-pp/depend.mk

endif # HPP_KWSIO_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
