# robotpkg depend.mk for:	architecture/genom
# Created:			Anthony Mallet on Wed, 23 Apr 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
GENOM_DEPEND_MK:=	${GENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		genom

# Add genom-related options for direct dependencies
ifdef GENOM_MODULE
  GENOM_ARGS?=#		empty

  PKG_SUPPORTED_OPTIONS+=	api tcl openprs tclserv_client python xenomai
  PKG_SUGGESTED_OPTIONS+=	tcl

  PKG_OPTION_DESCR.api=	Generate module API only
  define PKG_OPTION_SET.api
    GENOM_ARGS+=	-a
  endef

  PKG_OPTION_DESCR.tcl=	Generate TCL client code
  define PKG_OPTION_SET.tcl
    GENOM_ARGS+=	-t
    CONFIGURE_ARGS+=	--with-tcl=$(dir ${TCL_CONFIG_SH})
    include ../../net/tclserv/depend.mk
    include ../../mk/sysdep/tcl.mk
  endef

  PKG_OPTION_DESCR.openprs=Generate OpenPRS client code
  define PKG_OPTION_SET.openprs
    ifeq (,$(filter tclserv_client,${PKG_OPTIONS}))
      PKG_FAIL_REASON+=	"'openprs' option for ${PKGBASE} requires the"
      PKG_FAIL_REASON+=	"'tclserv_client' option to be enabled."
    endif
    GENOM_ARGS+=	-o
    include ../../supervision/transgen/depend.mk
  endef

  PKG_OPTION_DESCR.tclserv_client=Generate C tclServ client code
  define PKG_OPTION_SET.tclserv_client
    GENOM_ARGS+= -x
    include ../../net/libtclserv_client/depend.mk
  endef

  PKG_OPTION_DESCR.python=Enable Python client code
  define PKG_OPTION_SET.python
    GENOM_ARGS+=	-y
    DEPEND_ABI.genom+=	genom>=2.10
    include ../../mk/sysdep/python.mk
  endef

  PKG_OPTION_DESCR.xenomai=Enable Xenomai support

  define PKG_OPTION_SET.xenomai
    CONFIGURE_ARGS+=	--with-xenomai
    DEPEND_ABI.genom+=		genom~xenomai
    DEPEND_ABI.pocolibs+=	pocolibs~xenomai
    include ../../mk/sysdep/xenomai.mk
  endef

  GNU_CONFIGURE=	yes

  pre-configure: genom-generate

  .PHONY: genom-generate
  genom-generate:
	@${STEP_MSG} "Generating ${GENOM_MODULE} module"
	${RUN}cd ${WRKSRC} && ${CONFIGURE_LOGFILTER}			\
		${SETENV} ${CONFIGURE_ENV}				\
		${TOOLS.genom} ${GENOM_ARGS} ${GENOM_MODULE}

  # Add extra replacement in PLISTs and a generic template for standard genom
  # files
  PLIST_TEMPLATE.genom=architecture/genom/PLIST.module
  PLIST_SUBST+=\
	GENOM_MODULE=$(call quote,${GENOM_MODULE})

  PRINT_PLIST_AWK_SUBST+=\
	gsub("${GENOM_MODULE}", "$${GENOM_MODULE}");

  PRINT_PLIST_FILTER+=\
	${AWK} '							\
	  BEGIN { print "@comment includes ${PLIST_TEMPLATE.genom}" }	\
	  NR > FNR { if (!($$0 in filter)) print; next; }		\
	  { gsub("[$$]{PLIST[^}]*}", ""); filter[$$0] }			\
	  ' ${ROBOTPKG_DIR}/${PLIST_TEMPLATE.genom} -;

  GENERATE_PLIST+= ${CAT} ${ROBOTPKG_DIR}/${PLIST_TEMPLATE.genom};
endif # GENOM_MODULE

# GenoM modules use mkdep, pocolibs, pkg-config, autoconf and libtool. Depend
# on these at the global level so that the dependencies get registered as a
# primary dependency for the packages including this file.
#
include ../../devel/mkdep/depend.mk
include ../../middleware/pocolibs/depend.mk
include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/autoconf.mk
endif # DEPEND_DEPTH == +

ifeq (+,$(GENOM_DEPEND_MK)) # ----------------------------------------

PREFER.genom?=		robotpkg

SYSTEM_SEARCH.genom=\
	bin/genom		\
	include/genom/modules.h	\
	lib/libgenom.la		\
	lib/pkgconfig/genom.pc

DEPEND_USE+=		genom

DEPEND_ABI.genom?=	genom>=2.9
DEPEND_DIR.genom?=	../../architecture/genom

TOOLS.genom?=		${PREFIX.genom}/bin/genom

endif # GENOM_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
