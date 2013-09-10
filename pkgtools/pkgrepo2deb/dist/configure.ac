#
# pkgrepo2deb autoconf file
#
AC_PREREQ(2.62)
AC_INIT([pkgrepo2deb],[0.9.20130910],[gauchard@laas.fr])

AC_CONFIG_AUX_DIR([autoconf])
AC_CONFIG_MACRO_DIR([autoconf])
AM_INIT_AUTOMAKE([foreign no-define])

AC_PATH_PROG(AWK, awk, awk)
AC_PATH_PROG(SED, sed, sed)
AC_PATH_PROG(PAX, pax, pax)
AC_PATH_PROG(GZIP_CMD, gzip, gzip)
AC_PATH_PROG(ROBOTPKG_ADMIN, robotpkg_admin, robotpkg_admin)
AC_PATH_PROG(DPKG_DEB, dpkg-deb, dpkg-deb)
AC_PATH_PROG(APT_FTPARCHIVE, apt-ftparchive, apt-ftparchive)
AC_PATH_PROG(GPG, gpg, gpg)

AC_CONFIG_FILES([pkgrepo2deb Makefile])
AC_OUTPUT
