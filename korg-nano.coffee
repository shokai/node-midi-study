Korg = require 'korg-nano'
korg = new Korg

korg.on '*', (e, value) ->
  console.log e
  console.log value
