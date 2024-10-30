################################################################################
#
# wxwidgets.mk
#
################################################################################
WXWIDGETS_VERSION = 3.2.6
WXWIDGETS_SITE = $(call github,wxWidgets,wxWidgets,v$(WXWIDGETS_VERSION))
WXWIDGETS_LICENSE = LGPL-2-with-WxWindows-exception-3.1
WXWIDGETS_LICENSE_FILES = \
        docs/gpl.txt \
        docs/lgpl.txt \
        docs/licence.txt \
        docs/licendoc.txt \
        docs/preamble.txt \
        docs/readme.txt \
        docs/xserver.txt
WXWIDGETS_INSTALL_STAGING = YES
WXWIDGETS_CONF_OPTS = \
        --disable-option-checking \
        --enable-unicode \
        --disable-tests \
        --with-gtk=3 \
        --enable-gtk3 \
        --with-libpng=sys \
        --with-libjpeg=sys \
        --with-libtiff=sys \
        --with-zlib=sys \
        --with-regex=sys \
        --with-opengl \
        --without-nanosvg \
        --enable-shared \
        --disable-static \
        --enable-std_string \
        --enable-std_iostreams \
        --enable-dynlib
WXWIDGETS_DEPENDENCIES = host-pkgconf libgtk3 libpng pcre2 zlib libglu mesa3d

define WXWIDGETS_REMOVE_EXAMPLES
    rm -rf $(TARGET_DIR)/usr/share/wxWidgets/samples
    rm -rf $(TARGET_DIR)/usr/share/wxWidgets/demo
endef

define WXWIDGETS_REMOVE_TESTS
    rm -rf $(TARGET_DIR)/usr/share/wxWidgets/tests
endef

define WXWIDGETS_CREATE_CONFIG_SYMLINK
    ln -sf $(STAGING_DIR)/usr/lib/wx/config/x86_64-buildroot-linux-gnu-gtk3-unicode-3.2 \
           $(STAGING_DIR)/usr/bin/wx-config
endef

WXWIDGETS_POST_INSTALL_TARGET_HOOKS += WXWIDGETS_REMOVE_EXAMPLES
WXWIDGETS_POST_INSTALL_TARGET_HOOKS += WXWIDGETS_REMOVE_TESTS
WXWIDGETS_POST_INSTALL_STAGING_HOOKS += WXWIDGETS_CREATE_CONFIG_SYMLINK

$(eval $(autotools-package))
