# robotpkg sysdep/ant.mk
# Created:			Séverin Lemaignan on Wed Jun  3 2009
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
ANT_DEPEND_MK:=		${ANT_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		ant
endif

ifeq (+,$(ANT_DEPEND_MK)) # ------------------------------------------------

PREFER.ant?=		system

DEPEND_USE+=		ant
DEPEND_ABI.ant?=	ant>=1.7
DEPEND_METHOD.ant+=	build
SYSTEM_SEARCH.ant=\
	'bin/ant:/version/{s/[^0-9. ]//g;s/^ *//;s/ .*//;p;}:% -version'

export ANT=		${PREFIX.ant}/bin/ant
ANT_ARGS?=		# empty

# modify the build target. By chance, ant accept -f <file> as make(1) does.
MAKE_PROGRAM?=		${ANT}
MAKE_FILE?=		build.xml
MAKE_ENV+=		ANT_ARGS=$(call quote,${ANT_ARGS})
MAKE_ENV+=		JAVACMD=$(call quote,${JAVA})

BUILD_TARGET?=		# empty

endif # ANT_DEPEND_MK ------------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}

include ../../mk/sysdep/java.mk
