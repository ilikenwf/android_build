#
# Copyright (C) 2007 The Android Open Source Project
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

PRODUCT_POLICY := android.policy_phone
PRODUCT_PROPERTY_OVERRIDES :=

PRODUCT_PACKAGES := \
	Calculator \
	DeskClock \
	Email \
	Exchange2 \
	Gallery \
	Music \
	Mms \
	Phone \
	SoftKeyboard \
	SystemUI \
	Launcher2 \
	Development \
	DrmProvider \
	Fallback \
	Settings \
	SdkSetup \
	CustomLocale \
	sqlite3 \
	InputDevices \
	LatinIME \
	CertInstaller \
	LiveWallpapersPicker \
	GestureBuilder \
	CubeLiveWallpapers \
	QuickSearchBox \
	WidgetPreview \
	monkeyrunner \
	guavalib \
	jsr305lib \
	jython \
	jsilver \
	librs_jni \
	ConnectivityTest \
	GpsLocationTest \
	CalendarProvider \
	Calendar \
	SmokeTest \
	SmokeTestApp \
	rild \
	LegacyCamera


# Define the host tools and libs that are parts of the SDK.
-include sdk/build/product_sdk.mk
-include development/build/product_sdk.mk

# audio libraries.
PRODUCT_PACKAGES += \
	audio.primary.goldfish \
	audio_policy.default \
	local_time.default

PRODUCT_PACKAGE_OVERLAYS := development/sdk_overlay

PRODUCT_COPY_FILES := \
	device/generic/goldfish/data/etc/apns-conf.xml:system/etc/apns-conf.xml \
	system/core/rootdir/etc/vold.fstab:system/etc/vold.fstab \
	frameworks/base/data/sounds/effects/camera_click.ogg:system/media/audio/ui/camera_click.ogg \
	frameworks/base/data/sounds/effects/VideoRecord.ogg:system/media/audio/ui/VideoRecord.ogg \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	development/tools/emulator/system/camera/media_profiles.xml:system/etc/media_profiles.xml \
	development/tools/emulator/system/camera/media_codecs.xml:system/etc/media_codecs.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	hardware/libhardware_legacy/audio/audio_policy.conf:system/etc/audio_policy.conf

$(call inherit-product-if-exists, frameworks/base/data/fonts/fonts.mk)
$(call inherit-product-if-exists, frameworks/base/data/keyboards/keyboards.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core.mk)

# Overrides
PRODUCT_BRAND := generic
PRODUCT_NAME := sdk
PRODUCT_DEVICE := generic

# locale + densities. en_US is both first and in alphabetical order to
# ensure this is the default locale.
PRODUCT_LOCALES = \
	en_US

# include available languages for TTS in the system image
-include external/svox/pico/lang/PicoLangEnUsInSystem.mk
