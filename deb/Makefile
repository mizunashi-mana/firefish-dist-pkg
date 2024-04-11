#!/usr/bin/make -f

include common/env/env.make

ENV_FILES=\
	common/env/env.make \
	common/env/params.make \

PKG_VERSION_DEB_MAIN=$(subst -,+,$(PKG_VERSION_FIREFISH))

DEB_FILE=firefish.deb
SOURCE_TARBALL=pkg/firefish_$(PKG_VERSION_DEB_MAIN).orig.tar.gz
PKG_FILES_DIR=pkg/firefish-$(PKG_VERSION_DEB_MAIN)
DEBIAN_FILES_DIR=$(PKG_FILES_DIR)/debian

.PHONY: all
all: $(DEB_FILE)

$(DEB_FILE): pkg
	./scripts/build-deb $(PKG_FILES_DIR)
	cp pkg/*.deb '$@'

pkg: $(SOURCE_TARBALL) $(PKG_FILES_DIR) $(DEBIAN_FILES_DIR)

$(SOURCE_TARBALL): $(ENV_FILES)
	mkdir -p $(shell dirname $@)
	wget -q -O '$@' '$(SOURCE_ARCHIVE_URL)'

$(PKG_FILES_DIR): $(SOURCE_TARBALL)
	rm -rf '$@'
	mkdir -p '$@'
	tar zxf '$<' --strip-components 1 -C '$@'
	rm -rf '$@/Makefile'

$(DEBIAN_FILES_DIR): scripts/create-debian-files files $(PKG_FILES_DIR)
	$< $@

VERSION.txt: $(ENV_FILES)
	echo $(PKG_VERSION_DEB_MAIN) > $@
