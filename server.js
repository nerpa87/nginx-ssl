var DELAY_MS = 500;
var http = require('http');
var fs = require('fs');

var static = require('node-static');
var file = new static.Server('./static');

var s = http.createServer((req, res) => {
  console.log('new request at', new Date().toISOString())
  //res.end('OK: ' + req.url)
  setTimeout(() => file.serve(req, res), DELAY_MS)
})

sock = '/var/run/nginx.sock'
s.listen(sock, () => fs.chmodSync(sock, 0777))
