nanoKONTROL = require 'korg-nano-kontrol'

nanoKONTROL.connect()
.then (device) ->
  console.log "connected  #{device.name}"

  device.on 'slider:*', (value) ->
    console.log @event + ' => ' + value

  device.on 'knob:*', (value) ->
    console.log @event + ' => ' + value

  device.on 'button:**', (value) ->
    console.log @event + ' => ' + value
