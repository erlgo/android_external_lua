
lua_root := $(call my-dir)

# lua_cflags := -DLUA_USE_LINUX // need readline.h (bash)
lua_cflags := -DLUA_USE_POSIX -DLUA_USE_DLOPEN

# ========================================================
# common sources
# ========================================================

LOCAL_PATH := $(lua_root)/src/src
include $(CLEAR_VARS)

LUA_CORE_SRC = \
  lapi.c lcode.c ldebug.c ldo.c ldump.c lfunc.c lgc.c llex.c lmem.c \
  lobject.c lopcodes.c lparser.c lstate.c lstring.c ltable.c ltm.c  \
  lundump.c lvm.c lzio.c

LOCAL_MODULE := luacore
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(LUA_CORE_SRC)
LOCAL_CFLAGS := $(lua_cflags)

include $(BUILD_STATIC_LIBRARY)

# ========================================================
# liblua
# ========================================================

LOCAL_PATH := $(lua_root)/src/src
include $(CLEAR_VARS)

LUA_LIB_SRC = \
  lauxlib.c lbaselib.c ldblib.c liolib.c lmathlib.c loslib.c ltablib.c \
  lstrlib.c loadlib.c linit.c

LOCAL_MODULE := liblua
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := $(LUA_LIB_SRC)
LOCAL_CFLAGS := $(lua_cflags)

# keep all core objects to build plugins
LOCAL_REQUIRED_MODULES := luacore
LOCAL_WHOLE_STATIC_LIBRARIES := luacore
LOCAL_INSTALLED_MODULE_STEM := liblua

include $(BUILD_STATIC_LIBRARY)

ifeq (liblua, $(filter liblua, $(ALL_MODULES)))

# Install also liblua.a to allow user plugins
liblua := $(call intermediates-dir-for, STATIC_LIBRARIES, liblua)/liblua.a
$(LOCAL_MODULE):
	@echo -e ${CL_CYN}"Install: $(TARGET_OUT)/lib/lua/$@.a $(testlua)"${CL_RST}
	@mkdir -p $(TARGET_OUT)/lib/lua
	@cp $(liblua) $(TARGET_OUT)/lib/lua/
endif

# ========================================================
# lua
# ========================================================

LOCAL_PATH := $(lua_root)/src/src
include $(CLEAR_VARS)

LOCAL_MODULE := lua
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := lua.c
LOCAL_CFLAGS := $(lua_cflags)
LOCAL_LDFLAGS += -Wl,--no-fatal-warnings

LOCAL_SHARED_LIBRARIES := libdl
LOCAL_STATIC_LIBRARIES := liblua
# LOCAL_REQUIRED_MODULES := luacore liblua

LOCAL_MODULE_PATH := $(TARGET_OPTIONAL_EXECUTABLES)
include $(BUILD_EXECUTABLE)

# ========================================================
# luac
# ========================================================

LOCAL_PATH := $(lua_root)/src/src
include $(CLEAR_VARS)

LOCAL_MODULE := luac
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := luac.c print.c
LOCAL_CFLAGS := $(lua_cflags)
LOCAL_LDFLAGS += -Wl,--no-fatal-warnings

LOCAL_STATIC_LIBRARIES := liblua
# LOCAL_REQUIRED_MODULES := luacore liblua

LOCAL_MODULE_PATH := $(TARGET_OPTIONAL_EXECUTABLES)
include $(BUILD_EXECUTABLE)

USER_WANT_ASE_INTF := 0
include $(call all-makefiles-under,$(lua_root))
