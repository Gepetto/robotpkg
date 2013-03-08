# robotpkg sysdep/autoconf.mk
# Created:			Anthony Mallet on Tue Mar 10 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
AUTOCONF_DEPEND_MK:=	${AUTOCONF_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		autoconf
endif

ifeq (+,$(AUTOCONF_DEPEND_MK)) # -------------------------------------------

PREFER.autoconf?=	system

DEPEND_USE+=		autoconf
DEPEND_ABI.autoconf?=	autoconf>=2.59
DEPEND_METHOD.autoconf?=build
SYSTEM_SEARCH.autoconf=\
	'bin/autoconf:/autoconf/{s/[^0-9.]*\([0-9.]*\).*/\1/;p;q;}:% -V' \
	'bin/autom4te'		\
	'bin/autoreconf'

export AUTOCONF=	$(addsuffix /bin/autoconf,${PREFIX.autoconf})
export AUTOM4TE=	$(addsuffix /bin/autom4te,${PREFIX.autoconf})
export AUTORECONF=	$(addsuffix /bin/autoreconf,${PREFIX.autoconf})

GNU_CONFIGURE?=		yes
AUTORECONF_SCRIPT?=	${AUTORECONF}
AUTORECONF_ARGS?=	-fi

autoreconf:
	${RUN}								\
$(foreach _dir_,${CONFIGURE_DIRS},					\
	cd ${WRKSRC} && cd ${_dir_};					\
	if ${TEST} -f configure.ac -o -f configure.in; then		\
	  ${STEP_MSG} "Running autoreconf in ${_dir_}";	\
	  ${CONFIGURE_LOGFILTER} ${SETENV} ${_CONFIGURE_SCRIPT_ENV}	\
	    ${AUTORECONF_SCRIPT} ${AUTORECONF_ARGS};			\
	fi;								\
)


endif # AUTOCONF_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
