/*	$NetBSD: digest.c,v 1.15 2007/09/21 18:44:36 joerg Exp $ */

/*
 * Copyright (c) 2001-2005 Alistair G. Crooks.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. All advertising materials mentioning features or use of this software
 *    must display the following acknowledgement:
 *	This product includes software developed by Alistair G. Crooks.
 * 4. The name of the author may not be used to endorse or promote
 *    products derived from this software without specific prior written
 *    permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 * GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#ifndef lint
__COPYRIGHT("@(#) Copyright (c) 2001-2005 \
	        The NetBSD Foundation, Inc.  All rights reserved.");
__RCSID("$NetBSD: digest.c,v 1.15 2007/09/21 18:44:36 joerg Exp $");
#endif


#ifdef HAVE_ERRNO_H
#include <errno.h>
#endif
#ifdef HAVE_LOCALE_H
#include <locale.h>
#endif
#include <md5.h>
#include <rmd160.h>
#include <sha1.h>
#include <sha2.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <tiger.h>
#include <whirlpool.h>
#ifdef HAVE_UNISTD_H
#include <unistd.h>
#endif

#include <archive.h>
#include <archive_entry.h>

typedef void (*HASH_init)(void *);
typedef void (*HASH_update)(void *, const uint8_t *, size_t);
typedef char *(*HASH_end)(void *, char *);
typedef char *(*HASH_file)(char *, char *);

/* this struct defines a message digest algorithm */
typedef struct alg_t {
	const char     *name;
	int		hash_len;
	HASH_init	hash_init;
	HASH_update	hash_update;
	HASH_end	hash_end;
	HASH_file	hash_file;
	union {
		MD5_CTX			m;
		SHA1_CTX		sha;
		RMD160_CTX		rmd;
		SHA256_CTX		sha256;
		SHA384_CTX		sha384;
		SHA512_CTX		sha512;
		tiger_context_t		tiger;
		whirlpool_context_t	whirlpool;
	} hash_ctx, hash_ctx2;
} alg_t;

/* list of supported message digest algorithms */
static alg_t algorithms[] = {
	{ "MD5",	16,
	  (HASH_init) MD5Init,		(HASH_update) MD5Update,
	  (HASH_end) MD5End,		(HASH_file) MD5File },
	{ "RMD160",	20,
	  (HASH_init) RMD160Init,	(HASH_update) RMD160Update,
	  (HASH_end) RMD160End,		(HASH_file) RMD160File },
	{ "SHA1",	20,
	  (HASH_init) SHA1Init,		(HASH_update) SHA1Update,
	  (HASH_end) SHA1End,		(HASH_file) SHA1File },
	{ "SHA256",	SHA256_DIGEST_LENGTH,
	  (HASH_init) SHA256_Init,	(HASH_update) SHA256_Update,
	  (HASH_end) SHA256_End,	(HASH_file) SHA256_File },
	{ "SHA384",	SHA384_DIGEST_LENGTH,
	  (HASH_init) SHA384_Init,	(HASH_update) SHA384_Update,
	  (HASH_end) SHA384_End,	(HASH_file) SHA384_File },
	{ "SHA512",	SHA512_DIGEST_LENGTH,
	  (HASH_init) SHA512_Init,	(HASH_update) SHA512_Update,
	  (HASH_end) SHA512_End,	(HASH_file) SHA512_File },
	{ "TIGER",	24,
	  (HASH_init) TIGERInit,	(HASH_update) TIGERUpdate,
	  (HASH_end) TIGEREnd,		(HASH_file) TIGERFile },
	{ "WHIRLPOOL",	WHIRLPOOL_DIGEST_BYTES,
	  (HASH_init) whirlpool_init,	(HASH_update) whirlpool_update,
	  (HASH_end) whirlpool_end,	(HASH_file) whirlpool_file },
	{ NULL }
};

/* find an algorithm, given a name */
static alg_t *
find_algorithm(const char *a)
{
	alg_t	*alg;

	for (alg = algorithms ; alg->name && strcasecmp(alg->name, a) != 0 ; alg++) {
	}
	return (alg->name) ? alg : NULL;
}

/* compute a digest, and print the results if successful */
static int
digest_file(char *fn, alg_t *alg)
{
	char	in[BUFSIZ * 20];
	char   *digest;
	int	cc, rc;

	digest = malloc(alg->hash_len * 2 + 1);

        if (fn == NULL) {
		(*alg->hash_init)(&alg->hash_ctx);
                while ((cc = read(STDIN_FILENO, in, sizeof(in))) > 0) {
			(*alg->hash_update)(&alg->hash_ctx, (uint8_t *)in,
					    (unsigned) cc);
		}
		(void) printf("%s\n", (*alg->hash_end)(&alg->hash_ctx, digest));
		rc = 1;
	} else {
		if ((*alg->hash_file)(fn, digest) == NULL) {
			rc = 0;
		} else {
			(void) printf("%s (%s) = %s\n", alg->name, fn, digest);
			rc = 1;
		}
	}

	free(digest);

	return (rc);
}

/* open callback for digest_archive() */
static int
digest_archive_open_callback(struct archive *ar, void *data)
{
	alg_t	*alg = data;
	(*alg->hash_init)(&alg->hash_ctx);
	return ARCHIVE_OK;
}

/* write callback for digest_archive() */
static ssize_t
digest_archive_write_callback(struct archive *ar, void *data,
			      const void *buffer, size_t length)
{
	alg_t	*alg = data;
	(*alg->hash_update)(&alg->hash_ctx,
			    (uint8_t *)buffer, (unsigned)length);
	return length;
}

