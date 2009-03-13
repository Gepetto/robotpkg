# $LAAS: su-target.mk 2009/03/08 23:12:12 tho $
#
# Copyright (c) 2009 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice,  this list of  conditions and the following disclaimer in
#      the  documentation  and/or  other   materials provided  with  the
#      distribution.
#
# THIS  SOFTWARE IS PROVIDED BY  THE  COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND  ANY  EXPRESS OR IMPLIED  WARRANTIES,  INCLUDING,  BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES  OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR  PURPOSE ARE DISCLAIMED. IN  NO EVENT SHALL THE COPYRIGHT
# HOLDERS OR      CONTRIBUTORS  BE LIABLE FOR   ANY    DIRECT, INDIRECT,
# INCIDENTAL,  SPECIAL,  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF  SUBSTITUTE GOODS OR SERVICES; LOSS
# OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN  CONTRACT, STRICT LIABILITY, OR
# TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
# USE   OF THIS SOFTWARE, EVEN   IF ADVISED OF   THE POSSIBILITY OF SUCH
# DAMAGE.
#
#                                      Anthony Mallet on Thu Jan 15 2009
#

ifeq (sudo,$(notdir $(firstword ${SU_CMD})))
  include ${ROBOTPKG_DIR}/mk/sysdep/sudo.mk
endif


# --- su-target-% ----------------------------------------------------------
#
# su-target-% is a pattern target that does just-in-time su-to-root before
# reinvoking the make process as root.  It acquires root privileges and invokes
# a new make process with the target named "su-$%".
#
override define _ROOT_CMD
	cd ${CURDIR} && ${SETENV} ${PKGSRC_MAKE_ENV} ${RECURSIVE_MAKE}	\
		_PKGSRC_BARRIER=yes PKG_DEBUG_LEVEL=${PKG_DEBUG_LEVEL}	\
		su-$*
endef

.PHONY: $(patsubst %,su-target-%,${_SU_TARGETS})
$(patsubst %,su-target-%,${_SU_TARGETS}): su-target-%:
	${RUN}								\
	if ${TEST} `${ID} -u` = `${ID} -u ${SU_USER}`; then		\
		${_ROOT_CMD};						\
	else								\
		${STEP_MSG} "Becoming \`\`${SU_USER}'' to make $*"	\
			"($(firstword ${SU_CMD}))";			\
		${SU_CMD} $(call quote,$(strip ${_ROOT_CMD}));		\
		${STEP_MSG} "Dropping \`\`${SU_USER}'' privileges.";	\
	fi
