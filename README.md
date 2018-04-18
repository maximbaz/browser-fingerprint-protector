# Browser Fingerprint Protector

## How it works

The extension protects the information in `window.navigator` and HTTP request headers to complicate browser fingerprinting.

* Completely hides `mimeTypes` and `plugins`.
* Pretends that you only have `English US` language.
* Pretends that you use `Windows 10`.

## How to validate that it works

* [whoer.net](https://whoer.net/) is a good way to see what browser is leaking. Ignore the "anonymity percentage", focus on the information that it is able to retrieve, such as languages, user agent, plugins, etc.
* [Most Common User Agents](https://techblog.willshouse.com/2012/01/03/most-common-user-agents/) is a website that shows the current most common user agent. It is expected that with this extension your browser is listed among the first few entries in the table.

## Supported browsers

Currently `Chromium` and `Google Chrome` are supported.

## Other useful extensions to protect your privacy

* [HTTPS Everywhere](https://chrome.google.com/webstore/detail/https-everywhere/gcbommkclmclpchllfjekcdonpmejbdp?utm_source=chrome-app-launcher-info-dialog)
* [uBlock Origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?utm_source=chrome-app-launcher-info-dialog)
* [Canvas Defender](https://chrome.google.com/webstore/detail/canvas-defender/obdbgnebcljmgkoljcdddaopadkifnpm?utm_source=chrome-app-launcher-info-dialog)

## Credits

Icon made by [Freepik](http://www.freepik.com) from [Flaticon](https://www.flaticon.com/) is licensed by [CC 3.0 BY](http://creativecommons.org/licenses/by/3.0/).
