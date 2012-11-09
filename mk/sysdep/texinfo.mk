# robotpkg sysdep/texinfo.mk
# Created:			Anthony Mallet on Wed Nov  7 2012
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
TEXINFO_DEPEND_MK:=	${TEXINFO_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		install-info texinfo
endif

ifeq (+,$(TEXINFO_DEPEND_MK)) # -------------------------------------------

DEPEND_USE+=			install-info
PREFER.install-info?=		system
DEPEND_ABI.install-info?=	install-info>=4

SYSTEM_SEARCH.install-info=\
	'bin/install-info:/^install-info/{s/[^0-9.]//gp;q;}:% --version'

export INSTALL_INFO=	$(word 1,${SYSTEM_FILES.install-info})

SYSTEM_PKG.Debian.install-info=	install-info
SYSTEM_PKG.Fedora.install-info=	install-info
SYSTEM_PKG.NetBSD.install-info=	devel/gtexinfo
SYSTEM_PKG.Ubuntu.install-info=	install-info

DEPEND_USE+=			texinfo
PREFER.texinfo?=		system
DEPEND_ABI.texinfo=		texinfo>=4
DEPEND_METHOD.texinfo?=		build

SYSTEM_SEARCH.texinfo=\
	'bin/makeinfo:/^makeinfo/{s/[^0-9.]//gp;q;}:% --version'

export MAKEINFO=	$(word 1,${SYSTEM_FILES.texinfo})

SYSTEM_PKG.Debian.texinfo-dev=	texinfo
SYSTEM_PKG.Fedora.texinfo-dev=	texinfo
SYSTEM_PKG.NetBSD.texinfo-dev=	devel/gtexinfo
SYSTEM_PKG.Ubuntu.texinfo-dev=	texinfo

# INSTALL script
ifdef INFO_FILES
  INSTALL_VARS+=	AWK ECHO MKDIR RM SED SORT TEST INSTALL_INFO
  INSTALL_SRC+=		${WRKDIR}/.info-files
  DEINSTALL_SRC+=	${WRKDIR}/.info-files

  include ../../mk/robotpkg.prefs.mk # for WRKDIR

  .PHONY: ${WRKDIR}/.info-files
  ${WRKDIR}/.info-files: ${ROBOTPKG_DIR}/mk/install/info-files
	${RUN} exec >$@;					\
	${CAT} $^;						\
    ${foreach _,$(sort ${INFO_FILES}),				\
	file="$_"; case "$$file" in				\
	  $(abspath ${PREFIX})/*)				\
	    ${ECHO} "# INFO: $${file#$(abspath ${PREFIX})/}";;	\
	  /*) ${ECHO} "# INFO: $$file";;			\
	  *) ${ECHO} "# INFO: ${PKGINFODIR}/$$file";;		\
	esac;							\
    }
endif

endif # TEXINFO_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
