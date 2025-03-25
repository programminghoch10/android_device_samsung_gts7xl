#
# SPDX-FileCopyrightText: 2024-2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_IS_TABLET := true

# Inherit from sm8250-common
$(call inherit-product, device/samsung/sm8250-common/common.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Audio configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_platform_info_diff.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_diff.xml \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 1752
TARGET_SCREEN_WIDTH := 2800

# Display
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.surface_flinger.primary_display_orientation=ORIENTATION_270

# Change default boot orientation
#  Id at the end corresponds to the display id on the device.
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.bootanim.set_orientation_4630947232161729153=ORIENTATION_90

# Init files
PRODUCT_PACKAGES += \
    init.gts7xl.rc

# Keylayout
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/configs/idc/sec_e-pen.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/sec_e-pen.idc

# Overlay
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Sensors
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# SPen
PRODUCT_PACKAGES += \
    SPenActions

PRODUCT_PACKAGES += \
    vendor.samsung.hardware.spen-service.davinci

# Inherit from vendor blobs
$(call inherit-product-if-exists, vendor/samsung/gts7xl/gts7xl-vendor.mk)
