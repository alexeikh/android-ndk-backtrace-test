LOCAL_PATH := $(call my-dir)


# libunwind_ndk
# $(TARGET_ARCH) is one of: arm, arm64, x86, or x86_64
ifeq ($(TARGET_ARCH),arm)
include $(CLEAR_VARS)
LOCAL_MODULE := libunwind_ndk
# $(TARGET_ARCH_ABI) is one of: armeabi, armeabi-v7a, arm64-v8a, x86, x86_64
LOCAL_SRC_FILES := $(ANDROID_NDK_ROOT)/sources/cxx-stl/llvm-libc++/libs/$(TARGET_ARCH_ABI)/libunwind.a
include $(PREBUILT_STATIC_LIBRARY)
endif


# C++ names demangling.
include $(CLEAR_VARS)
LOCAL_MODULE := libc++abi
LOCAL_SRC_FILES  := $(ANDROID_NDK_ROOT)/sources/cxx-stl/llvm-libc++/libs/$(TARGET_ARCH_ABI)/libc++abi.a
include $(PREBUILT_STATIC_LIBRARY)


# main
include $(CLEAR_VARS)

LOCAL_MODULE        := $(shell pwd | xargs dirname | xargs basename)
LOCAL_SRC_FILES     := $(wildcard *.c)


LOCAL_CFLAGS        += -std=c11
LOCAL_CFLAGS        += -Wall
LOCAL_CFLAGS        += -DHIDE_EXPORTS

LOCAL_LDFLAGS       += -rdynamic

ifeq ($(TARGET_ARCH),arm)
LOCAL_STATIC_LIBRARIES  += libunwind_ndk
endif

LOCAL_STATIC_LIBRARIES  += libc++abi

include $(BUILD_EXECUTABLE)
