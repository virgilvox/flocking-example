flock = require 'flocking'

enviro = flock.init()
s = flock.synth(synthDef:
  id: 'someId'
  ugen: 'flock.ugen.sin'
  freq:
    ugen: 'flock.ugen.lfNoise'
    freq: 1
    mul: 180
    add: 180
  mul:
    ugen: 'flock.ugen.envGen'
    envelope:
      type: 'flock.envelope.sin'
      duration: 1.5
    gate:
      ugen: 'flock.ugen.lfPulse'
      width: 0.6
      freq: 1)

setInterval( =>
  s.set("someId.freq", Math.random()*130+100)
, 200)

enviro.play()
