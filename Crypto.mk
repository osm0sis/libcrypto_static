#######################################
# target static library
include $(CLEAR_VARS)
LOCAL_SHARED_LIBRARIES := $(log_shared_libraries)
LOCAL_C_INCLUDES := $(log_c_includes)

# The static library should be used in only unbundled apps
# and we don't have clang in unbundled build yet.
LOCAL_SDK_VERSION := 9

LOCAL_MODULE_TAGS := optional
LOCAL_MODULE := libcrypto_static
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/android-config.mk $(LOCAL_PATH)/Crypto.mk
include $(LOCAL_PATH)/Crypto-config-target.mk
include $(LOCAL_PATH)/android-config.mk

# Replace cflags with static-specific cflags so we dont build in libdl deps
LOCAL_CFLAGS_32 := $(openssl_cflags_static_32)
LOCAL_CFLAGS_64 := $(openssl_cflags_static_64)

LOCAL_SRC_FILES := $(LOCAL_SRC_FILES_$(TARGET_ARCH))
LOCAL_CFLAGS := $(LOCAL_CFLAGS_$(TARGET_2ND_ARCH)) $(LOCAL_CFLAGS_$(TARGET_ARCH))
LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/crypto \
	$(LOCAL_PATH)/crypto/asn1 \
	$(LOCAL_PATH)/crypto/evp \
	$(LOCAL_PATH)/crypto/modes \
	$(LOCAL_PATH)/include
include $(BUILD_STATIC_LIBRARY)

