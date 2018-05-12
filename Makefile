NDK_BUILD := /opt/android/android-ndk-r16b/ndk-build
APP_NAME := $(shell pwd | xargs basename)

default_target: build

build:
	$(NDK_BUILD) -C jni

run: build
	PHONE_ABI=$$(adb shell getprop ro.product.cpu.abi | tr -d '\r\n'); \
	adb push  "libs/$${PHONE_ABI}/$(APP_NAME)" /data/local/tmp/
	adb shell "/data/local/tmp/$(APP_NAME)"

clean:
	rm -rf libs obj
