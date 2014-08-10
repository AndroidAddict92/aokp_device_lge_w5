$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lge/w5/w5-vendor.mk)

PRODUCT_AAPT_CONFIG := normal mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

DEVICE_PACKAGE_OVERLAYS += device/lge/w5/overlay

LOCAL_PATH := device/lge/w5
PREBUILT_PATH := device/lge/w5/prebuilts

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(LOCAL_PATH)/fstab.qcom:root/fstab.qcom

PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/vendor/firmware/WCNSS_cfg.dat:system/vendor/firmware/wlan/prima/WCNSS_cfg.dat \
    $(PREBUILT_PATH)/system/etc/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    $(PREBUILT_PATH)/system/firmware/WCNSS_qcom_cfg.ini:system/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
    $(PREBUILT_PATH)/system/etc/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin

PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/system/etc/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(PREBUILT_PATH)/system/etc/media_codecs.xml:system/etc/media_codecs.xml

# Prebuilt kl and kcm keymaps

PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/system/usr/hs_detect.kl:system/usr/keylayout/hs_detect.kl \
    $(PREBUILT_PATH)/system/usr/pmic8xxx_pwrkey.kl:system/usr/keylayout/pmic8xxx_pwrkey.kl \
    $(PREBUILT_PATH)/system/usr/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Prebuilt input device calibration files

PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/system/usr/touch_dev.idc:system/usr/idc/touch_dev.idc

# These are the hardware-specific features

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# GPS configuration

PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/system/etc/gps.conf:system/etc/gps.conf \
    $(PREBUILT_PATH)/system/etc/sap.conf:system/etc/sap.conf

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608

# Audio configs

PRODUCT_PROPERTY_OVERRIDES += \
    ro.lge.audio_soundprofile=true \
    ro.lge.audio_soundexception=true \
    persist.audio.fluence.voicecall=true \
    persist.audio.nsenabled=ON \
    ro.qc.sdk.audio.fluencetype=fluence \
    av.offload.enable=false \
    audio.offload.buffer.size.kbytes=32 \
    af.resampler.quality=4 \
    tunnel.audio.encode=false \
    persist.audio.fluence.voicerec=false \
    ro.qc.sdk.audio.ssr=false

# Filesystem management tools

PRODUCT_PACKAGES += \
    e2fsck

PRODUCT_PACKAGES += \
    libgenlock \
    liboverlay \
    hwcomposer.msm8960 \
    gralloc.msm8960 \
    copybit.msm8960 \
    memtrack.msm8960

PRODUCT_PACKAGES += \
    audio_policy.msm8960 \
    audio.primary.msm8960 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler

PRODUCT_PACKAGES += \
    libmm-omxcore \
    libdivxdrmdecrypt \
    libOmxVdec \
    libOmxVenc \
    libOmxCore \
    libstagefrighthw \
    libc2dcolorconvert

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-qmi-1.so

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# Enable AAC 5.1 output

PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true

PRODUCT_PACKAGES += \
    lights.msm8960

PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/system/etc/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/system/etc/thermal-engine-8610.conf:system/etc/thermal-engine-8610.conf

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240

PRODUCT_PACKAGES += \
    conn_init \
    hwaddrs

PRODUCT_COPY_FILES += \
    $(PREBUILT_PATH)/system/etc/init.gammaw.bt.sh:system/etc/init.gammaw.bt.sh


$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_w5
PRODUCT_DEVICE := w5
