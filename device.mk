#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/m01q

#$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Call the proprietary setup
#$(call inherit-product, vendor/samsung/m01q/m01q-vendor.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

PRODUCT_TARGET_VNDK_VERSION := 30
PRODUCT_SHIPPING_API_LEVEL := 30
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# Overlays
PRODUCT_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlay \
    $(DEVICE_PATH)/overlay-lineage

PRODUCT_ENFORCE_RRO_TARGETS += *

PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    $(DEVICE_PATH)/overlay-lineage/lineage-sdk \
    $(DEVICE_PATH)/overlay-lineage/packages/apps/Snap

PRODUCT_PACKAGES += \
    NoCutoutOverlay

# No A/B
AB_OTA_UPDATER := false

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.bluetooth.default \
    audio.r_submix.default \
    android.hardware.audio.service

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/audio/audio_effects.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/audio_effects.xml \
    $(DEVICE_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_PRODUCT)/vendor_overlay/$(PLATFORM_VNDK_VERSION)/etc/audio_policy_configuration.xml \
    $(DEVICE_PATH)/configs/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/audio_policy_volumes.xml \
    $(DEVICE_PATH)/configs/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default_volume_tables.xml
	
# Bluetooth
PRODUCT_PACKAGES += \
    audio.bluetooth.default \
    android.hardware.bluetooth.audio@2.0-impl \
    vendor.qti.hardware.btconfigstore@1.0.vendor \

# Camera
PRODUCT_PACKAGES += \
    Snap

# Init
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.qcom.rc \
    ueventd.qcom.rc

# LiveDisplay
PRODUCT_PACKAGES += \
    lineage.livedisplay@2.0-service.samsung-qcom

# Keylayout
PRODUCT_COPY_FILES += \
    device/samsung/m01q/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_SYSTEM)/usr/keylayout/gpio-keys.kl

# Recovery
PRODUCT_PACKAGES += \
    fastbootd \
    init.recovery.qcom.rc

# SamsungDoze
PRODUCT_PACKAGES += \
    SamsungDoze

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext


# GSI AVB Public Keys
PRODUCT_PACKAGES += \
    q-gsi.avbpubkey \
    r-gsi.avbpubkey \
    s-gsi.avbpubkey

# FM
PRODUCT_PACKAGES += \
    FM2 \
	libfmjni
    libqcomfm_jni \
    init.qti.fm.sh \
    qcom.fmradio

PRODUCT_BOOT_JARS += \
    qcom.fmradio

# Offline Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images \
    lineage_charger_res_images

# WiFi Display
PRODUCT_PACKAGES += \
    libnl
	
# USB HAL
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service

#PRODUCT_BOOT_JARS += \
#    WfdCommon

# RIL
PRODUCT_PACKAGES += \
    android.hardware.radio@1.4 \
    android.hardware.radio.config@1.0 \
    android.hardware.secure_element@1.0 \
    android.hardware.radio.deprecated@1.0 \
    android.hardware.secure_element@1.0 \
    librmnetctl \
    libcnefeatureconfig \
    libprotobuf-cpp-full \
    libxml2 \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \
    qti-telephony-utils \
    qti_telephony_utils.xml

# IMS
PRODUCT_PACKAGES += \
    ims-ext-common \
    lib-imsvtshim \
    ims_ext_common.xml

# Skip mount
PRODUCT_COPY_FILES += $(DEVICE_PATH)/skip_mount.cfg:system/etc/init/config/skip_mount.cfg
