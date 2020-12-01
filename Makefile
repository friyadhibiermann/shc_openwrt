##############################################
# OpenWrt Makefile for shc program
# #
# #
# # Most of the variables used here are defined in
# # the include directives below. We just need to
# # specify a basic description of the package,
# # where to build our program, where to find
# # the source files, and where to install the
# # compiled program on the router.
# #
# # Be very careful of spacing in this file.
# # Indents should be tabs, not spaces, and
# # there should be no trailing whitespace in
# # lines that are not commented.
# #
# ##############################################
#
include $(TOPDIR)/rules.mk

PKG_NAME:=shc
PKG_VERSION:=3.8.9b - for openwrt fixed
PKG_MAINTAINER:=Bandung, ONIVERSAL <friyadhibiermann>, indonesian

# # directory in your OpenWrt SDK directory

PKG_BUILD_DIR:= $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

# # variable below and uncomment the Kamikaze defin
# # directive for the description below

define Package/$(PKG_NAME)
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:= shc ---- This tool generates a stripped binary executable version of the script specified at command line.
	URL:=
endef

define Package/$(PKG_NAME)/description
	This tool generates a stripped binary executable version of the script specified at command line
endef

# Specify what needs to be done to prepare for building the package.
# # In our case, we need to copy the source files to the build directory.
# # This is NOT the default.  The default uses the PKG_SOURCE_URL and the
# # PKG_SOURCE which is not defined here to download the source from the web.
# # In order to just build a simple program that we have just written, it is
# # much easier to do it this way.
define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/shc $(1)/bin/
endef
#
#
#         # This line executes the necessary commands to compile our program.
# The above define directives specify all the information needed, but this
# # line calls BuildPackage which in turn actually uses this information to
# # build a package.
$(eval $(call BuildPackage,$(PKG_NAME)))
