# robotpkg depend.mk for:	devel/swig
# Created:			Anthony Mallet on Thu,  7 Jul 2011
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SWIG_DEPEND_MK:=	${SWIG_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		swig
endif

ifeq (+,$(SWIG_DEPEND_MK)) # -----------------------------------------

include ../../mk/robotpkg.prefs.mk # OPSYS, OS_VERSION
ifeq (Fedora,${OPSYS})
  ifneq (,$(filter 14,${OS_VERSION}))
    PREFER.swig?=\
      $(if $(call preduce,${DEPEND_ABI.swig} swig<2),system,robotpkg)
  endif
else ifeq (Ubuntu,${OPSYS})
  ifneq (,$(filter 10.04 10.10 11.04,${OS_VERSION}))
    PREFER.swig?=\
      $(if $(call preduce,${DEPEND_ABI.swig} swig<2),system,robotpkg)
  endif
else ifeq (NetBSD,${OPSYS})
  PREFER.swig?=\
    $(if $(call preduce,${DEPEND_ABI.swig} swig<2),system,robotpkg)
endif
PREFER.swig?=		system

DEPEND_USE+=		swig
DEPEND_ABI.swig?=\
	$(if $(filter python32,${DEPEND_USE}),swig>=2.0.4,swig>=1.3)
DEPEND_DIR.swig?=	../../devel/swig
DEPEND_METHOD.swig+=	build

SYSTEM_SEARCH.swig=	'bin/swig:/Version/{s/[^.0-9]//gp;q;}:% -version'

export SWIG=		$(word 1,${SYSTEM_FILES.swig})

endif # SWIG_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
