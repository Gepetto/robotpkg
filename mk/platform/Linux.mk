#
# Variable definitions for the Linux operating system.
#

# System library directories
ifeq (${MACHINE_ARCH},x86_64)	# 64bits arch
  SYSLIBDIR?=	lib64
endif

$(call setdefault, CHOWN,	/bin/chown)
$(call setdefault, EXPR,	/usr/bin/expr)
$(call setdefault, GREP,	/bin/grep)
$(call setdefault, EGREP,	/bin/egrep)
$(call setdefault, SED,		/bin/sed)
$(call setdefault, SORT,\
	$(firstword $(realpath $(addsuffix /sort,/bin /usr/bin))))
$(call setdefault, TOUCH,	/bin/touch)
$(call setdefault, XARGS,	/usr/bin/xargs -r)

include ${ROBOTPKG_DIR}/mk/platform/generic.mk
