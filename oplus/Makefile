CANOE_BASE_DTB += ../qcom/canoe.dtb ../qcom/canoe-v2.dtb ../qcom/canoe-tp.dtb ../qcom/canoe-tp-v2.dtb ../qcom/alor.dtb \
	../qcom/alor-interposer.dtb ../qcom/alor-interposer-v2.dtb ../qcom/alorp.dtb
CANOE_APQ_BASE_DTB += ../qcom/canoep.dtb ../qcom/canoep-v2.dtb ../qcom/canoep-tp.dtb ../qcom/canoep-tp-v2.dtb

CANOE_BOARDS += \
	infiniti-0-24831-t0-canoe-overlay.dtbo \
	infiniti-1-24863-t0-canoe-overlay.dtbo \
	infiniti-2-24863-pre-t0-canoe-overlay.dtbo \
	infiniti-3-24831-pre-t0-canoe-overlay.dtbo \
	infiniti-4-24863-evb-canoe-overlay.dtbo \
	infiniti-5-24831-production-canoe-overlay.dtbo \
	infiniti-6-24863-production-canoe-overlay.dtbo \
	infiniti-7-24831-evb-canoe-overlay.dtbo

dtb-y += $(CANOE_BASE_DTB) $(CANOE_APQ_BASE_DTB) $(CANOE_BOARDS)

always-y        := $(dtb-y)
subdir-y        := $(dts-dirs)
clean-files     := *.dtb *.dtbo
