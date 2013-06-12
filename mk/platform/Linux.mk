#
# Variable definitions for the Linux operating system.
#

# System headers directories
ifeq (${MACHINE_ARCH},x86_64)	# 64bits arch
  SYSINCDIR?=	include/${MACHINE_ARCH}-linux-gnu include
else				# 32bits arch
  SYSINCDIR?=\
    $(patsubst /usr/%,%,$(wildcard /usr/include/i[3456]86-linux-gnu))	\
    include
endif

# System library directories
_syslibdir=$(patsubst /usr/%,%,$(wildcard /usr/lib/${MACHINE_ARCH}-linux-gnu))
ifeq (${MACHINE_ARCH},x86_64)	# 64bits arch
  SYSLIBDIR?=	${_syslibdir} lib64
else				# 32bits arch
  SYSLIBDIR?=	${_syslibdir} lib
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
