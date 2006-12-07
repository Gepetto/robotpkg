#
# Copyright (c) 2006 LAAS/CNRS                        --  Sat Dec  2 2006
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

define isyes
$(filter yes Yes YES,$(1))
endef

define isno
$(filter no No NO,$(1))
endef

define exists
$(shell test -f $(1) && echo yes || echo no)
endef

empty=
space=$(empty) $(empty)
quotechars={ } ( ) [ ] | * < > ` ' #'`
define quote
$(eval _q_:=$(1))$(eval $(foreach _c_,$(quotechars),$(eval _q_:=$(subst $(_c_),\$(_c_),$(_q_)))))$(subst $(space),\$(space),$(_q_))
endef

define pathsearch
$(firstword $(wildcard $(addsuffix /$(1),$(subst :, ,$(2)))))
endef

define _OVERRIDE_TARGET
@case $*"" in "-") ;; *) ${ECHO} "don't know how to make $@."; exit 2;; esac
endef
