LUA_LIBS_PATH := $(TARGET_OUT)/lib/lua/5.1

luasocketpath := $(call my-dir)

lualibscflags := -DLUASOCKET_DEBUG

###############################################################################

LOCAL_PATH := $(luasocketpath)/src
include $(CLEAR_VARS)

LUASOCKET_SRC := luasocket.c inet.c tcp.c udp.c except.c select.c 
LUASOCKET_SRC += buffer.c auxiliar.c options.c timeout.c io.c usocket.c unix.c

LOCAL_MODULE := liblua-socket
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := external/lua/src/src
LOCAL_SRC_FILES := $(LUASOCKET_SRC)
LOCAL_CFLAGS := $(lualibscflags)
LOCAL_STATIC_LIBRARIES := liblua
LOCAL_MODULE_PATH := $(LUA_LIBS_PATH)/socket
include $(BUILD_SHARED_LIBRARY)

# wrapper to the renamed shared lib
LOCAL_PATH := $(luasocketpath)
include $(CLEAR_VARS)
LOCAL_MODULE := liblua-socket.lua
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(LUA_LIBS_PATH)/socket
LOCAL_MODULE_STEM := core.lua
LOCAL_SRC_FILES := src/socket.core.lua
include $(BUILD_PREBUILT)

###############################################################################

LOCAL_PATH := $(luasocketpath)/src
include $(CLEAR_VARS)

LOCAL_MODULE := liblua-mime
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := external/lua/src/src
LOCAL_SRC_FILES := mime.c
LOCAL_SHARED_LIBRARIES := liblua-socket
LOCAL_MODULE_PATH := $(LUA_LIBS_PATH)/mime

include $(BUILD_SHARED_LIBRARY)

# wrapper to the renamed shared lib
LOCAL_PATH := $(luasocketpath)
include $(CLEAR_VARS)
LOCAL_MODULE := liblua-mime.lua
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(LUA_LIBS_PATH)/mime
LOCAL_MODULE_STEM := core.lua
LOCAL_SRC_FILES := src/mime.core.lua
include $(BUILD_PREBUILT)

###############################################################################
# lua socket scripts

LOCAL_PATH := $(luasocketpath)
include $(CLEAR_VARS)
LOCAL_MODULE := socket.lua
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(LUA_LIBS_PATH)
LOCAL_SRC_FILES := src/socket.lua
include $(BUILD_PREBUILT)

LOCAL_PATH := $(luasocketpath)
include $(CLEAR_VARS)
LOCAL_MODULE := mime.lua
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(LUA_LIBS_PATH)
LOCAL_SRC_FILES := src/mime.lua
include $(BUILD_PREBUILT)

LOCAL_PATH := $(luasocketpath)
include $(CLEAR_VARS)
LOCAL_MODULE := ltn12.lua
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(LUA_LIBS_PATH)
LOCAL_SRC_FILES := src/ltn12.lua
include $(BUILD_PREBUILT)

LOCAL_PATH := $(luasocketpath)
include $(CLEAR_VARS)
LOCAL_MODULE := lua.socket.http
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(LUA_LIBS_PATH)/socket
LOCAL_MODULE_STEM := http.lua
LOCAL_SRC_FILES := src/http.lua
include $(BUILD_PREBUILT)

LOCAL_PATH := $(luasocketpath)
include $(CLEAR_VARS)
LOCAL_MODULE := lua.socket.url
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(LUA_LIBS_PATH)/socket
LOCAL_MODULE_STEM := url.lua
LOCAL_SRC_FILES := src/url.lua
include $(BUILD_PREBUILT)

LOCAL_PATH := $(luasocketpath)
include $(CLEAR_VARS)
LOCAL_MODULE := lua.socket.tp
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(LUA_LIBS_PATH)/socket
LOCAL_MODULE_STEM := tp.lua
LOCAL_SRC_FILES := src/tp.lua
include $(BUILD_PREBUILT)

LOCAL_PATH := $(luasocketpath)
include $(CLEAR_VARS)
LOCAL_MODULE := lua.socket.ftp
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(LUA_LIBS_PATH)/socket
LOCAL_MODULE_STEM := ftp.lua
LOCAL_SRC_FILES := src/ftp.lua
include $(BUILD_PREBUILT)

LOCAL_PATH := $(luasocketpath)
include $(CLEAR_VARS)
LOCAL_MODULE := lua.smtp.smtp
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(LUA_LIBS_PATH)/socket
LOCAL_MODULE_STEM := smtp.lua
LOCAL_SRC_FILES := src/smtp.lua
include $(BUILD_PREBUILT)

###############################################################################
# lua socket sample

LOCAL_PATH := $(luasocketpath)
include $(CLEAR_VARS)
LOCAL_MODULE := lua.socket.sample
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(LUA_LIBS_PATH)/samples
LOCAL_MODULE_STEM := listener.lua
LOCAL_SRC_FILES := samples/listener.lua
include $(BUILD_PREBUILT)

ifneq ($(filter B wB,$(MAKEFLAGS)),)
# Allow to push sample files with 'mmp -B'

$(LOCAL_MODULE):
	@echo -e ${CL_CYN}"Install: $(LUA_LIBS_PATH)/samples/*.lua"${CL_RST}
	@cp $(luasocketpath)/samples/*.lua $(LUA_LIBS_PATH)/samples/
endif

