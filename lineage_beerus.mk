#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from beerus device
$(call inherit-product, device/lenovo/beerus/device.mk)

PRODUCT_DEVICE := beerus
PRODUCT_NAME := lineage_beerus
PRODUCT_BRAND := Lenovo
PRODUCT_MODEL := Yoga Pad Pro 13
PRODUCT_MANUFACTURER := Lenovo

PRODUCT_GMS_CLIENTID_BASE := android-lenovo

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="LenovoYT-K606F_PRC-user 12 SKQ1.220213.001 14.0.494_230409 release-keys"

BUILD_FINGERPRINT := Lenovo/LenovoYT-K606F_PRC/K606F:12/SKQ1.220213.001/14.0.494_230409:user/release-keys
