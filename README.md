# Firefox OS 2.2 for LG Optimus L5 (m4 / LG-E610 / LG-E612)

Complete open-source device tree and platform patches required to build and run Firefox OS 2.2 (Gecko 37 + Gaia 2.2) on the LG Optimus L5 (`m4`).

## Device Specifications
* **SoC**: Qualcomm Snapdragon S1 (MSM7227A)
* **CPU**: ARMv7 Cortex-A5 @ 800 MHz
* **GPU**: Adreno 200
* **RAM**: 512 MB
* **Display**: 320x480 (HVGA)
* **Touch Controller**: Melfas MCS8000

---

## Repository Structure

```
device_lg_l5_ffos/
├── README.md
├── device/
│   └── lge/
│       └── m4/                   # Device tree for LG Optimus L5 (m4)
└── patches/
    ├── gecko.patch               # Gecko 37 patches (libopus, sensors, touch, model)
    ├── bluez-bluetooth.patch     # BlueZ 4.93 kernel 3.0.8 mgmtops compatibility fix
    ├── frameworks-base-touch.patch # Android InputReader touch release fix for Melfas
    ├── hardware-legacy-wifi.patch # Wi-Fi interface fallback to wlan0
    ├── system-core-init.patch    # Gonk init.rc & qcom service adjustments
    └── build-linker.patch        # Build system linker script fix for modern host tools
```

---

## Patch Descriptions & Application

### 1. Gecko 37 (`patches/gecko.patch`)
Fixes ARM `-fno-tree-vectorize` compilation in libopus, routes BMA250 accelerometer/orientation events, fixes Melfas touch release handling in Gonk, and displays the device model in Settings:
```bash
cd gecko && git apply ../patches/gecko.patch && cd ..
```

### 2. Bluetooth (`patches/bluez-bluetooth.patch`)
Fixes BlueZ 4.93 `read_info_complete` packet length mismatch with Linux 3.0.8 kernel `mgmtops`, allowing Bluetooth to initialize cleanly:
```bash
cd external/bluetooth/bluez && git apply ../../../patches/bluez-bluetooth.patch && cd ../../..
```

### 3. Touchscreen (`patches/frameworks-base-touch.patch`)
Fixes Melfas MCS8000 touch release reporting in Android's `InputReader`:
```bash
cd frameworks/base && git apply ../../patches/frameworks-base-touch.patch && cd ../..
```

### 4. Wi-Fi (`patches/hardware-legacy-wifi.patch`)
Adds fallback to `wlan0` when connecting to `wpa_supplicant`:
```bash
cd hardware/libhardware_legacy && git apply ../../patches/hardware-legacy-wifi.patch && cd ../..
```

### 5. System Core & Init (`patches/system-core-init.patch`)
Adjusts `qmuxd` service class to core and cleans up ICS ramdisk mounts:
```bash
cd system/core && git apply ../../patches/system-core-init.patch && cd ../..
```

### 6. Build Toolchain (`patches/build-linker.patch`)
Fixes host toolchain linker relocation issues on modern Linux build systems:
```bash
cd build && git apply ../patches/build-linker.patch && cd ..
```

---

## Maintainer
* Maintainer: `@lg5_dev`
