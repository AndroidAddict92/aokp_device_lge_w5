## Specify phone tech before including full_phone

$(call inherit-product, vendor/aokp/configs/gsm.mk)

# Release name

PRODUCT_RELEASE_NAME := w5

# Inherit some common CM stuff.

$(call inherit-product, vendor/aokp/configs/common_full_phone.mk)

# Inherit device configuration

$(call inherit-product, device/lge/w5/device_w5.mk)

# Correct boot animation size for the screen

TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

## Device identifier. This must come after all inclusions

PRODUCT_DEVICE := w5
PRODUCT_NAME := aokp_w5
PRODUCT_BRAND := lge
PRODUCT_MODEL := w5
PRODUCT_MANUFACTURER := lge

# CM packages

PRODUCT_PACKAGES += \
Torch
