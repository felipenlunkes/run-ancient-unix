/*
 * Copyright (c) 1986 Regents of the University of California.
 * All rights reserved.  The Berkeley software License Agreement
 * specifies the terms and conditions for redistribution.
 *
 *	@(#)maketape.c	1.1 (2.10BSD Berkeley) 12/1/86
 *			    (2.11BSD Contel) 4/20/91
 *		TU81s didn't like open/close/write at 1600bpi, use
 *		ioctl to write tape marks instead.
 */

#include <stdio.h>
#include <sys/types.h>
#include <sys/ioctl.h>
#include <sys/mtio.h>

#define MAXB 30

extern	int errno;

char	buf[MAXB * 512];
char	name[50];
struct	mtop mtio;
int	blksz, recsz;
int	mt;
int	fd;
int	cnt;

main(argc, argv)
	int argc;
	char *argv[];
{
	register int i, j = 0, k = 0;
	FILE *mf;

	if (argc != 3) {
		fprintf(stderr, "usage: maketape tapedrive makefile\n");
		exit(1);
	}
	if ((mt = creat(argv[1], 0666)) < 0) {
		perror(argv[1]);
		exit(1);
	}
	if ((mf = fopen(argv[2], "r")) == NULL) {
		perror(argv[2]);
		exit(1);
	}

	for (;;) {
		if ((i = fscanf(mf, "%s %d", name, &blksz))== EOF)
			exit(0);
		if (i != 2) {
			fprintf(stderr, "Help! Scanf didn't read 2 things (%d)\n", i);
			exit(1);
		}
		if (blksz <= 0 || blksz > MAXB) {
			fprintf(stderr, "Block size %d is invalid\n", blksz);
			exit(1);
		}
		recsz = blksz * 512;	/* convert to bytes */
		if (strcmp(name, "*") == 0) {
			mtio.mt_op = MTWEOF;
			mtio.mt_count = 1;
			if (ioctl(mt, MTIOCTOP, &mtio) < 0)
				fprintf(stderr, "MTIOCTOP err: %d\n", errno);
			k++;
			continue;
		}
		fd = open(name, 0);
		if (fd < 0) {
			perror(name);
			exit(1);
		}
		printf("%s: block %d, file %d\n", name, j, k);

		/*
		 * wfj fix to final block output.
		 * we pad the last record with nulls
		 * (instead of the bell std. of padding with trash).
		 * this allows you to access text files on the
		 * tape without garbage at the end of the file.
		 * (note that there is no record length associated
		 *  with tape files)
		 */

		while ((cnt=read(fd, buf, recsz)) == recsz) {
			j++;
			if (write(mt, buf, cnt) < 0) {
				perror(argv[1]);
				exit(1);
			}
		}
		if (cnt>0) {
			j++;
			bzero(buf + cnt, recsz - cnt);
			if (write(mt, buf, recsz) < 0) {
				perror(argv[1]);
				exit(1);
			}
		}
	close(fd);
	}
}
