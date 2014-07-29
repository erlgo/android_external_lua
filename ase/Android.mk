LUA_LIBS_PATH := $(TARGET_OUT)/lib/lua/5.1

androidluapath := $(call my-dir)

# ========================================================
# ASE Android lua lib and sample script
# ========================================================
ifeq ($(USER_WANT_ASE_INTF),1)

LOCAL_PATH := $(androidluapath)
include $(CLEAR_VARS)

LOCAL_MODULE := lua.android
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_STEM := init.lua
LOCAL_MODULE_PATH := $(LUA_LIBS_PATH)/android

# depends on json ase
LOCAL_REQUIRED_MODULES := lua.json

LOCAL_SRC_FILES := android/init.lua

include $(BUILD_PREBUILT)

LOCAL_PATH := $(androidluapath)
include $(CLEAR_VARS)

LOCAL_MODULE := lua.ase.hello.sample
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(LUA_LIBS_PATH)/samples
LOCAL_MODULE_STEM := ase.notify.lua

LOCAL_REQUIRED_MODULES := lua.android

LOCAL_SRC_FILES := scripts/hello_world.lua

include $(BUILD_PREBUILT)

endif
