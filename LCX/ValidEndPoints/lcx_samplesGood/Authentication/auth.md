To use LCX Trading APIs, users are required to first gain authentication. LCX uses API keys to allow access to the API. You can register a new LCX API key at LCX Exchange.

LCX Exchange expects the API Secret key, signature and timestamp in milliseconds to be included as headers in all API requests to the server, which looks like the following:

x-access-timestamp - Current timestamp in milliseconds
x-access-key - Your LCX Exchange API Key
x-access-sign - Signature signed by your LCX Exchange Secret Key