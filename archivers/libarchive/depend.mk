# robotpkg depend.mk for:	archivers/libarchive
# Created:			Anthony Mallet on Sat, 19 Apr 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
LIBARCHIVE_DEPEND_MK:=	${LIBARCHIVE_DEPEND_MK}+

ifeq (+,$(LIBARCHIVE_DEPEND_MK)) # -----------------------------------------

ifeq (inplace,$(strip $(LIBARCHIVE_STYLE)))
  PREFER.libarchive?=	robotpkg
else
  PREFER.libarchive?=	system
endif

_vregex:=/VERSION_STR.*libarchive/{s/.*archive[ ]*//;s/[^.0-9]//g;p;}
SYSTEM_SEARCH.libarchive:=		\
	'include/archive.h:${_vregex}'	\
	'lib/libarchive.*'

DEPEND_ABI.libarchive?=	libarchive>=2.5.5
DEPEND_DIR.libarchive?=	../../archivers/libarchive

  # pull-in the user preferences for libarchive now
  include ../../mk/robotpkg.prefs.mk

  ifeq (inplace+robotpkg,$(strip $(LIBARCHIVE_STYLE)+$(PREFER.libarchive)))
  # This is the "inplace" version of libarchive package, for bootstrap process
  #
LIBARCHIVE_FILESDIR=	${ROBOTPKG_DIR}/archivers/libarchive/dist
LIBARCHIVE_SRCDIR=	${WRKDIR}/libarchive

CPPFLAGS+=	-I${LIBARCHIVE_SRCDIR}/libarchive
LDFLAGS+=	-L${LIBARCHIVE_SRCDIR}/.libs
LIBS+=		-larchive -lbz2 -lz

ifeq (MacOSX,${OPSYS})
  # Make sure that the linker uses our static library instead of the
  # (outdated) dynamic library "/usr/lib/libarchive.dylib".
  LDFLAGS+=	-Wl,-search_paths_first
endif

post-extract: libarchive-extract
libarchive-extract:
	@${STEP_MSG} "Extracting libarchive in place"
	${CP} -Rp ${LIBARCHIVE_FILESDIR} ${LIBARCHIVE_SRCDIR}

pre-configure: libarchive-build
libarchive-build:
	@${STEP_MSG} "Building libarchive in place"
	${RUN}								\
	cd ${LIBARCHIVE_SRCDIR} && 					\
	${CONFIGURE_LOGFILTER} ${SETENV}				\
		AWK="${AWK}" CC="${CC}" CFLAGS="${CFLAGS}"		\
		CPPFLAGS="${CPPFLAGS}" MISSING=:			\
		${CONFIG_SHELL} ./configure -C --disable-shared		\
		--disable-bsdtar --disable-dependency-tracking		\
		--disable-bsdcpio --without-expat --without-xml2	\
		-without-lzmadec --without-lzma	--disable-acl		\
	&& ${CONFIGURE_LOGFILTER} ${MAKE_PROGRAM}
  else
  # This is the regular version of libarchive package, for normal install
  #
DEPEND_USE+=		libarchive
  endif

  include ../../archivers/bzip2/depend.mk
  include ../../archivers/zlib/depend.mk
endif

ifeq (+,$(DEPEND_DEPTH))
  DEPEND_PKG+=		$(filter libarchive,${DEPEND_USE})
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
