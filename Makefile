#!/usr/bin/make -f

include envs/common.make

SOURCE_TARBALL=pkg/firefish_$(PKG_VERSION_DEB).orig.tar.gz
PKG_FILES_DIR=pkg/firefish-$(PKG_VERSION_DEB)

.PHONY: all
all: deb

.PHONY: source
source:
	env \
		'SOURCE_GIT_REPOSITORY=$(FIREFISH_SOURCE_GIT_REPO)' \
		'SOURCE_GIT_REVISION=$(FIREFISH_SOURCE_GIT_COMMIT_REF)' \
		./scripts/create-orig-files '$(SOURCE_TARBALL)'

.PHONY: pkg-files
pkg-files: source
	rm -rf '$(PKG_FILES_DIR)'
	./scripts/create-pkg-files '$(PKG_FILES_DIR)' '$(SOURCE_TARBALL)'

.PHONY: deb
deb: pkg-files
	./scripts/build-deb '$(PKG_FILES_DIR)'

.PHONY: version
version:
	echo $(PKG_VERSION_DEB) > VERSION.txt
