TARGET = iphone:9.3:8.0
include theos/makefiles/common.mk
ARCHS = armv7 arm64

TWEAK_NAME = NoTrending
NoTrending_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
