CHROME := $(shell which google-chrome 2>/dev/null || which google-chrome-stable 2>/dev/null || which chromium 2>/dev/null || which chromium-browser 2>/dev/null || which chrome 2>/dev/null)
PEM := $(shell find . -maxdepth 1 -name "*.pem")

.PHONY: all
all: release

.PHONY: crx
crx:
ifneq ($(PEM),)
	"$(CHROME)" --disable-gpu --pack-extension=./src --pack-extension-key=$(PEM)
else
	"$(CHROME)" --disable-gpu --pack-extension=./src
	rm ./src.pem
endif
	mv src.crx browser-fingerprint-protector.crx

.PHONY: clean
clean:
	rm -rf private-release
	rm -f *.crx

.PHONY: release
release: clean crx
	mkdir -p private-release
	cp -r src private-release
	zip -jFS private-release/chrome.zip private-release/src/* key.pem
	rm -rf private-release/src
