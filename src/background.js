// eslint-disable-next-line no-undef
chrome.webRequest.onBeforeSendHeaders.addListener(
  details => {
    for (let i = 0; i < details.requestHeaders.length; i++) {
      if (details.requestHeaders[i].name === "User-Agent") {
        const originalUserAgent = details.requestHeaders[i].value;
        const fakeUserAgent = originalUserAgent.replace(
          /\(.*?\)/,
          "(Windows NT 10.0; Win64; x64)"
        );
        details.requestHeaders[i].value = fakeUserAgent;
      } else if (details.requestHeaders[i].name === "Accept-Language") {
        details.requestHeaders[i].value = "en-US,en;q=0.5";
      }
    }
    return { requestHeaders: details.requestHeaders };
  },
  { urls: ["<all_urls>"] },
  ["blocking", "requestHeaders", "extraHeaders"]
);
