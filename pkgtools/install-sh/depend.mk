# robotpkg depend.mk for:	pkgtools/install-sh
# Created:			Anthony Mallet on Sun, 29 Aug 2010
#
DEPEND_DEPTH:=		${DEPEND_DEPTH}+
INSTALL_SH_DEPEND_MK:=	${INSTALL_SH_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		install-sh
endif

ifeq (+,$(INSTALL_SH_DEPEND_MK)) # -----------------------------------------

PREFER.install-sh?=	system

DEPEND_USE+=			install-sh
DEPEND_METHOD.install-sh+=	build
DEPEND_ABI.install-sh?=		install-sh
DEPEND_DIR.install-sh?=		../../pkgtools/install-sh

SYSTEM_SEARCH.install-sh='bin/install{,-sh}'
SYSTEM_DESCR.install-sh=A BSD-compatible install program

INSTALL_BIN_FLAGS=	-o ${BINOWN} -g ${BINGRP} -m ${BINMODE}
INSTALL_BIN_FLAGS=	-o ${BINOWN} -g ${BINGRP} -m ${BINMODE}
INSTALL_DATA_FLAGS=	-o ${SHAREOWN} -g ${SHAREGRP} -m ${SHAREMODE}
INSTALL_MAN_FLAGS=	-o ${MANOWN} -g ${MANGRP} -m ${MANMODE}
INSTALL_DIR_FLAGS=	-m ${PKGDIRMODE}

export INSTALL=		$(word 1,${SYSTEM_FILES.install-sh})
export INSTALL_PROGRAM=	$(if ${INSTALL},${INSTALL} -c ${INSTALL_BIN_FLAGS})
export INSTALL_SCRIPT=	${INSTALL_PROGRAM}
export INSTALL_LIB=	${INSTALL_PROGRAM}
export INSTALL_DATA=	$(if ${INSTALL},${INSTALL} -c ${INSTALL_DATA_FLAGS})
export INSTALL_MAN=	$(if ${INSTALL},${INSTALL} -c ${INSTALL_MAN_FLAGS})

export INSTALL_PROGRAM_DIR=\
	$(if ${INSTALL},${INSTALL} -d ${INSTALL_BIN_FLAGS} ${INSTALL_DIR_FLAGS})
export INSTALL_SCRIPT_DIR=	${INSTALL_PROGRAM_DIR}
export INSTALL_LIB_DIR=		${INSTALL_PROGRAM_DIR}
export INSTALL_DATA_DIR=\
	$(if ${INSTALL},${INSTALL} -d ${INSTALL_DATA_FLAGS} ${INSTALL_DIR_FLAGS})
export INSTALL_MAN_DIR=\
	$(if ${INSTALL},${INSTALL} -d ${INSTALL_MAN_FLAGS} ${INSTALL_DIR_FLAGS})

endif # INSTALL_SH_DEPEND_MK -----------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
