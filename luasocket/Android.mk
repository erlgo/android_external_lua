LUA_LIBS_PATH := $(TARGET_OUT)/lib/lua/5.1

luasocketpath := $(call my-dir)

###############################################################################

LOCAL_PATH := $(luasocketpath)/src
include $(CLEAR_VARS)

LUASOCKET_SRC := luasocket.c inet.c tcp.c udp.c except.c select.c 
LUASOCKET_SRC += buffer.c auxiliar.c options.c timeout.c io.c usocket.c unix.c

LOCAL_MODULE := lua.socket
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := external/lua/src/src
LOCAL_SRC_FILES := $(LUASOCKET_SRC)

LOCAL_STATIC_LIBRARIES := liblua

LOCAL_INSTALLED_MODULE_STEM := core.so
LOCAL_MODULE_PATH := $(LUA_LIBS_PATH)/socket

include $(BUILD_SHARED_LIBRARY)

###############################################################################

LOCAL_PATH := $(luasocketpath)/src
include $(CLEAR_VARS)

LOCAL_MODULE := lua.mime
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := external/lua/src/src
LOCAL_SRC_FILES := mime.c

LOCAL_STATIC_LIBRARIES := liblua

LOCAL_INSTALLED_MODULE_STEM := core.so
LOCAL_MODULE_PATH := $(LUA_LIBS_PATH)/mime

include $(BUILD_SHARED_LIBRARY)

###############################################################################
# lua scripts

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

LUASOCKET_SCRIPTS := \
  src/ftp.lua src/http.lua src/smtp.lua \
  src/socket.lua src/tp.lua src/url.lua

$(LOCAL_MODULE):
	@echo -e ${CL_CYN}"Install: $(LUA_LIBS_PATH)/socket/*.lua"${CL_RST}
	@cp $(luasocketpath)/src/*.lua $(LUA_LIBS_PATH)/socket/
	@rm -f $(LUA_LIBS_PATH)/socket/ltn12.lua
	@rm -f $(LUA_LIBS_PATH)/socket/mime.lua

