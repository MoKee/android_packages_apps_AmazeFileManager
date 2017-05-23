#
# Copyright (C) 2014-2017 Arpit Khurana <arpitkh96@gmail.com>, Vishal Nehra <vishalmeham2@gmail.com>
# Copyright (C) 2017 The MoKee Open Source Project
#
# This file is part of Amaze File Manager.
# Amaze File Manager is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_PACKAGE_NAME := AmazeFileManager
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_TAGS := optional
LOCAL_PROGUARD_FLAG_FILES := proguard.flags

ifneq ($(INCREMENTAL_BUILDS),)
    LOCAL_PROGUARD_ENABLED := disabled
    LOCAL_JACK_ENABLED := incremental
    LOCAL_DX_FLAGS := --multi-dex
    LOCAL_JACK_FLAGS := --multi-dex native
endif

LOCAL_MANIFEST_FILE := src/main/AndroidManifest.xml
LOCAL_FULL_LIBS_MANIFEST_FILES := $(LOCAL_PATH)/src/play/AndroidManifest.xml

LOCAL_SRC_FILES := $(call all-java-files-under, src/main)
LOCAL_SRC_FILES += $(call all-java-files-under, src/play)
LOCAL_SRC_FILES += $(call all-java-files-under, libs/StickyHeadersRecyclerView/src/main)

LOCAL_RESOURCE_DIR := \
    $(LOCAL_PATH)/src/main/res \
    frameworks/support/v7/appcompat/res \
    frameworks/support/v7/cardview/res \
    frameworks/support/v7/recyclerview/res \
    frameworks/support/design/res

LOCAL_AAPT_FLAGS := \
    --auto-add-overlay \
    --extra-packages android.support.v7.appcompat \
    --extra-packages android.support.v7.cardview \
    --extra-packages android.support.v7.recyclerview \
    --extra-packages android.support.design \
    --extra-packages com.afollestad.materialdialogs \
    --extra-packages com.github.clans.fab \
    --extra-packages com.google.android.gms \
    --extra-packages com.readystatesoftware.systembartint

LOCAL_AAPT_INCLUDE_ALL_RESOURCES := true

LOCAL_AAPT_FLAGS += --rename-manifest-package org.mokee.filemanager

LOCAL_STATIC_JAVA_LIBRARIES := \
    android-support-annotations \
    android-support-design \
    android-support-v4 \
    android-support-v7-appcompat \
    android-support-v7-cardview \
    android-support-v7-palette \
    android-support-v7-recyclerview \
    jar-commons-compress \
    jar-ftplet-api \
    jar-ftpserver-core \
    jar-jcifs \
    jar-jsch \
    jar-junrar \
    jar-mina-core \
    jar-slf4j-api \
    jar-slf4j-simple \
    volley

LOCAL_STATIC_JAVA_AAR_LIBRARIES := \
    aar-cloudrail-si-android \
    aar-fab \
    aar-material-dialogs \
    aar-mp-android-chart \
    aar-play-services-base \
    aar-play-services-basement \
    aar-play-services-plus \
    aar-systembartint \
    mokee-libsuperuser

include $(BUILD_PACKAGE)

include $(CLEAR_VARS)

PLAY_VERSION := 10.2.1
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES := \
    aar-fab:libs/com.github.clans.fab-1.6.1.aar \
    aar-material-dialogs:libs/com.afollestad.material-dialogs.core-0.9.2.3.aar \
    aar-mp-android-chart:libs/com.github.mikephil-3.0.2.aar \
    aar-systembartint:libs/com.readystatesoftware.systembartint-1.0.3.aar \
    aar-cloudrail-si-android:libs/com.cloudrail-2.17.0.aar \
    aar-play-services-base:../../../external/google/play-services-base/$(PLAY_VERSION)/play-services-base-$(PLAY_VERSION).aar \
    aar-play-services-basement:../../../external/google/play-services-basement/$(PLAY_VERSION)/play-services-basement-$(PLAY_VERSION).aar \
    aar-play-services-plus:../../../external/google/play-services-plus/$(PLAY_VERSION)/play-services-plus-$(PLAY_VERSION).aar \
    jar-commons-compress:libs/org.apache.commons.commons-compress-1.10.jar \
    jar-ftplet-api:libs/org.apache.ftpserver.ftplet-api-1.1.0.jar \
    jar-ftpserver-core:libs/org.apache.ftpserver.ftpserver-core-1.1.0.jar \
    jar-jcifs:libs/jcifs-1.3.18.jar \
    jar-jsch:libs/jsch-0.1.53.jar \
    jar-junrar:libs/com.github.junrar-0.7.jar \
    jar-mina-core:libs/mina-core-2.0.13.jar \
    jar-slf4j-api:libs/org.slf4j.slf4j-api-1.7.21.jar \
    jar-slf4j-simple:libs/org.slf4j.slf4j-simple-1.7.21.jar

include $(BUILD_MULTI_PREBUILT)

include $(call all-makefiles-under,$(LOCAL_PATH))
