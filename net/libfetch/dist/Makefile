# $NetBSD: Makefile,v 1.5 2010/02/24 22:00:51 joerg Exp $

LIB=		fetch
SRCS=		fetch.c common.c ftp.c http.c file.c
DPSRCS= 	ftperr.h httperr.h
INCS=		fetch.h
MAN=		fetch.3
CLEANFILES=	ftperr.h httperr.h
MKLINT=		no
MKPIC=		no
MKPROFILE=	no



CPPFLAGS+=	-I.
CPPFLAGS+=	-D_LARGEFILE_SOURCE -D_LARGE_FILES

FETCH_WITH_INET6?=	no
FETCH_WITH_OPENSSL?=	no

ifeq (yes,${FETCH_WITH_INET6})
CPPFLAGS+=	-DINET6
endif

ifeq (yes,${FETCH_WITH_OPENSSL})
CPPFLAGS+=	-DWITH_SSL
LDADD=		-lssl -lcrypto
endif

CPPFLAGS+=	-DFTP_COMBINE_CWDS

WARNS?=		4

all: lib${LIB}.a

ftperr.h: ${CURDIR}/ftp.errors ${CURDIR}/Makefile ${CURDIR}/errlist.sh
	${CURDIR}/errlist.sh ftp_errlist FTP \
	    ${CURDIR}/ftp.errors > $@

httperr.h: ${CURDIR}/http.errors ${CURDIR}/Makefile ${CURDIR}/errlist.sh
	${CURDIR}/errlist.sh http_errlist HTTP \
	    ${CURDIR}/http.errors > $@

lib${LIB}.a: ${SRCS:.c=.o}
	${AR} cr $@ $^

.c.o:
	${CC} ${CFLAGS} ${CPPFLAGS} -c $<

depend: ${DPSRCS}

install: lib${LIB}.a
	${INSTALL_LIB} lib${LIB}.a ${DESTDIR}$(PREFIX)/lib

includes: ${INCS}
	@for file in ${INCS}; do \
	  echo "${INSTALL_DATA} $$file ${DESTDIR}$(PREFIX)/include/$$file";\
	  ${INSTALL_DATA} $$file ${DESTDIR}$(PREFIX)/include/$$file;       \
       done

man: ${MAN}
	echo "${INSTALL_DATA} $< ${DESTDIR}$(PREFIX)/man/man3/$<"; \
	${INSTALL_DATA} $< ${DESTDIR}$(PREFIX)/man/man3/$<
