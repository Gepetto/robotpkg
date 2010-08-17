# robotpkg depend.mk for:	devel/sun-java3d
# Created:			Anthony Mallet on Fri, 10 Oct 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SUN_JAVA3D_DEPEND_MK:=	${SUN_JAVA3D_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sun-java3d
endif

ifeq (+,$(SUN_JAVA3D_DEPEND_MK)) # -----------------------------------

PREFER.sun-java3d?=	robotpkg

DEPEND_USE+=		sun-java3d

DEPEND_ABI.sun-java3d?=	sun-java3d>=1.5.1
DEPEND_DIR.sun-java3d?=	../../devel/sun-java3d

SYSTEM_SEARCH.sun-java3d=\
	'{,java/sun-6/}lib/ext/j3dcore.jar'

endif # --- SUN_JAVA3D_DEPEND_MK -------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

