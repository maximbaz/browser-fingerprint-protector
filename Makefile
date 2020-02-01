VERSION ?= $(shell cat .version)
NAME = browser-fingerprint-protector

CLEAN_FILES := chromium firefox dist
CHROME := $(shell which chromium 2>/dev/null || which chromium-browser 2>/dev/null || which chrome 2>/dev/null || which google-chrome 2>/dev/null || which google-chrome-stable 2>/dev/null)

.PHONY: all
all: dist

.PHONY: crx-webstore
crx-webstore:
	"$(CHROME)" --disable-gpu --pack-extension=./src --pack-extension-key=webstore.pem
	mv src.crx $(NAME)-webstore.crx

.PHONY: clean
clean:
	rm -rf dist
	rm -f *.crx

.PHONY: dist
dist: clean crx-webstore
	mkdir -p dist

	git archive -o dist/$(NAME)-$(VERSION).tar.gz --format tar.gz --prefix=$(NAME)-$(VERSION)/ $(VERSION)

	(cd src && zip -r ../dist/$(NAME)-$(VERSION).zip *)
	mv $(NAME)-webstore.crx dist/$(NAME)-webstore-$(VERSION).crx

	for file in dist/*; do \
	    gpg --detach-sign --armor "$$file"; \
	done
