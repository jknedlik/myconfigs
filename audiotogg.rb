#!/usr/bin/env ruby
headset=`pactl list short sinks |grep Wireless-00.analog-stereo`.split(" ")[0]
hdmi=`pactl list short sinks |grep extra3`.split(" ")[0]
sinkInputs=`pactl list short sink-inputs`.split("\n")
currentSink=sinkInputs[0].split(" ")[1]
for x in sinkInputs do
  puts( x, currentSink)
  Process.spawn("pactl move-sink-input #{x.split(" ")[0]} #{(currentSink==headset)? hdmi : headset}" )
end
