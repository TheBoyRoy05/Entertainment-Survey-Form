require('dotenv').config();
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const dns = require('dns');
const URL = require('url');
const app = express();

// Basic Configuration
const port = process.env.PORT || 3000;

app.use(cors());

app.use('/public', express.static(`${process.cwd()}/public`));

app.get('/', function(req, res) {
  res.sendFile(process.cwd() + '/views/index.html');
});

// Your first API endpoint
app.get('/api/hello', function(req, res) {
  res.json({ greeting: 'hello API' });
});

app.listen(port, function() {
  console.log(`Listening on port ${port}`);
});

app.use(bodyParser.urlencoded({ extended: false }));
const urlDatabase = {};
let urlID = 0;

app.post('/api/shorturl', (req, res) => {
  const url = req.body["url"];
  dns.lookup(new URL.URL(url).hostname, (err) => {
    if (err) {
      res.json({ error: 'invalid url' });
    } else {
      urlDatabase[urlID] = url;
      res.send({ original_url: url, short_url: urlID++ });
    }
  });
});

app.get('/api/shorturl/:id', (req, res) => {
  const url = urlDatabase[req.params.id];
  if (url) res.redirect(url);
});
