# robotpkg Makefile for:	middleware/ros-actionlib
# Created:			Anthony Mallet on Tue, 9 Oct 2012
#

ROS_PKG=		actionlib
ROS_VERSION=		1.8.7
PKGREVISION=		1

CATEGORIES=		middleware
ROS_COMMENT=		standardized interface for preemptable tasks
HOMEPAGE=		http://www.ros.org/wiki/actionlib

include ../../meta-pkgs/ros-base/Makefile.common

SUBST_CLASSES+=		py-distsetup

include ../../devel/catkin/depend.mk
include ../../devel/ros-core/depend.mk
include ../../interfaces/ros-common-msgs/depend.mk
include ../../interfaces/ros-std-msgs/depend.mk
include ../../lang/ros-langs/depend.mk
include ../../middleware/ros-comm/depend.mk
include ../../middleware/ros-genmsg/depend.mk
include ../../mk/language/c.mk
include ../../mk/robotpkg.mk


# Fix an installation path issue that is fixed in robotpkg in
# middleware/ros-genmsg (patch-aa). However, this cannot be fixed when
# installing this package against a 'system' ros-genmsg package. This hack
# should disappear in groovy.
#
post-install: fix-install-paths

.PHONY: fix-install-paths
fix-install-paths:
	@${RUN}								\
	${MKDIR} ${PREFIX}/share/actionlib/actions_gen;			\
	for f in ${PREFIX}/share/actionlib/${WRKSRC}/actions_gen/*; do	\
	  ${TEST} -f $$f &&						\
	    ${MV} -f $$f ${PREFIX}/share/actionlib/actions_gen/.;	\
	done;								\
	d=${WRKSRC}; ${RM} -r ${PREFIX}/share/actionlib/$${d#*/}
