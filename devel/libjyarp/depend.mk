# robotpkg depend.mk for:	devel/libjyarp
# Created:			Anthony Mallet on Wed, 15 Jul 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBJYARP_DEPEND_MK:=	${LIBJYARP_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		yarp
endif

ifeq (+,$(LIBJYARP_DEPEND_MK)) # -------------------------------------------

PREFER.libjyarp?=	robotpkg

DEPEND_USE+=		libjyarp
DEPEND_ABI.libjyarp?=	libjyarp>=2.3.1
DEPEND_DIR.libjyarp?=	../../devel/libjyarp

SYSTEM_SEARCH.libjyarp=\
	java/libjyarp/lib/libjyarp.jar	\
	lib/libjyarp.so

endif # LIBJYARP_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
