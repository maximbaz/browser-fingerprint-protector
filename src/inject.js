(function() {
  "use strict";

  const originalUserAgent = window.navigator.userAgent;
  const fakeUserAgent = originalUserAgent.replace(
    /\(.*?(?=(; rv:[^\)]+)?\))/,
    "(Windows NT 10.0; Win64; x64"
  );
  const fakeVersion = fakeUserAgent.substr(8);

  window.navigator.__defineGetter__("appVersion", function() {
    return fakeVersion;
  });
  window.navigator.__defineGetter__("language", function() {
    return "en-US";
  });
  window.navigator.__defineGetter__("languages", function() {
    return ["en-US", "en"];
  });
  window.navigator.__defineGetter__("mimeTypes", function() {
    return { length: 0 };
  });
  window.navigator.__defineGetter__("oscpu", function() {
    return undefined;
  });
  window.navigator.__defineGetter__("platform", function() {
    return "Win32";
  });
  window.navigator.__defineGetter__("plugins", function() {
    return { length: 0 };
  });
  window.navigator.__defineGetter__("userAgent", function() {
    return fakeUserAgent;
  });
})();
