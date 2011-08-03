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

  PKG_SUPPORTED_OPTIONS+=	api tcl openprs tclserv_client xenomai
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
    GENOM_ARGS+=	-o
    include ../../supervision/transgen/depend.mk
  endef

  PKG_OPTION_DESCR.tclserv_client=Generate C tclServ client code
  define PKG_OPTION_SET.tclserv_client
    DEPEND_ABI.genom=  genom>=2.6
    GENOM_ARGS+= -x
    include ../../net/libtclserv_client/depend.mk
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
	${RUN}cd ${WRKSRC} && ${CONFIGURE_LOGFILTER} 			\
		${SETENV} ${CONFIGURE_ENV} 				\
		${TOOLS.genom} ${GENOM_ARGS} ${GENOM_MODULE}
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

DEPEND_ABI.genom?=	genom>=2.5r2
DEPEND_DIR.genom?=	../../architecture/genom

TOOLS.genom?=		${PREFIX.genom}/bin/genom

endif # GENOM_DEPEND_MK ----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
