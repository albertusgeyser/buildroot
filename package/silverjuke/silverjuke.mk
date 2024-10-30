################################################################################
#
# silverjuke.mk
#
################################################################################

SILVERJUKE_VERSION = v18.2.1
SILVERJUKE_SITE = https://github.com/silverjuke/silverjuke
SILVERJUKE_LICENSE = GPL-3.0+
SILVERJUKE_LICENSE_FILES = LICENSE
SILVERJUKE_SITE_METHOD = git
SILVERJUKE_AUTORECONF = YES

SILVERJUKE_DEPENDENCIES = wxwidgets sqlite gstreamer1 gst1-plugins-base \
                          gst1-plugins-good gst1-plugins-ugly gst1-libav \
                          libgl libupnp zlib
                          
SILVERJUKE_CONF_ENV = \
    WX_CONFIG=$(STAGING_DIR)/usr/bin/wx-config \
    CXXFLAGS="$(CXXFLAGS) -I$(STAGING_DIR)/usr/lib/wx/include/x86_64-buildroot-linux-gnu-gtk3-unicode-3.2 -I$(STAGING_DIR)/usr/include/wx-3.2" \
    LDFLAGS="$(LDFLAGS) -L$(STAGING_DIR)/usr/lib"
    


SILVERJUKE_CONF_OPTS = \
    --prefix=/usr \
    --bindir=/usr/bin \
    --libdir=/usr/lib \
    --disable-static \
    --enable-shared \
    --with-sqlite \
    --enable-gstreamer \
    --disable-nls






# Evaluate the autotools package infrastructure
$(eval $(autotools-package))

