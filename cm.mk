PRODUCT_RELEASE_NAME := CRYPTOMILK

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/cdma.mk)
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/marvelc/device_marvelc.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := marvelc
PRODUCT_NAME := cm_marvelc
PRODUCT_BRAND := htc_marvelc
PRODUCT_MODEL := Marvelc
PRODUCT_MANUFACTURER := HTC

PRODUCT_VERSION_DEVICE_RELEASE := ALPHA-$(shell date -u +%Y%m%d)
PRODUCT_VERSION_DEVICE_SPECIFIC := $(PRODUCT_VERSION_DEVICE_RELEASE)

# CM_RELEASE := true
CM_BUILDTYPE := UNOFFICIAL
CM_EXTRAVERSION := $(PRODUCT_VERSION_DEVICE_RELEASE)

BUILD_ID := ASN00$(shell date -u +%Y%m%d)

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_marvelc BUILD_ID=$(BUILD_ID) BUILD_DISPLAY_ID=$(BUILD_ID) BUILD_FINGERPRINT=cyanogenmod/htc_marvelc/marvelc:4.0.4/ASN$(BUILD_ID)/0.1:user/release-keys PRIVATE_BUILD_DESC="0.1 CRYPTOMILK release-keys"
