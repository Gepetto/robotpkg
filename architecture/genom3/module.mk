# robotpkg module.mk for:	architecture/genom3
# Created:			Anthony Mallet on Tue May 14 2013
#

ifndef GENOM_MODULE_MK
GENOM_MODULE_MK=defined

# --- generic rules --------------------------------------------------------

GENOM_MODULE?=	${PKGBASE:-genom3=}
GENOM_ARGS?=

TEMPLATES_WRKDIR?=	${WRKDIR}/templates
CODELS_WRKSRC?=		$(if $(filter codels,${PKG_OPTIONS}),${WRKSRC})
TMPL1_WRKSRC?=
TMPL2_WRKSRC?=

# codels must be configured/built before templates, and some templates require
# proper ordering (namely, openprs requires client-c).
CONFIGURE_DIRS?=	${CODELS_WRKSRC} ${TMPL1_WRKSRC} ${TMPL2_WRKSRC}
AUTORECONF_DIRS?=	${CODELS_WRKSRC}
GNU_CONFIGURE=		yes

# inter-templates dependencies
PKG_CONFIG_DIRS+=	${CODELS_WRKSRC} ${TMPL1_WRKSRC} ${TMPL2_WRKSRC}


# generate a template
genom3-generate(%): .FORCE
	@${STEP_MSG} "Generating $*"
	${RUN} ${GENOM3} ${GENOM_ARGS}					\
	  $* -C ${TEMPLATES_WRKDIR}/$* ${WRKSRC}/${GENOM_MODULE}.gen

# autoreconf a template
genom3-autoreconf(%): genom3-generate(%)
	@${STEP_MSG} "Running autoreconf for $*"
	${RUN} cd ${TEMPLATES_WRKDIR}/$*;				\
	${SETENV} ${CONFIGURE_ENV} ${AUTORECONF} -vif


# --- options --------------------------------------------------------------

# codels
PKG_SUPPORTED_OPTIONS+=		codels
PKG_SUGGESTED_OPTIONS+=		codels
PKG_OPTION_DESCR.codels=	Build server codels

# pocolibs
PKG_SUPPORTED_OPTIONS+=			pocolibs-server
PKG_OPTION_DESCR.pocolibs-server=	Build a pocolibs server
define PKG_OPTION_SET.pocolibs-server
  ifeq (,$(filter codels,${PKG_OPTIONS}))
    PKG_FAIL_REASON+=	"'pocolibs-server' option for ${PKGBASE} requires the"
    PKG_FAIL_REASON+=	"following options to be enabled:"
    PKG_FAIL_REASON+=	codels
  endif

  TMPL1_WRKSRC+=	${TEMPLATES_WRKDIR}/pocolibs/server

  pre-configure: genom3-autoreconf(pocolibs/server)

  include ../../middleware/pocolibs/depend.mk
  include ../../architecture/genom3-pocolibs/depend.mk
endef

PKG_SUPPORTED_OPTIONS+=			pocolibs-client-c
PKG_OPTION_DESCR.pocolibs-client-c=	Build a pocolibs C client
define PKG_OPTION_SET.pocolibs-client-c
  TMPL1_WRKSRC+=	${TEMPLATES_WRKDIR}/pocolibs/client/c

  pre-configure: genom3-autoreconf(pocolibs/client/c)

  include ../../middleware/pocolibs/depend.mk
  include ../../architecture/genom3-pocolibs/depend.mk
endef

# ros
PKG_SUPPORTED_OPTIONS+=			ros-server
PKG_OPTION_DESCR.ros-server=		Build a ROS server
define PKG_OPTION_SET.ros-server
  ifeq (,$(filter codels,${PKG_OPTIONS}))
    PKG_FAIL_REASON+=	"'ros-server' option for ${PKGBASE} requires the"
    PKG_FAIL_REASON+=	"following options to be enabled:"
    PKG_FAIL_REASON+=	codels
  endif

  TMPL1_WRKSRC+=	${TEMPLATES_WRKDIR}/ros/server
  CONFIGURE_ARGS.${TEMPLATES_WRKDIR}/ros/server+=\
    --with-boost=${PREFIX.boost-headers}				\
    --with-boost-libdir=$(dir $(lastword ${SYSTEM_FILES.boost-lib-thread})) \
    --with-boost-thread=boost_thread${BOOST_LIB_SUFFIX}

  USE_BOOST_LIBS+=	thread

  pre-configure: genom3-autoreconf(ros/server)

  include ../../devel/boost-headers/depend.mk
  include ../../devel/boost-libs/depend.mk
  include ../../devel/ros-ros/depend.mk
  include ../../interfaces/ros-common-msgs/depend.mk
  include ../../middleware/ros-actionlib/depend.mk
  include ../../middleware/ros-comm/depend.mk
  include ../../sysutils/ros-rospack/depend.mk
  include ../../architecture/genom3-ros/depend.mk
  include ../../mk/language/c++.mk
endef

