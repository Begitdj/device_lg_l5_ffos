$(call inherit-product, device/qcom/common/common.mk)
PRODUCT_COPY_FILES := \
  device/lge/m4/touch_mcs8000.idc:system/usr/idc/touch_mcs8000.idc \
  device/lge/m4/touch_mcs8000.idc:system/usr/idc/touch_mcs8000_bell.idc \
  device/lge/m4/touch_mcs8000.kl:system/usr/keylayout/touch_mcs8000.kl \
  device/lge/m4/touch_mcs8000.kl:system/usr/keylayout/touch_mcs8000_bell.kl \
  device/lge/m4/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
  vendor/lge/common/proprietary/wifi/WCN1314_qcom_cfg.ini:system/etc/wifi/WCN1314_qcom_cfg.ini \
  vendor/lge/common/proprietary/wifi/WCN1314_qcom_wlan_nv.bin:system/etc/wifi/WCN1314_qcom_wlan_nv.bin

$(call inherit-product-if-exists, vendor/lge/m4/m4-vendor-blobs.mk)
$(call inherit-product-if-exists, vendor/lge/common/vendor-blobs.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

PRODUCT_PROPERTY_OVERRIDES += \
  rild.libpath=/system/lib/libril-qc-1.so \
  rild.libargs=-d /dev/smd0 \
  ril.subscription.types=NV,RUIM \
  ro.telephony.default_network=3 \
  persist.radio.cdg2_flag=false \
  ro.use_data_netmgrd=true \
  ro.moz.ril.simstate_extra_field=true \
  ro.moz.ril.emergency_by_default=true \
  ro.build.version.incremental=B2G-2.2 (@lg5_dev) \
  wifi.interface=wlan0

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_m4
PRODUCT_DEVICE := m4
PRODUCT_BRAND := lge
PRODUCT_MANUFACTURER := LGE
PRODUCT_MODEL := LG Optimus L5  @lg5_dev

PRODUCT_DEFAULT_PROPERTY_OVERRIDES := \
  persist.usb.serialno=$(PRODUCT_NAME)
