# SPDX-License-Identifier: GPL-2.0
vendor := $(src)

ifeq ($(CONFIG_ARCH_CANOE),y)
# Inline subsystem definitions need the same headers as external DT builds.
DTC_INCLUDE += $(srctree)/../vendor/qcom/sm8850-modules/qcom/opensource/audio-kernel/include
DTC_INCLUDE += $(srctree)/../vendor/qcom/sm8850-modules/qcom/opensource/camera-kernel
DTC_INCLUDE += $(srctree)/../vendor/qcom/sm8850-modules/qcom/opensource/synx-kernel
export DTC_INCLUDE
endif

ifneq "$(wildcard $(vendor)/qcom)" ""
#OPLUS_DTS_OVERLAY start
	subdir-y += qcom
#OPLUS_DTS_OVERLAY end
endif
#OPLUS_DTS_OVERLAY start
subdir-y += oplus
#OPLUS_DTS_OVERLAY end
