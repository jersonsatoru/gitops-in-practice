const express = require('express')
const jwt = require('jsonwebtoken')

const app = express();

app.use(express.json());

app.post('/v1/login', (req, res) => {
  const { password, email } = req.body;
  if (password === '123456' && email.toLowerCase() === 'jersonsatoru@yahoo.com.br') {
    return res.json({
      token: jwt.sign({ email }, '123456', { expiresIn: '8h' }),
    });
  }

  return res.status(401).json({
    message: 'Invalid credentials'
  });
});

app.get('/v1/healthz', (req, res) => {
  return res.status(200).json({
    message: 'ok'
  });
});

const port = 4000
app.listen(port, () => {
    console.log(`Server started on ${port}`)
});
