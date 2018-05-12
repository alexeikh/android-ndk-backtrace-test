# Since Android API 21, only PIE executables are supported.
APP_PIE := true

# PIE executables are only supported since Android API 16.
APP_PLATFORM := android-16

#APP_ABI := all

APP_OPTIM := debug
#APP_OPTIM := release

NDK_TOOLCHAIN_VERSION := clang
#NDK_TOOLCHAIN_VERSION := 4.9

#APP_STL := c++_static
#APP_STL := gnustl_static
APP_STL := none
