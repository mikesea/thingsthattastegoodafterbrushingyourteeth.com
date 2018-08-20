require('noodle-it')

const express = require('express')

const thingsList = require('./things.json')

let randomThing = () => {
  return thingsList[
    Math.floor(
      (Math.random() * thingsList.length)
    )
  ]
}

const app = express()
const port = process.env.PORT || 3001

app.get('/', (req, res) => {
  res.send(`${randomThing().name}`)
})

app.listen(port, () => console.log(`Listening on port ${port}`))
