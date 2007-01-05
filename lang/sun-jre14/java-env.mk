# $NetBSD: java-env.mk,v 1.8 2006/05/16 21:25:38 rillig Exp $
#
# This Makefile fragment handles Java wrappers and is meant to be included
# by packages that provide a Java build-time and/or run-time environment.
#
# The following variables can be defined in package Makefiles to tune the
# behavior of this file:
#
#	JAVA_CLASSPATH	Classpath that will be prepended on all invocations
#			to this implementation.  Optional.
#
#	JAVA_HOME	Path to the directory holding the Java implementation.
#			Required.
#
#	JAVA_NAME	Base name of the Java implementation.  This will be
#			used as part of wrappers' names.  Required.
#
#	JAVA_UNLIMIT	List of resources to be unlimited at runtime.
#			Can include any of cmdsize, datasize and stacksize.
#			Optional.
#
#	JAVA_WRAPPERS	List of wrappers to be created under ${PREFIX}/bin,
#			pointing to binaries under ${JAVA_HOME}/bin.  The
#			names must match files in the later directory.
#			Required (if empty, the inclusion of this file is
#			useless).
#

ifndef JAVA_ENV_MK
JAVA_ENV_MK=		# defined

JAVA_NAME?=		# undefined
JAVA_HOME?=		# undefined
JAVA_CLASSPATH?=	# empty
JAVA_UNLIMIT?=		# empty
JAVA_WRAPPERS?=		# empty

include ../../mk/robotpkg.prefs.mk

post-build:		$(foreach w,${JAVA_WRAPPERS},${WRKDIR}/${w})

.PHONY:			$(foreach w,${JAVA_WRAPPERS},install-java-wrapper-${w})
post-install:		$(foreach w,${JAVA_WRAPPERS},install-java-wrapper-${w})

$(foreach w,${JAVA_WRAPPERS},${WRKDIR}/${w}):${WRKDIR}/%:
	@${ECHO} 'Generating $* wrapper...'
	@${ECHO} '#! ${SH}' >$@
	@${ECHO} 'PATH=${JAVA_HOME}/bin:$${PATH}; export PATH' >>$@
	@${ECHO} 'JAVA_HOME=${JAVA_HOME}; export JAVA_HOME' >>$@
	@${ECHO} 'JVM_HOME=${JAVA_HOME}; export JVM_HOME' >>$@
      ifneq (,$(JAVA_CLASSPATH))
	@${ECHO} 'CLASSPATH=${JAVA_CLASSPATH}:$${CLASSPATH}; export CLASSPATH' \
		>>$@
      endif
	@$(foreach f,${JAVA_UNLIMIT},${ECHO} '${ULIMIT_CMD_${f}}' >>$@;)
	@${ECHO} '${JAVA_HOME}/bin/$* "$$@"' >>$@

$(foreach w,${JAVA_WRAPPERS},install-java-wrapper-${w}):install-java-wrapper-%:
	${INSTALL_SCRIPT} ${WRKDIR}/$* ${PREFIX}/bin/$*-${JAVA_NAME}

# Handle the ${PREFIX}/java shared directory automatically.
INSTALLATION_DIRS+=		${PREFIX}/java
PRINT_PLIST_AWK+=		/^@dirrm java$$/ { next; }

endif	# JAVA_ENV_MK
