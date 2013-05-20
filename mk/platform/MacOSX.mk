#
# Variable definitions for the MacOSX operating system.
#

_OPSYS_SHLIB_TYPE=	dylib	# shared lib type
_USE_RPATH=		no	# add rpath to LDFLAGS

_LD_LIBRARY_PATH_VAR=	DYLD_LIBRARY_PATH

# Standard commands
$(call setdefault, SH,		/bin/bash)
$(call setdefault, CHOWN,	/usr/bin/chown)

include ${ROBOTPKG_DIR}/mk/platform/generic.mk