/* close callback for digest_archive() */
static int
digest_archive_close_callback(struct archive *ar, void *data)
{
	return ARCHIVE_OK;
}


/* compute a digest of an archive content, ignoring not relevant metadata, and
 * print the results if successful */
static int
digest_archive(char *fn, alg_t *alg)
{
	struct archive		*in, *out;
	struct archive_entry	*entry;
	char			buffer[BUFSIZ * 20];
	char			*digest;
	ssize_t			len;
	int			s;

	/* read archive from stdin, with automatic format detection */
	in = archive_read_new();
	if (in == NULL)
	  errx(2, "Couldn't create archive reader.");
	if (archive_read_support_compression_all(in) != ARCHIVE_OK)
	  errx(2, "Couldn't enable decompression");
	if (archive_read_support_format_all(in) != ARCHIVE_OK)
	  errx(2, "Couldn't enable read formats");
        if (fn == NULL) {
	  if (archive_read_open_fd(in, STDIN_FILENO, 10240) != ARCHIVE_OK)
	    errx(2, "Couldn't open input archive");
	} else {
	  if (archive_read_open_filename(in, fn, 10240) != ARCHIVE_OK)
	    errx(2, "Couldn't open input archive");
	}

	/* write an uncompressed ustar archive to stdout. */
	out = archive_write_new();
	if (out == NULL)
	  errx(2, "Couldn't create archive writer.");
	if (archive_write_set_compression_none(out) != ARCHIVE_OK)
	  errx(2, "Couldn't enable compression");
	if (archive_write_set_format_ustar(out) != ARCHIVE_OK)
	  errx(2, "Couldn't set output format");
	if (archive_write_open(out, alg, digest_archive_open_callback,
			       digest_archive_write_callback,
			       digest_archive_close_callback) != ARCHIVE_OK)
	  errx(2, "Couldn't open output archive");

	/* examine each entry in the input archive */
	while ((s = archive_read_next_header(in, &entry)) == ARCHIVE_OK) {

	  /* reset owner */
	  archive_entry_set_uid(entry, 0);
	  archive_entry_set_uname(entry, "nobody");
	  archive_entry_set_gid(entry, 0);
	  archive_entry_set_gname(entry, "nobody");

	  /* reset timestamp */
	  archive_entry_set_mtime(entry, 0, 0);

	  /* filter permissions */
	  archive_entry_set_mode(entry, archive_entry_mode(entry) & ~022);

	  /* reset other misc metadata */
	  archive_entry_set_ino(entry, 0);
	  archive_entry_set_dev(entry, 0);
	  archive_entry_set_devmajor(entry, 0);
	  archive_entry_set_devminor(entry, 0);
	  archive_entry_set_rdev(entry, 0);
	  archive_entry_set_rdevmajor(entry, 0);
	  archive_entry_set_rdevminor(entry, 0);

	  /* hash input entry */
	  if (archive_write_header(out, entry) != ARCHIVE_OK)
	    errx(2, "Error writing output archive");
	  if (archive_entry_size(entry) > 0) {
	    len = archive_read_data(in, buffer, sizeof(buffer));
	    while (len > 0) {
	      if (archive_write_data(out, buffer, len) != len)
		errx(2, "Error writing output archive");
	      len = archive_read_data(in, buffer, sizeof(buffer));
	    }
	    if (len < 0)
	      errx(2, "Error reading input archive");
	  }
	}
	if (s != ARCHIVE_EOF)
	  errx(2, "Error reading archive");
	/* Close the archives.  */
	if (archive_read_finish(in) != ARCHIVE_OK)
	  errx(2, "Error closing input archive");
	if (archive_write_finish(out) != ARCHIVE_OK)
	  errx(2, "Error closing output archive");

	/* print digest */
	digest = malloc(alg->hash_len * 2 + 1);
	(void) (*alg->hash_end)(&alg->hash_ctx, digest);
	if (fn == NULL) {
		(void) printf("%s\n", digest);
	} else {
		(void) printf("%s (%s) = %s\n", alg->name, fn, digest);
	}
	free(digest);

	return 1;
}

int
main(int argc, char **argv)
{
	alg_t  *alg;
	int	rval, copt = 0;
	int	i;

#ifdef HAVE_SETLOCALE
	(void) setlocale(LC_ALL, "");
#endif
	while ((i = getopt(argc, argv, "cV")) != -1) {
		switch(i) {
		case 'c':
			copt = 1;
			break;
		case 'V':
			printf("%s\n", VERSION);
			return EXIT_SUCCESS;
		}
	}
	argc -= optind;
	argv += optind;

	if (argc == 0) {
		(void) fprintf(stderr, "Usage: %s algorithm [file...]\n",
		    argv[-optind]);
		return EXIT_FAILURE;
	}
	if ((alg = find_algorithm(argv[0])) == NULL) {
		(void) fprintf(stderr, "No such algorithm `%s'\n", argv[0]);
		exit(EXIT_FAILURE);
	}
	argc--;
	argv++;
	rval = EXIT_SUCCESS;
	if (argc == 0) {
		if (!(copt?digest_archive:digest_file)(NULL, alg)) {
			(void) fprintf(stderr, "stdin\n");
			rval = EXIT_FAILURE;
		}
	} else {
		for (i = 0 ; i < argc ; i++) {
			if (!(copt?digest_archive:digest_file)(argv[i], alg)) {
				(void) fprintf(stderr, "%s\n", argv[i]);
				rval = EXIT_FAILURE;
			}
		}
	}
	return rval;
}
