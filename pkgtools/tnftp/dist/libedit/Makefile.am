## $NetBSD: Makefile.am,v 1.1 2009/11/14 08:32:42 lukem Exp $

noinst_LTLIBRARIES = libedit.la

libedit_la_SOURCES = \
	chared.c \
	common.c \
	el.c \
	emacs.c \
	fcns.c \
	help.c \
	hist.c \
	history.c \
	key.c \
	map.c \
	parse.c \
	prompt.c \
	read.c \
	refresh.c \
	search.c \
	sig.c \
	term.c \
	tokenizer.c \
	tty.c \
	vi.c

libedit_la_CPPFLAGS = \
	-I. \
	-I$(srcdir) \
	-I$(top_srcdir)/libnetbsd \
	-I$(top_srcdir) \
	-I$(top_builddir)

generated_files = \
	common.h \
	emacs.h \
	fcns.c \
	fcns.h \
	help.c \
	help.h\
	vi.h

nodist_libedit_la_SOURCES = \
	$(generated_files)

BUILT_SOURCES = \
	$(generated_files)

CLEANFILES = \
	$(generated_files)



vi.h: vi.c
	@echo "Create $@"
	sh makelist -h $(srcdir)/vi.c > $@

emacs.h: emacs.c
	@echo "Create $@"
	sh makelist -h $(srcdir)/emacs.c > $@

common.h: common.c
	@echo "Create $@"
	sh makelist -h $(srcdir)/common.c > $@

fcns.h: vi.h emacs.h common.h
	@echo "Create $@"
	sh makelist -fh vi.h emacs.h common.h > $@

fcns.c: vi.h emacs.h common.h fcns.h
	@echo "Create $@"
	sh makelist -fc vi.h emacs.h common.h > $@

help.c: vi.c emacs.c common.c
	@echo "Create $@"
	sh makelist -bc $(srcdir)/vi.c $(srcdir)/emacs.c $(srcdir)/common.c > $@

help.h: vi.c emacs.c common.c
	@echo "Create $@"
	sh makelist -bh $(srcdir)/vi.c $(srcdir)/emacs.c $(srcdir)/common.c > $@