PKG_SUPPORTED_OPTIONS+=			ros-client-c
PKG_OPTION_DESCR.ros-client-c=		Build a ROS C client
define PKG_OPTION_SET.ros-client-c
  TMPL1_WRKSRC+=	${TEMPLATES_WRKDIR}/ros/client/c
  CONFIGURE_ARGS.${TEMPLATES_WRKDIR}/ros/client/c+=\
	--with-boost=${PREFIX.boost-headers}

  pre-configure: genom3-autoreconf(ros/client/c)

  include ../../devel/boost-headers/depend.mk
  include ../../devel/ros-ros/depend.mk
  include ../../interfaces/ros-common-msgs/depend.mk
  include ../../middleware/ros-actionlib/depend.mk
  include ../../middleware/ros-comm/depend.mk
  include ../../sysutils/ros-rospack/depend.mk
  include ../../architecture/genom3-ros/depend.mk
  include ../../mk/language/c++.mk
endef

PKG_SUPPORTED_OPTIONS+=			ros-client-ros
PKG_OPTION_DESCR.ros-client-ros=	Build a ROS client
define PKG_OPTION_SET.ros-client-ros
  TMPL1_WRKSRC+=	${TEMPLATES_WRKDIR}/ros/client/ros

  # the PLIST heavily depends on the actual list of services
  GENERATE_PLIST+=\
    ${CAT} ${TEMPLATES_WRKDIR}/ros/client/ros/plist | ${AWK} '		\
      { sub("^${PREFIX}/?", ""); print }				\
    ';

  # hackish ... but this is for a PLIST.guess anyway, so nothing critical
  PRINT_PLIST_AWK_FILTERS+=\
	/include\/${GENOM_MODULE}_ros\// {next}				\
	/$(subst /,\/,${PYTHON_SITELIB})\/${GENOM_MODULE}_ros\// {next}	\
	/lib\/pkgconfig\/${GENOM_MODULE}_ros.pc/ {next}			\
	/share\/${GENOM_MODULE}_ros\/package.xml$$/ {next}		\
	/share\/${GENOM_MODULE}_ros\/cmake/ {next}			\
	/share\/${GENOM_MODULE}_ros\/msg/ {next}			\
	/share\/${GENOM_MODULE}_ros\/srv/ {next}

  pre-configure: genom3-autoreconf(ros/client/ros)

  include ../../devel/boost-headers/depend.mk
  include ../../devel/ros-ros/depend.mk
  include ../../interfaces/ros-common-msgs/depend.mk
  include ../../middleware/ros-actionlib/depend.mk
  include ../../middleware/ros-comm/depend.mk
  include ../../sysutils/ros-rospack/depend.mk
  include ../../architecture/genom3-ros/depend.mk
  include ../../mk/language/c++.mk
  include ../../mk/sysdep/python.mk
endef

# openprs
PKG_SUPPORTED_OPTIONS+=			openprs
PKG_OPTION_DESCR.openprs=		Build an OpenPRS client
define PKG_OPTION_SET.openprs
  ifeq (,$(filter %-client-c,${PKG_OPTIONS}))
    PKG_FAIL_REASON+=	"'openprs' option for ${PKGBASE} requires one of the"
    PKG_FAIL_REASON+=	"following options to be enabled:"
    PKG_FAIL_REASON+=	$(filter %-client-c,${PKG_SUPPORTED_OPTIONS})
  endif

  TMPL2_WRKSRC+=	${TEMPLATES_WRKDIR}/openprs/client

  pre-configure: genom3-autoreconf(openprs/client)

  include ../../supervision/openprs/depend.mk
  include ../../supervision/genom3-openprs/depend.mk
  include ../../supervision/transgen3/depend.mk
endef


# --- plist ----------------------------------------------------------------

# Add extra replacement in PLISTs and a generic template for standard genom
# files
PLIST_TEMPLATES=	architecture/genom3/PLIST.templates
PLIST_SUBST+=		GENOM_MODULE=$(call quote,${GENOM_MODULE})

GENERATE_PLIST+=	${CAT} ${ROBOTPKG_DIR}/${PLIST_TEMPLATES};

PRINT_PLIST_AWK_SUBST+=	gsub("${GENOM_MODULE}", "$${GENOM_MODULE}");
PRINT_PLIST_AWK_FILTERS=
PRINT_PLIST_FILTER+=\
	| ${AWK} '							\
	  BEGIN { print "@comment includes ${PLIST_TEMPLATES}" }	\
	  ${PRINT_PLIST_AWK_FILTERS}					\
	  NR > FNR {							\
	     if (!($$0 in filter)) print "$${PLIST.codels}" $$0; next;	\
	  }								\
	  { gsub("[$$]{GENOM_MODULE}", "${GENOM_MODULE}") }		\
	  { gsub("[$$]{PLIST[^}]*}", "") }				\
	  { filter[$$0] }						\
	  ' ${ROBOTPKG_DIR}/${PLIST_TEMPLATES} -


# --- common dependencies --------------------------------------------------

include ../../pkgtools/libtool/depend.mk
include ../../pkgtools/pkg-config/depend.mk
include ../../mk/sysdep/autoconf.mk
include ../../mk/sysdep/automake.mk
include ../../architecture/genom3/depend.mk

endif # GENOM_MODULE_MK
