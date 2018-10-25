# robotpkg depend.mk for:	middleware/omniORB
# Created:			Anthony Mallet on Thu, 13 Mar 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OMNIORB_DEPEND_MK:=	${OMNIORB_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		omniORB
endif

ifeq (+,$(OMNIORB_DEPEND_MK)) # --------------------------------------------

PREFER.omniORB?=	system

DEPEND_USE+=		omniORB

DEPEND_ABI.omniORB?=	omniORB>=4.2.2
DEPEND_DIR.omniORB?=	../../middleware/omniORB

SYSTEM_SEARCH.omniORB=	\
  'bin/omniidl'						\
  'bin/omniNames'					\
  'include/omniORB4/CORBA.h'				\
  'lib/libomniORB4.{so,a}'				\
  'lib/pkgconfig/omniORB4.pc:/Version/s/[^0-9.]//gp'	\
  'share/idl/omniORB/corbaidl.idl'

SYSTEM_PKG.Debian.omniORB =\
  omniorb omniorb-idl omniidl libomniorb4-dev omniorb-nameserver
SYSTEM_PKG.Fedora.omniORB =	omniORB-devel omniORB-servers
SYSTEM_PKG.NetBSD.omniORB =	net/omniORB

export OMNIIDL=	${PREFIX.omniORB}/bin/omniidl

endif # OMNIORB_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
