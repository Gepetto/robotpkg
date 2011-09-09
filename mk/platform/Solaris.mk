#
# Variable definitions for the Solaris operating system.
#
ECHO_N?=	printf		# ksh builtin

EXTRACT_USING=	${PAX}

_USE_RPATH=		yes	# add rpath to LDFLAGS

# Standard commands
$(call setdefault, SED,		/usr/bin/gsed)
$(call setdefault, AWK,		/usr/bin/nawk)

include ${ROBOTPKG_DIR}/mk/platform/generic.mk
