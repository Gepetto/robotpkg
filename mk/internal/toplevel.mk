# $NetBSD: toplevel.mk,v 1.2 2007/01/07 00:57:36 rillig Exp $
#
# This file contains the make targets that can be used from the
# top-level Makefile. They are in this separate file to keep the
# top-level file short and clean.
#
#

.PHONY: index
index:
	@${RM} -f ${CURDIR}/INDEX
	@${MAKE} ${CURDIR}/INDEX

.PHONY: ${CURDIR}/PKGDB
${CURDIR}/PKGDB:
	@${RM} -f ${CURDIR}/PKGDB
	@${ECHO_MSG} "Extracting complete dependency database.  This may take a while..."
	@DB=${CURDIR}/PKGDB ; \
	PKGSRCDIR=${CURDIR} ; \
	npkg=1; \
	list=`${GREP} '^[[:space:]]*'SUBDIR */Makefile | ${SED} 's,/Makefile.*=[[:space:]]*,/,'` ; \
	for pkgdir in $$list ; do \
		if [ ! -d $$pkgdir ]; then  \
			echo " " ; \
			echo "WARNING:  the package directory $$pkgdir is listed in" > /dev/stderr ; \
			echo $$pkgdir | ${SED} 's;/.*;/Makefile;g' > /dev/stderr ; \
			echo "but the directory does not exist.  Please fix this!" > /dev/stderr ; \
		else \
			cd $$pkgdir ; \
			l=`${MAKE} print-summary-data`  ; \
			if [ $$? != 0 ]; then \
				echo "WARNING (printdepends):  the package in $$pkgdir had problem with" \
					> /dev/stderr ; \
				echo "    ${MAKE} print-summary-data" > /dev/stderr ; \
				echo "    database information for this package" > /dev/stderr ; \
				echo "    will be dropped." > /dev/stderr ; \
				${MAKE} print-summary-data  2>&1 > /dev/stderr ; \
			else \
				echo "$$l" >> $$DB ; \
			fi ; \
		fi ; \
		${ECHO_N} "."; \
		if [ `${EXPR} $$npkg % 100 = 0` -eq 1 ]; then \
			echo " " ; \
			echo "$$npkg" ; \
		fi ; \
		npkg=`${EXPR} $$npkg + 1` ; \
		cd $$PKGSRCDIR  ; \
	done

${CURDIR}/INDEX:
	@${MAKE} ${CURDIR}/PKGDB
	@${RM} -f ${CURDIR}/INDEX
	@${AWK} -f ./mk/internal/genindex.awk PKGSRCDIR=${CURDIR} SORT=${SORT} ${CURDIR}/PKGDB
	@${RM} -f ${CURDIR}/PKGDB

print-index: ${CURDIR}/INDEX
	@${AWK} -F\| '{ printf("Pkg:\t%s\nPath:\t%s\nInfo:\t%s\nMaint:\t%s\nIndex:\t%s\nB-deps:\t%s\nR-deps:\t%s\nArch:\t%s\n\n", $$1, $$2, $$4, $$6, $$7, $$8, $$9, $$10); }' < ${CURDIR}/INDEX

search: ${.CURDIR}/INDEX
ifndef key
	@${ECHO} "The search target requires a keyword parameter,"
	@${ECHO} "e.g.: \"${MAKE} search key=somekeyword\""
else
	@${GREP} ${key} ${CURDIR}/INDEX | ${AWK} -F\| '{ printf("Pkg:\t%s\nPath:\t%s\nInfo:\t%s\nMaint:\t%s\nIndex:\t%s\nB-deps:\t%s\nR-deps:\t%s\nArch:\t%s\n\n", $$1, $$2, $$4, $$6, $$7, $$8, $$9, $$10); }'
endif

#
# Generate list of all packages by extracting information from
# the category/README.html pages
#
readme-all:
	@if [ -f README-all.html ]; then \
		${MV} README-all.html README-all.html.BAK ; \
	fi
	@${MAKE} README-all.html
	@if ${CMP} -s README-all.html README-all.html.BAK ; then \
		${MV} README-all.html.BAK README-all.html ; \
	else \
		${RM} -f README-all.html.BAK ; \
	fi

README-all.html:
	@${RM} -f $@.new
	@${RM} -f $@.newsorted
	@${ECHO_N} "Processing categories for $@:"
	@for category in ${SUBDIR} ""; do \
		if [ "X$$category" = "X" ]; then continue; fi; \
		if [ -f $${category}/README.html ]; then \
			${ECHO_N} " $${category}" ; \
			${GREP} '^<TR>' $${category}/README.html \
			| ${SED} -e 's|"|"'$${category}'/|' \
				-e 's| <td>| <td>(<A HREF="'$${category}'/README.html">'$${category}'</A>) <td>|' \
		      		-e 's|<TR>|<TR VALIGN=TOP>|' \
		      		-e 's|<TD VALIGN=TOP>|<TD>|' \
			>> $@.new ; \
		fi; \
	done
	@${ECHO} "."
	@if [ ! -f $@.new ]; then \
		${ECHO} "There are no categories with README.html files available."; \
		${ECHO} "You need to run \`${MAKE} readme' to generate them before running this target."; \
		${FALSE}; \
	fi
	@${SORT} -f -t '>' -k 2 <$@.new >$@.newsorted
	@${WC} -l $@.newsorted | ${AWK} '{ print $$1 }'  >$@.npkgs
	@${CAT} mk/templates/README.all \
	| ${SED} \
		-e '/%%NPKGS%%/r$@.npkgs' \
		-e '/%%NPKGS%%/d' \
		-e '/%%PKGS%%/r$@.newsorted' \
		-e '/%%PKGS%%/d' \
		> $@
	@${RM} -f $@.npkgs
	@${RM} -f $@.new
	@${RM} -f $@.newsorted
