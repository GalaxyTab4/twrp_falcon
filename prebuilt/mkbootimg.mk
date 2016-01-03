
$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES) $(BOOTIMAGE_EXTRA_DEPS)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE))
	@echo -e ${CL_CYN}"Made boot image: $@"${CL_RST}

LZMA_RECO := $(PRODUCT_OUT)/ramdisk-recovery-lzma.img
$(LZMA_RECO): $(recovery_ramdisk)
	$(hide) gunzip -f < $(recovery_ramdisk) | lzma -e > $@
	$(hide) mv $(LZMA_RECO) $(recovery_ramdisk)
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(LZMA_RECO) $(recovery_kernel) \
		$(RECOVERYIMAGE_EXTRA_DEPS)
	@echo -e ${CL_CYN}"----- Making recovery image ------"${CL_RST}
		$(call pretty,"Target recovery image: $@")
	$(call build-recoveryimage-target, $@)
