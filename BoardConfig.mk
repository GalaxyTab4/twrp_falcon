#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

RECOVERY_VERSION := 20160103

DEVICE_PATH := device/motorola/falcon
PREBUILT_PATH := device/motorola/falcon/prebuilt

# Assert
TARGET_OTA_ASSERT_DEVICE := xt1031,xt1032,xt1033,xt1034,falcon_umts,falcon_umtsds,falcon_cdma,falcon_retuaws,falcon,falcon_gpe

# Platform
BOARD_VENDOR := motorola-qcom
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305

USE_CLANG_PLATFORM_BUILD := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_MEMCPY_BASE_OPT_DISABLE := true
TARGET_CPU_VARIANT := krait

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8226
TARGET_NO_BOOTLOADER := true

# Kernel
TARGET_PREBUILT_KERNEL := $(PREBUILT_PATH)/kernel
BOARD_KERNEL_CMDLINE := console=null androidboot.console=null androidboot.bootdevice=msm_sdcc.1 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 vmalloc=400M utags.blkdev=/dev/block/platform/msm_sdcc.1/by-name/utags androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_DTBTOOL_ARGS := --force-v2
BOARD_CUSTOM_BOOTIMG_MK := $(PREBUILT_PATH)/mkbootimg.mk
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100 --board $(RECOVERY_VERSION)
TARGET_KERNEL_SOURCE := kernel/motorola/msm8226
# TARGET_KERNEL_CONFIG := falcon_defconfig

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm
TARGET_LIBINIT_DEFINES_FILE := $(PREBUILT_PATH)/init_falcon.cpp
TARGET_UNIFIED_DEVICE := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 10485760
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1023410176
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5930598400 # 5930614784 - 16384

# Charger
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/mmi_lpm/lpm_mode

# Display
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_USES_C2D_COMPOSITION := true
# TARGET_USES_ION := true
USE_OPENGL_RENDERER := true

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true

# Recovery
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_RECOVERY_FSTAB := $(PREBUILT_PATH)/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_RECOVERY_SWIPE := true
RECOVERY_VARIANT := twrp

# TWRP
BOARD_HAS_NO_REAL_SDCARD := true
DEVICE_RESOLUTION := 720x1280
HAVE_SELINUX := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_IGNORE_MAJOR_AXIS_0 := true
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_L_CRYPTO := true
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_INTERNAL_STORAGE_PATH := "/data/media"
ifneq ($(filter peregrine thea titan,$(TARGET_DEVICE)),)
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard1"
endif
TW_NO_USB_STORAGE := false
TW_NO_USB_STORAGE := true
#TW_TARGET_USES_QCOM_BSP := true
TW_THEME := portrait_hdpi
TW_INCLUDE_NTFS_3G := false

#MultiROM
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := $(PREBUILT_PATH)/mr_init_devices.c
MR_DPI := hdpi
MR_DPI_FONT := 160
MR_FSTAB := $(PREBUILT_PATH)/twrp.fstab
MR_INFOS := $(PREBUILT_PATH)/mrom_infos
MR_KEXEC_MEM_MIN := 0x05000000
MR_KEXEC_DTB := true
MR_PIXEL_FORMAT := "RGBX_8888"
MR_CONTINUOUS_FB_UPDATE := true
MR_DEVICE_VARIANTS := xt1031 xt1032 xt1033 xt1034 falcon_umts falcon_umtsds falcon_cdma falcon_retuaws falcon falcon_gpe

# SELinux
-include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += $(VENDOR_PATH)/sepolicy

#TARGET_TC_ROM := 4.9
#TARGET_TC_KERNEL := 4.9
#TARGET_GCC_VERSION_EXP := $(TARGET_TC_ROM)
#TARGET_KERNEL_CUSTOM_TOOLCHAIN := $(TARGET_TC_KERNEL)
