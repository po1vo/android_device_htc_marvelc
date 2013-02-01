#
# Copyright (C) 2009 The Android Open Source Project
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

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

$(call inherit-product, build/target/product/full_base.mk)
$(call inherit-product, build/target/product/languages_full.mk)

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

$(call inherit-product, device/htc/msm7x27-common/msm7x27.mk)
$(call inherit-product, device/htc/marvel-common/marvel.mk)

DEVICE_PACKAGE_OVERLAYS := \
    device/htc/marvelc/overlay \
    device/htc/msm7x27-common/overlay

# Permissions
#PRODUCT_COPY_FILES += \
#    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml


# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/marvelc/key/marvel-keypad.kl:system/usr/keylayout/marvelc-keypad.kl \
    device/htc/marvelc/key/marvel-keypad.kcm.bin:system/usr/keychars/marvelc-keypad.kcm.bin \
    device/htc/marvelc/key/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/marvelc/key/cy8c-touchscreen.kl:system/usr/keylayout/cy8c-touchscreen.kl

PRODUCT_COPY_FILES += \
    device/htc/marvelc/init.marvelc.rc:root/init.marvelc.rc \
    device/htc/marvelc/ueventd.marvelc.rc:root/ueventd.marvelc.rc

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libhtc_ril.so \
    ro.ril.enable.dtm=1 \
    ro.ril.hsdpa.category=8 \
    ro.ril.hsupa.category=5 \
    ro.ril.disable.fd.plmn.prefix=23402,23410,23411 \
    ro.ril.def.agps.mode=2 \
    ro.ril.hsxpa=2 \
    ro.ril.gprsclass=12 \
    mobiledata.interfaces=rmnet0,rmnet1,rmnet2,gprs,ppp0 \
    wifi.interface = wlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.sf.lcd_density = 160 \
    ro.opengles.version=131072 \
    ro.htc.camerahack=msm7k

# Default network type.
# 4 => CDMA preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=4

# For emmc phone storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.phone_storage = 0

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/marvelc/marvelc-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    settings.display.autobacklight=1 \
    settings.display.brightness=143 \
    persist.service.mount.playsnd = 0 \
    ro.com.google.locationfeatures = 1 \
    ro.setupwizard.mode=OPTIONAL \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.aud.wma.enabled=1 \
    ro.media.dec.vid.wmv.enabled=1 \
    dalvik.vm.dexopt-flags=m=y \
    net.bt.name=Android \
    ro.config.sync=yes

# Add device specific modules
PRODUCT_PACKAGES += \
    lights.marvelc \
    gps.marvelc \
    audio.a2dp.default \
    audio.primary.marvelc \
    audio_policy.marvelc
