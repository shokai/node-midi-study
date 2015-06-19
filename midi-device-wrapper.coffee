EventEmitter = require('events').EventEmitter
midi   = require 'midi'
debug  = require('debug')('midi-device')

module.exports = class Device extends EventEmitter

  constructor: (device_name=".*") ->
    @input = new midi.input
    for i in [0...@input.getPortCount()]
      name = @input.getPortName i
      debug "found device [#{i}] \"#{name}\""
      if new RegExp(device_name, 'i').test name
        debug "openPort #{i}"
        @input.openPort i
        break

    ## midi messageを受信
    @input.on 'message', (delta, raw) =>
      debug {delta: delta, raw: raw}
      @emit 'message', {delta: delta, raw: raw}


return if process.argv[1] isnt __filename

device = new Device

device.on 'message', (data) ->
  console.log data.raw
