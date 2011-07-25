# robotpkg depend.mk for:	net/zeromq
# Created:			Azamat Shakhimardanov on Thu, 7 Oct 2010
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ZEROMQ_DEPEND_MK:= 	${ZEROMQ_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		zeromq
endif

ifeq (+,$(ZEROMQ_DEPEND_MK)) # ---------------------------------------------

PREFER.zeromq?=		robotpkg

DEPEND_USE+=		zeromq

DEPEND_ABI.zeromq?=	zeromq>=2.0.9
DEPEND_DIR.zeromq?=	../../net/zeromq

SYSTEM_SEARCH.zeromq=\
	include/zmq.h	\
	lib/libzmq.la	\
	'lib/pkgconfig/libzmq.pc:/Version/s/[^0-9.]//gp'

endif # ZEROMQ_DEPEND_MK ---------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
