# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Platform path
PLATFORM_COMMON_PATH := device/sony/tone
PRODUCT_PLATFORM_SOD := true

TARGET_BOARD_PLATFORM := msm8996

TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := kryo

BOARD_KERNEL_BASE        := 0x80000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000

BOARD_KERNEL_CMDLINE += androidboot.bootdevice=7464900.sdhci

# Serial console
#BOARD_KERNEL_CMDLINE += earlycon=msm_serial_dm,0x075b0000 restore_msm_uart=0x01014000

TARGET_RECOVERY_FSTAB ?= $(PLATFORM_COMMON_PATH)/rootdir/vendor/etc/fstab.tone

# Dynamic Partitions
# Already set in platform.mk...
#PRODUCT_BUILD_SUPER_PARTITION := true
BOARD_SUPER_PARTITION_GROUPS := sony_dynamic_partitions
# sony_dynamic_partitions will be converted to uppercase, see build/make/core/config.mk
BOARD_SONY_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    vendor \
    product
#    system
BOARD_SUPER_PARTITION_SIZE := 6197084160
BOARD_SUPER_PARTITION_METADATA_DEVICE := system
BOARD_SUPER_PARTITION_BLOCK_DEVICES := system
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 6197084160

# Assume 4MB metadata size.
# 6197084160−4096000 = 6192988160
BOARD_SONY_DYNAMIC_PARTITIONS_SIZE := 6192988160

BOARD_USES_METADATA_PARTITION := true

# See kagura BoardConfig.mk
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 6197084160

# Needed for ota stuff
TARGET_RELEASETOOLS_EXTENSIONS := $(PLATFORM_COMMON_PATH)

# Wi-Fi definitions for Broadcom solution but using brcmfmac instead of bcmdhd kernel driver
BOARD_WLAN_DEVICE           := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_qcwcn

# BT definitions for Broadcom solution
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(PLATFORM_COMMON_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_CUSTOM_BT_CONFIG := $(PLATFORM_COMMON_PATH)/bluetooth/vnd_generic.txt

# RIL
TARGET_PER_MGR_ENABLED := true

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(PLATFORM_COMMON_PATH)/sepolicy_platform

# Display
TARGET_USES_GRALLOC1 := true
TARGET_USES_SDE := true
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_USES_DRM_PP := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 2

# Cache partition
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4

# Platform witout a vendor partition
#TARGET_COPY_OUT_VENDOR := system/vendor
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product

# Treble
BOARD_VNDK_VERSION := current

include device/sony/common/CommonConfig.mk
