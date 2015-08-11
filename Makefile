include theos/makefiles/common.mk
export SDKVERSION=8.0
ARCHS = armv7 arm64

TWEAK_NAME = NoTrending
NoTrending_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
