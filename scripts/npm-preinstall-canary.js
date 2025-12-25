const https = require('https');
const url = 'https://CANARYTOKEN_URL/npm_pre_install';

try {
  https
    .get(url, (res) => {
      res.resume();
    })
    .on('error', () => {});
} catch (err) {
  // Swallow errors to avoid failing install.
}
