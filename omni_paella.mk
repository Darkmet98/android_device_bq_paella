# Copyright (C) 2010 The Android Open Source Project
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

#
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)


# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# must be before including omni part
TARGET_BOOTANIMATION_SIZE := 1080x720

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Must define platform variant before including any common things
TARGET_BOARD_PLATFORM_VARIANT := msm8916

# Discard inherited values and use our own instead.
PRODUCT_NAME := omni_paella
PRODUCT_DEVICE := paella
PRODUCT_BRAND := bq
PRODUCT_MANUFACTURER := bq

TARGET_VENDOR_PRODUCT_NAME := Aquaris_X5
TARGET_VENDOR_DEVICE_NAME := Aquaris_X5
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=Aquaris_X5 PRODUCT_NAME=Aquaris_X5

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=paella \
    PRODUCT_NAME=paella \
    BUILD_FINGERPRINT=bq/Aquaris_X5/Aquaris_X5:7.1.1/NMF26Q/59e1a402e9:userdebug/test-keys \
    PRIVATE_BUILD_DESC="Paella-user 7.1.1 NMF26Q 25 dev-keys"

PRODUCT_SYSTEM_PROPERTY_BLACKLIST += ro.product.model
