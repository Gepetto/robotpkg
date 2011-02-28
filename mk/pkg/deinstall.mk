#
# Copyright (c) 2006,2010-2011 LAAS/CNRS
# Copyright (c) 1994-2006 The NetBSD Foundation, Inc.
# All rights reserved.
#
# This project includes software developed by the NetBSD Foundation, Inc.
# and its contributors. It is derived from the 'pkgsrc' project
# (http://www.pkgsrc.org).
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice, this list of conditions and the following disclaimer.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice,  this list of  conditions and  the following disclaimer in
#      the  documentation   and/or  other  materials   provided with  the
#      distribution.
#   3. All advertising materials mentioning   features or use of this
#      software must display the following acknowledgement:
#        This product includes software developed by the NetBSD
#        Foundation, Inc. and its contributors.
#   4. Neither the  name  of The NetBSD Foundation  nor the names  of its
#      contributors  may be  used to endorse or promote  products derived
#      from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHORS AND CONTRIBUTORS ``AS IS'' AND
# ANY  EXPRESS OR IMPLIED WARRANTIES, INCLUDING,  BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES   OF MERCHANTABILITY AND  FITNESS  FOR  A PARTICULAR
# PURPOSE ARE DISCLAIMED.  IN NO  EVENT SHALL THE AUTHOR OR  CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT,  INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING,  BUT  NOT LIMITED TO, PROCUREMENT  OF
# SUBSTITUTE  GOODS OR SERVICES;  LOSS   OF  USE,  DATA, OR PROFITS;   OR
# BUSINESS  INTERRUPTION) HOWEVER CAUSED AND  ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE  USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# From $NetBSD: deinstall.mk,v 1.2 2006/06/05 17:21:55 jlam Exp $
#
#                                       Anthony Mallet on Thu Dec  7 2006
#

# Set the appropriate flags to pass to pkg_delete(1) based on the value
# of DEINSTALLDEPENDS (see pkgsrc/mk/install/deinstall.mk).
#
_PKG_ARGS_DEINSTALL+=	-k

ifneq (,$(call isyes,${DEINSTALLDEPENDS}))
_PKG_ARGS_DEINSTALL_INFO+=	-r
_PKG_ARGS_DEINSTALL+=		-r
endif
ifneq (,$(filter all All ALL,${DEINSTALLDEPENDS}))
_PKG_ARGS_DEINSTALL_INFO+=	-r -N
_PKG_ARGS_DEINSTALL+=		-r -R
endif

ifdef PKG_VERBOSE
_PKG_ARGS_DEINSTALL+=	-v
endif

ifdef PKG_PRESERVE
  ifneq (,$(call isyes,${_UPDATE_INPROGRESS}))
_PKG_ARGS_DEINSTALL+=	-N -f	# update w/o removing any files
  endif
endif


# --- pkg-deinstall (PRIVATE, pkgsrc/mk/install/deinstall.mk) --------
#
# pkg-deinstall removes the package from the system.
#
pkg-deinstall:
	${RUN}								\
	found=`${PKG_INFO} -e '${PKGWILDCARD}' || ${TRUE}`;		\
	if ${TEST} -n "$$found"; then					\
          $(if ${_PKG_ARGS_DEINSTALL_INFO},				\
	    ${PKG_INFO} -q ${_PKG_ARGS_DEINSTALL_INFO} "$$found" |	\
	      ${SED} 's/^/Removing dependency /';)			\
	  ${PKG_DELETE} ${_PKG_ARGS_DEINSTALL} '${PKGWILDCARD}' && {	\
	    left=`${PKG_INFO} -e '${PKGWILDCARD}' || ${TRUE}`;		\
	    if ${TEST} -z "$$left"; then				\
	      ${ECHO} "Removed $$found";				\
	    else							\
	      ${ECHO} "Preserved $$left";				\
	    fi;								\
          };								\
	fi
ifneq (,$(filter all All ALL,${DEINSTALLDEPENDS}))
	${RUN}								\
$(foreach _pkg_,${DEPEND_USE},						\
  $(if $(filter robotpkg,${PREFER.${_pkg_}}),				\
	found=`${_PKG_BEST_EXISTS} ${_pkg_} || ${TRUE}`;		\
	if ${TEST} -n "$$found"; then					\
          $(if ${_PKG_ARGS_DEINSTALL_INFO},				\
	    ${PKG_INFO} -q ${_PKG_ARGS_DEINSTALL_INFO} "$$found" |	\
	      ${SED} 's/^/Removing dependency /';)			\
	  ${PKG_DELETE} ${_PKG_ARGS_DEINSTALL} "$$found" && {		\
	    left=`${_PKG_BEST_EXISTS} ${_pkg_} || ${TRUE}`;		\
	    if ${TEST} -z "$$left"; then				\
	      ${ECHO} "Removed $$found";				\
	    else							\
	      ${ECHO} "Preserved $$left";				\
	    fi;								\
	  };								\
	fi;								\
))
endif
