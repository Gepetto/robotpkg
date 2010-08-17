# robotpkg depend.mk for:	devel/jrl-modelloader
# Created:			Anthony Mallet on Wed, 10 Dec 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
JRL_MODELLOADER_DEPEND_MK:=${JRL_MODELLOADER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		jrl-modelloader
endif

ifeq (+,$(JRL_MODELLOADER_DEPEND_MK)) # ------------------------------

PREFER.jrl-modelloader?=robotpkg

DEPEND_USE+=		jrl-modelloader

DEPEND_ABI.jrl-modelloader?=jrl-modelloader>=1.4
DEPEND_DIR.jrl-modelloader?=../../devel/jrl-modelloader

SYSTEM_SEARCH.jrl-modelloader=\
	bin/ModelLoaderJRL		\
	'lib/pkgconfig/jrl-modelloader.pc:/Version/s/[^0-9.]//gp'

endif # JRL_MODELLOADER_DEPEND_MK ------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
