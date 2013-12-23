export THEOS_DEVICE_IP=127.0.0.1
export THEOS_DEVICE_PORT=2222
export SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS7.0.sdk
export ARCHS=armv7 armv7s
# export GO_EASY_ON_ME=1

include theos/makefiles/common.mk

THEOS_BUILD_DIR = build

TARGET_IPHONEOS_DEPLOYMENT_VERSION = 7.0

SUBPROJECTS = settings
SUBPROJECTS += zeppelin_sb
SUBPROJECTS += zeppelin_uikit
include $(THEOS_MAKE_PATH)/aggregate.mk

after-stage::
	$(ECHO_NOTHING)find $(THEOS_STAGING_DIR) -iname '*.plist' -exec plutil -convert binary1 {} \;$(ECHO_END)
	$(ECHO_NOTHING)find $(THEOS_STAGING_DIR) -iname '*.png' -exec pincrush -i {} \;$(ECHO_END)
	$(ECHO_NOTHING)find _ -name '*.DS_Store' -type f -exec rm {} \;$(ECHO_END)
