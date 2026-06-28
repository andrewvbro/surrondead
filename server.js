const http = require('http');
const fs = require('fs');
const path = require('path');
const PORT = 5680;
const types = { '.html':'text/html', '.js':'text/javascript', '.css':'text/css', '.json':'application/json' };
http.createServer((req, res) => {
  let p = decodeURIComponent(req.url.split('?')[0]);
  if (p === '/') p = '/index.html';
  const file = path.join(__dirname, p);
  fs.readFile(file, (err, data) => {
    if (err) { res.writeHead(404); res.end('Not found'); return; }
    res.writeHead(200, { 'Content-Type': types[path.extname(file)] || 'application/octet-stream' });
    res.end(data);
  });
}).listen(PORT, () => console.log('SURRONDEAD on http://localhost:' + PORT));
