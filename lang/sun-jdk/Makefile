# robotpkg Makefile for:	lang/sun-jdk
# Created:			Anthony Mallet on Fri, 3 Oct 2008
#

DISTNAME=	jdk-6u33-linux-${JAVA_ARCH}
PKGNAME=	sun-jdk-1.6.0.33
MASTER_SITES=	# empty
CATEGORIES=	lang
EXTRACT_SUFX=	.bin

COMMENT=	Sun Java(tm) SE development kit
HOMEPAGE=       http://www.oracle.com/technetwork/java/index.html
MAINTAINER=	openrobots@laas.fr
LICENSE=	oracle-java-license

RESTRICTED=     Redistribution of repackaged binaries not permitted
NO_SRC_ON_CDROM=${RESTRICTED}
NO_SRC_ON_FTP=  ${RESTRICTED}
NO_BIN_ON_CDROM=${RESTRICTED}
NO_BIN_ON_FTP=  ${RESTRICTED}

DOWNLOAD=\
	http://www.oracle.com/technetwork/java/javase/downloads/index.html
ARCHIVE=\
	http://www.oracle.com/technetwork/java/archive-139210.html
INTERACTIVE_STAGE=	fetch
FETCH_MESSAGE+=		" The file ${DISTNAME}${EXTRACT_SUFX}"
FETCH_MESSAGE+=		""
FETCH_MESSAGE+=		" must be fetched into:"
FETCH_MESSAGE+=		"	${DISTDIR}"
FETCH_MESSAGE+=		" from:"
FETCH_MESSAGE+=		"	${DOWNLOAD}"
FETCH_MESSAGE+=		"	or ${ARCHIVE}"

include ../../mk/robotpkg.prefs.mk
ifeq (${MACHINE_ARCH},x86_64)
  JAVA_ARCH=x64
else ifeq (${MACHINE_ARCH},i386)
  JAVA_ARCH=i586
else
  PKG_FAIL_REASON+=	"Architecture not supported"
endif

JAVA_PREFIX=		${PREFIX}/java/sun
JAVA_NAME=		sun
JAVA_UNLIMIT=		datasize
JAVA_WRAPPERS=		appletviewer apt extcheck idlj jar jarsigner	\
			java javac javadoc javah javap javaws jdb	\
			keytool orbd policytool rmic rmid rmiregistry	\
			servertool serialver tnameserv

WRKSRC=			${WRKDIR}/jdk1.6.0_33
PLIST_SRC=		PLIST.${JAVA_ARCH}
INSTALLATION_DIRS+=	bin ${JAVA_PREFIX}
NO_BUILD=		yes

# the following forces compression of jarfiles, which is a huge disk
# space win and trivial to no speed reduction in the face of the
# new class sharing in Java 5+... -tvierling
EXTRACT_ENV+=		UNPACK200_FLAGS=-Htrue

# don't launch internet registration ...
EXTRACT_OPTS_BIN+=	-noregister

include ../../pkgtools/pax/depend.mk
include ../../pkgtools/install-sh/depend.mk
include ../../mk/robotpkg.mk

pre-extract:
	@${RUN}test -x ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX} ||		\
	  ${CHMOD} +x ${DISTDIR}/${DISTNAME}${EXTRACT_SUFX};

do-configure: $(foreach w,${JAVA_WRAPPERS},${WRKDIR}/${w})

do-install:
	@${RUN}cd ${WRKSRC} && ${PAX} -rwp ma . ${JAVA_PREFIX};		  \
	for w in ${JAVA_WRAPPERS}; do					  \
	  ${INSTALL_SCRIPT} ${WRKDIR}/$$w ${PREFIX}/bin/${JAVA_NAME}-$$w; \
	done

$(foreach w,${JAVA_WRAPPERS},${WRKDIR}/${w}):${WRKDIR}/%:
	@${ECHO} 'Generating $* wrapper...'
	@${ECHO} '#! ${SH}' >$@
	@${ECHO} 'PATH=${JAVA_PREFIX}/bin:$${PATH}; export PATH' >>$@
	@${ECHO} 'JAVA_HOME=${JAVA_PREFIX}; export JAVA_HOME' >>$@
	@${ECHO} 'JVM_HOME=${JAVA_PREFIX}; export JVM_HOME' >>$@
      ifneq (,$(JAVA_CLASSPATH))
	@${ECHO} 'CLASSPATH=${JAVA_CLASSPATH}:$${CLASSPATH}; export CLASSPATH' \
		>>$@
      endif
	@$(foreach f,${JAVA_UNLIMIT},${ECHO} '${ULIMIT_CMD_${f}}' >>$@;)
	@${ECHO} '${JAVA_PREFIX}/bin/$* "$$@"' >>$@
