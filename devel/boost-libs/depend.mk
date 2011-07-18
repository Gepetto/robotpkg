# robotpkg depend.mk for:	devel/boost-libs
# Created:			Anthony Mallet on Fri, 10 Oct 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
BOOST_LIBS_DEPEND_MK:=	${BOOST_LIBS_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		boost-libs
endif

ifeq (+,$(BOOST_LIBS_DEPEND_MK)) # -----------------------------------

PREFER.boost?=		system
PREFER.boost-libs?=	${PREFER.boost}

SYSTEM_PKG.Linux-fedora.boost-libs=	boost-devel
SYSTEM_PKG.Linux-ubuntu.boost-libs=	libboost-all-dev
SYSTEM_PKG.Linux-debian.boost-libs=	libboost-dev
SYSTEM_PKG.NetBSD.boost-libs=		pkgsrc/devel/boost-libs

SYSTEM_SEARCH.boost-libs=\
	'lib/libboost_thread{,-mt}.*'	\
	'lib/libboost_iostreams{,-mt}.*'

DEPEND_USE+=		boost-libs

DEPEND_ABI.boost-libs?=	boost-libs>=1.34.1
DEPEND_DIR.boost-libs?=	../../devel/boost-libs

DEPEND_METHOD.boost-libs?=	build

BOOST_LIB_SUFFIX=\
	$(findstring -mt,$(firstword ${SYSTEM_FILES.boost-libs}))

endif # BOOST_LIBS_DEPEND_MK -----------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
