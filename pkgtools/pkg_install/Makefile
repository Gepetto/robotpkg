# robotpkg Makefile for:	pkgtools/pkg_install
# Created:			tho on Thu, 9 Nov 2006
#

VERSION=		20110805.3
DISTNAME=		pkg_install-${VERSION}
CATEGORIES=		pkgtools
MASTER_SITES=		# empty
DISTFILES=		# empty

MAINTAINER=		openrobots@laas.fr
HOMEPAGE=		http://www.pkgsrc.org/
COMMENT=		Package management and administration tools for robotpkg
LICENSE=		2-clause-bsd

NOT_FOR_PLATFORM=	# empty

GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR}
CONFIGURE_ARGS+=	--with-pkgdbdir=${PKG_DBDIR}

NO_PKGTOOLS_REQD_CHECK=	yes
NO_CHECKSUM=		yes
PKG_PRESERVE=		yes
FORCE_PKG_REGISTER=	yes

CPPFLAGS+=		-DDEF_UMASK=${DEF_UMASK}
MAKE_ENV+=              MACHINE_ARCH=${MACHINE_ARCH}
MAKE_ENV+=              OPSYS=${OPSYS}

PLIST_SUBST+=		PKG_DBDIR=${PKG_DBDIR}

DEINSTALL_SRC=		# empty
INSTALL_SRC=		${PKGDIR}/INSTALL

LIBRARY_DIRS.bzip2+=	lib
RPATH_DIRS.bzip2+=	lib
LIBRARY_DIRS.zlib+=	lib
RPATH_DIRS.zlib+=	lib

# depend on these with the "inplace" style for bootstrap
LIBNBCOMPAT_CONFIGURE_ARGS+=	--enable-bsd-getopt --enable-db
LIBNBCOMPAT_STYLE=	inplace
ZLIB_STYLE=		inplace
BZIP2_STYLE=		inplace
LIBARCHIVE_STYLE=	inplace
LIBFETCH_STYLE=		inplace
include ../../pkgtools/libnbcompat/depend.mk
include ../../archivers/zlib/depend.mk
include ../../archivers/bzip2/depend.mk
include ../../archivers/libarchive/depend.mk
include ../../net/libfetch/depend.mk

do-extract:
	${CP} -Rp ${CURDIR}/dist ${WRKSRC}

DEPEND_METHOD.pax+=	bootstrap
include ../../pkgtools/pax/depend.mk
include ../../mk/robotpkg.mk

# We use the newly built robotpkg_{add,create,delete} when upgrading
# from an older pkg_install, because we might required features of the new
# program. robotpkg_info is used at several places in mk files, so we don't
# override the default here. Make sure to properly hook the package build
# before the new tools are needed.
#
ifeq (robotpkg,${PREFER.pkg_install})
  PKG_ADD_CMD=		${WRKSRC}/add/robotpkg_add
  PKG_CREATE_CMD=	${WRKSRC}/create/robotpkg_create
  PKG_DELETE_CMD=	${WRKSRC}/delete/robotpkg_delete

  pre-update:		pkg_build
  pkg-deinstall:	pkg_build
  pkg-tarup:		pkg_build

  .PHONY: pkg_build
  pkg_build:
	${RUN}${RECURSIVE_MAKE} build
endif

# Remove any old pkg_install versions from database
# To be on the safe side when upgrading, rebuild the pkgdb with new tools first
ifeq (robotpkg,${PREFER.pkg_install})
  pre-install: pkg_rebuild_db pkg_install-remove-old

  .PHONY: pkg_rebuild_db
  pkg_rebuild_db:
  ifneq (${PKGTOOLS_VERSION},${VERSION})
	${RUN}if [ -d ${PKG_DBDIR} ]; then				\
		${ECHO_MSG} "Rebuilding package database";		\
		${WRKSRC}/admin/robotpkg_admin -K ${PKG_DBDIR} rebuild;	\
	fi
  else
	@:
  endif

  .PHONY: pkg_install-remove-old
  pkg_install-remove-old:
	${RUN}								\
	{ ${PKG_INFO} -e '${PKGWILDCARD}' || ${TRUE}; } |		\
	while read pkg; do						\
		${ECHO_MSG} "Removing old package";			\
		${PKG_DELETE} -N -f "$$pkg"||${TRUE};			\
	done
endif

# For builds with pkg_install as a system package, force self removal
ifneq (robotpkg,${PREFER.pkg_install})
  pkg-deinstall: pkg_install-force-remove

  .PHONY: pkg_install-force-remove
  pkg_install-force-remove:
	${RUN}if ${PKG_INFO} -qe '${PKGWILDCARD}'; then			\
	  ${PKG_DELETE} -ff '${PKGWILDCARD}';				\
	fi
endif

# Generate a bootstrap kit as a plain .tar.gz
post-package:
	@${PHASE_MSG} "Generating bootstrap archive"
	${RUN} tmpdb=${WRKDIR}/.bootstrap-dbdir;			\
	{								\
	  prefix="${PREFIX}";						\
	  ${PKG_INFO} -qf '${PKGWILDCARD}' | while read f; do		\
	    case $$f in							\
	      @cwd*)	set -- $$f; shift; prefix="$$@";;		\
	      @ignore*)	read f;;					\
	      @*) ;;							\
	      *)	${ECHO} "$$prefix/$$f";;			\
	    esac;							\
	  done;								\
									\
	  ${RM} -rf "$$tmpdb" && ${MKDIR} "$$tmpdb";			\
	  for pkg in '${PKGWILDCARD}'; do				\
	    p=`${PKG_ADMIN} -S lsbest "${PKG_DBDIR}/$$pkg"`;		\
	    ${LN} -s "$$p" "$$tmpdb/$${p##*/}";				\
	    ${PKG_ADMIN_CMD} -K "$$tmpdb" add "$${p##*/}";		\
	  done;								\
	  ${FIND} -L $$tmpdb -type f;					\
	  ${FIND} ${PREFIX} -path ${MAKECONF};				\
	} |								\
	${PAX} -w -z -x ustar						\
		-s "@^$$tmpdb@$(patsubst /%,%,${PKG_DBDIR})@" -s @^/@@	\
		-f ${PACKAGES}/bootstrap.tar.gz;			\
	${ECHO_MSG} "Created ${PACKAGES}/bootstrap.tar.gz"
