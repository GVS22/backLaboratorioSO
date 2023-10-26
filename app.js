const express = require('express')
const app = express()
const port = 3003

const mysql = require('mysql2');

// create the connection to database
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: "root",
  database: 'cardapio'
});

app.get('/', (req, res) => {
  res.send('LABORATÓRIO SO - DOCKER')
})
//SELECT ALL CATEGORIAS
app.get('/categorias', (req, res) => {
  connection.query(
    'select * from categoria',
    (err, results, fields) => {
      res.send(results)
    }
  );
})
//SELECT CATEGORIA BY ID
app.get('/categorias/:id', (req, res) => {
  const id = req.params.id
  connection.query(
    `select * from categoria where id_categoria = ${id}`,
    (err, results, fields) => {
      res.send(results)
    }
  );
})

//SELECT ALL PRODUTOS
app.get('/produtos', (req, res) => {
  connection.query(
    'select * from produto',
    (err, results, fields) => {
      res.send(results)
    }
  );
})
//SELECT PRODUTOS BY ID
app.get('/produtos/:id', (req, res) => {
  const id = req.params.id
  connection.query(
    `select * from produto where id_produtos = ${id}`,
    (err, results, fields) => {
      res.send(results)
    }
  );
})

//SELECT PRODUTOS POR CATEGORIA BY ID
app.get('/produtos_categoria/:id', (req, res) => {
  const id = req.params.id
  connection.query(
    `select * from produto p inner join categoria_produto pc on pc.id_produtos = p.id_produtos inner join categoria c on pc.id_categoria = c.id_categoria  where p.id_produtos = ${id}`,
    (err, results, fields) => {
      res.send(results)
    }
  );
})

//SELECT CATEGORIAS POR PRODUTOS BY ID
app.get('/categoria_produto/:id', (req, res) => {
  const id = req.params.id
  connection.query(
    `select * from produto p inner join categoria_produto pc on pc.id_produtos = p.id_produtos inner join categoria c on pc.id_categoria = c.id_categoria  where c.id_categoria = ${id}`,
    (err, results, fields) => {
      res.send(results)
    }
  );
})

// setInterval(() => {
//   connection.query(
//     'select * from produto',
//     (err, results, fields) => {
//       console.log(results)
//     }
//   );
// }, 2000);



app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})