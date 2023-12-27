DISTRO := birdycamcam

image:
	bitbake birdycamcam-image

OB_BB_LAYERS += ${OB_ROOT_DIR}/platform/meta-birdycamcam

DL_DIR     ?= ${OB_ROOT_DIR}/downloads
SSTATE_DIR ?= ${OB_ROOT_DIR}/sstate-cache
