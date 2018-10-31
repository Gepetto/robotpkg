# robotpkg sysdep/autoconf.mk
# Created:			Anthony Mallet on Mon Feb  5 2018
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GM4_DEPEND_MK:=		${GM4_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		gm4
endif

ifeq (+,$(GM4_DEPEND_MK)) # ------------------------------------------------

PREFER.gm4?=		system

DEPEND_USE+=		gm4
DEPEND_ABI.gm4?=	gm4>=1.4
DEPEND_METHOD.gm4?=build
SYSTEM_SEARCH.gm4=\
  'bin/{g,gnu,}m4:/^[mM]4/{/GNU/!s/.*/0/;s/.* //;p}:% --version'

export M4=	$(word 1,${SYSTEM_FILES.gm4})

SYSTEM_DESCR.gm4=	$(subst gm4,GNU m4,${DEPEND_ABI.gm4})
SYSTEM_PKG.Ubuntu.gm4=	m4

endif # GM4_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
