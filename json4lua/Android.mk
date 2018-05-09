LUA_LIBS_PATH := $(TARGET_OUT)/lib/lua/5.1

jsonluapath := $(call my-dir)

# ========================================================
# JSON LUA lib and scripts
# ========================================================

LOCAL_PATH := $(jsonluapath)/json

include $(CLEAR_VARS)
LOCAL_MODULE := lua.json.rpc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(LUA_LIBS_PATH)/json
LOCAL_MODULE_STEM := rpcs.lua
LOCAL_SRC_FILES := rpc.lua
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lua.json.rpcserver
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(LUA_LIBS_PATH)/json
LOCAL_MODULE_STEM := rpcserver.lua
LOCAL_SRC_FILES := rpcserver.lua
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := lua.json
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(LUA_LIBS_PATH)/json
LOCAL_MODULE_STEM := init.lua
LOCAL_SRC_FILES := json.lua
LOCAL_REQUIRED_MODULES := lua.json.rpc lua.json.rpcserver
include $(BUILD_PREBUILT)
