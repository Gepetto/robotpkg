# robotpkg depend.mk for:	knowledge/oro-alterite
# Created:			Séverin Lemaignan on Mon, 22 Mar 2010
#


DEPEND_DEPTH:=		${DEPEND_DEPTH}+
OROALTERITE_DEPEND_MK:=	${OROALTERITE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		oro-alterite
endif

ifeq (+,$(OROALTERITE_DEPEND_MK)) # -----------------------------------------------

PREFER.oro-alterite?=		robotpkg

DEPEND_USE+=		oro-alterite
DEPEND_ABI.oro-alterite?=	oro-alterite>=1.0
DEPEND_DIR.oro-alterite?=	../../knowledge/oro-alterite

SYSTEM_SEARCH.oro-alterite=\
	java/oro-server/plugins/Alterite.jar

endif # OROALTERITE_DEPEND_MK -----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
