# $LAAS: Makefile 2009/01/18 23:12:23 tho $
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
PDFLATEX?=	pdflatex
TTH?=		tth
W3M?=		w3m

MASTER_SRC=	robotpkg.tex
AUX_SRC=\
		introduction.tex	\
		getting.tex		\
		bootstrapping.tex


# --- pdf output -----------------------------------------------------------
#
.PHONY: pdf
pdf: ${MASTER_SRC:.tex=.pdf}

${MASTER_SRC:.tex=.pdf}: ${MASTER_SRC} ${AUX_SRC}
	${PDFLATEX} ${MASTER_SRC}
	${PDFLATEX} ${MASTER_SRC}

${MASTER_SRC:.tex=.pdf}: share/robotpkg.sty


# --- html output ----------------------------------------------------------
#
.PHONY: html
html: ${MASTER_SRC:.tex=.html}

${MASTER_SRC:.tex=.html}: ${MASTER_SRC} ${AUX_SRC} ${MASTER_SRC:.tex=.pdf}
	${CAT} < share/robotpkg.header.html > $@
	${TTH} -w2 -r -L${MASTER_SRC:.tex=} < ${MASTER_SRC} >> $@
	${CAT} < share/robotpkg.footer.html >> $@

${MASTER_SRC:.tex=.html}: share/robotpkg.tth
${MASTER_SRC:.tex=.html}: share/robotpkg.header.html
${MASTER_SRC:.tex=.html}: share/robotpkg.footer.html


# --- txt output -----------------------------------------------------------
#
.PHONY: txt
txt: ${MASTER_SRC:.tex=.txt}

${MASTER_SRC:.tex=.txt}: ${MASTER_SRC:.tex=.html}
	${W3M} -dump -cols 80 $< >$@
