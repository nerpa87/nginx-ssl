var DELAY_MS = 500;
var http = require('http');
var fs = require('fs');

//var static = require('node-static');
//var file = new static.Server('./static');

var s = http.createServer(function(req, res) {
  console.log('new request at', new Date().toISOString())
  //res.end('OK: ' + req.url)
  //setTimeout(() => file.serve(req, res), DELAY_MS)
  setTimeout(function() {
	var path = req.url === '/' ? '/index.html' : req.url
	fs.readFile('static' + path, function(err, data){
		if (err) {
			console.log('err', err)
			return res.end('No file')
		}
		var mime;
		if (/\.png$/.test(path)) 
			mime = 'image/png'
		else if (req.url === '/' || /\.html$/.test(path))
			mime = 'text/html'
		else
			return res.end('No mime')
		res.writeHead(200, {'Content-Type': mime});
		res.end(data);
	})
  }, DELAY_MS)
})

sock = '/var/run/nginx.sock'
s.listen(sock, function() {fs.chmodSync(sock, 0777)})
