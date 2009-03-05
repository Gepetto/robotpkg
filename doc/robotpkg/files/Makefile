# $LAAS: Makefile 2009/03/05 11:59:51 mallet $
#
# Copyright (c) 2009 LAAS/CNRS
# All rights reserved.
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without   fee is hereby granted, provided   that the above  copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS  SOFTWARE INCLUDING ALL  IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR  BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR  ANY DAMAGES WHATSOEVER RESULTING  FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION,   ARISING OUT OF OR IN    CONNECTION WITH THE USE   OR
# PERFORMANCE OF THIS SOFTWARE.
#
#                                             Anthony Mallet on Sat Jan 10 2009
#

CAT?=		cat
SED?=		sed
DATE?=		date
PDFLATEX?=	pdflatex
TTH?=		tth
W3M?=		w3m
INSTALL?=	install

BSD_INSTALL_DATA_DIR?=	${INSTALL} -d
BSD_INSTALL_DATA?=	${INSTALL}


PREFIX?=		/opt/openrobots
DATA_DIR?=		share/doc/robotpkg

MASTER_SRC=	robotpkg.tex
AUX_SRC=\
		introduction.tex	\
		getting.tex		\
		bootstrapping.tex	\
		using.tex		\
		configuring.tex

export TEXINPUTS=	.:share:

# default targets
#
all: pdf
install: install-pdf

.PHONY: install-dir
install-dir:
	${BSD_INSTALL_DATA_DIR} ${PREFIX}/${DATA_DIR}

# --- pdf output -----------------------------------------------------------
#
.PHONY: pdf
pdf: ${MASTER_SRC:.tex=.pdf}

${MASTER_SRC:.tex=.pdf}: ${MASTER_SRC} ${AUX_SRC}
	${PDFLATEX} ${MASTER_SRC}
	${PDFLATEX} ${MASTER_SRC}

${MASTER_SRC:.tex=.pdf}: share/robotpkg.sty

install-pdf: pdf install-dir
	${BSD_INSTALL_DATA} ${MASTER_SRC:.tex=.pdf} ${PREFIX}/${DATA_DIR}


# --- html output ----------------------------------------------------------
#
.PHONY: html
html: ${MASTER_SRC:.tex=.html}

${MASTER_SRC:.tex=.html}: ${MASTER_SRC} ${AUX_SRC} ${MASTER_SRC:.tex=.pdf}
	${CAT} < share/robotpkg.header.html > $@
	${TTH} -w2 -r -L${MASTER_SRC:.tex=} < ${MASTER_SRC} \
		| ${SED} -e "s/@date@/`${DATE} '+%B %e, %Y'`/" >> $@
	${CAT} < share/robotpkg.footer.html >> $@

${MASTER_SRC:.tex=.html}: share/robotpkg.tth
${MASTER_SRC:.tex=.html}: share/robotpkg.header.html
${MASTER_SRC:.tex=.html}: share/robotpkg.footer.html

install-html: html install-dir
	${BSD_INSTALL_DATA} ${MASTER_SRC:.tex=.html} ${PREFIX}/${DATA_DIR}


# --- txt output -----------------------------------------------------------
#
.PHONY: txt
txt: ${MASTER_SRC:.tex=.txt}

${MASTER_SRC:.tex=.txt}: ${MASTER_SRC:.tex=.html}
	${W3M} -dump -cols 80 $< >$@

install-txt: txt install-dir
	${BSD_INSTALL_DATA} ${MASTER_SRC:.tex=.txt} ${PREFIX}/${DATA_DIR}
