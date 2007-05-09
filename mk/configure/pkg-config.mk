#
# Copyright (c) 2007 LAAS/CNRS                        --  Fri Jan 19 2007
# All rights reserved.
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
#
# THIS SOFTWARE IS PROVIDED BY THE  AUTHOR AND CONTRIBUTORS ``AS IS'' AND
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

ifneq (,${PKG_CONFIG_PATH})
CONFIGURE_ENV+=	PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig:${PKG_CONFIG_PATH}
else
CONFIGURE_ENV+=	PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
endif

# -- pkg-config-override (PRIVATE) -----------------------------------
#
# pkg-config-override inserts the compiler's "rpath" flag into
# pkg-config data files so that ``pkg-config --ldflags <module>'' will
# return the full set of compiler flags needed to find libraries at
# run-time.
#
.PHONY: pkg-config-override
pkg-config-override:
        @${DO_NADA}

ifneq (,$(call isyes,$(_USE_RPATH)))
pkg-config-override: subst-pkgconfig

PKGCONFIG_OVERRIDE_SED= \
        '/^Libs:.*[     ]/s|-L\([       ]*[^    ]*\)|${COMPILER_RPATH_FLAG}\1 -L\1|g'

SUBST_CLASSES+=			pkgconfig
SUBST_STAGE.pkgconfig=          do-configure-pre-hook
SUBST_MESSAGE.pkgconfig=        Adding run-time search paths to pkg-config files.
SUBST_FILES.pkgconfig=          $(call quote,$(addprefix ${WRKSRC}/,${PKGCONFIG_OVERRIDE}))
SUBST_SED.pkgconfig=            ${PKGCONFIG_OVERRIDE_SED}
endif
