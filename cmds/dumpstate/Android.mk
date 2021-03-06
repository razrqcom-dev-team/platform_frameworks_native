LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

ifdef BOARD_WLAN_DEVICE
LOCAL_CFLAGS := -DFWDUMP_$(BOARD_WLAN_DEVICE)
endif

LOCAL_SRC_FILES := dumpstate.c utils.c

LOCAL_MODULE := dumpstate

LOCAL_SHARED_LIBRARIES := libcutils liblog libselinux

ifdef BOARD_LIB_DUMPSTATE
LOCAL_STATIC_LIBRARIES := $(BOARD_LIB_DUMPSTATE)
LOCAL_CFLAGS += -DBOARD_HAS_DUMPSTATE
endif

LOCAL_CFLAGS += -Wall -Wno-unused-parameter -std=gnu99

include $(BUILD_EXECUTABLE)
