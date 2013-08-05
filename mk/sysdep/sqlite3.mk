# robotpkg sysdep/sqlite3.mk
# Created:			Anthony Mallet on Tue Mar 23 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
SQLITE3_DEPEND_MK:=	${SQLITE3_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		sqlite3
endif

ifeq (+,$(SQLITE3_DEPEND_MK)) # --------------------------------------------

PREFER.sqlite3?=	system

DEPEND_USE+=		sqlite3
DEPEND_ABI.sqlite3?=	sqlite3>=3

DEPEND_METHOD.sqlite3+=	build
SYSTEM_SEARCH.sqlite3=	'bin/sqlite3:1{s/[^0-9.].*$$//;p;q;}:% -version'

export SQLITE3=		${PREFIX.sqlite3}/bin/sqlite3

endif # SQLITE3_DEPEND_MK --------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
