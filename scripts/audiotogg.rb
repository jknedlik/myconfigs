#!/usr/bin/env ruby
require 'json'
s=File.read("#{`hostname`.split(" ")[0]}-sinks.json")
list=[]
JSON.parse(s)['sinks'].each do |sink| 
  list.append(`pactl list short sinks |grep #{sink}`.split(" ")[0])
end

sinkInputs=`pactl list short sink-inputs`.split("\n")
currentSink=sinkInputs[0].split(" ")[1]
for x in sinkInputs do
  puts( x, currentSink)
  Process.spawn("pactl move-sink-input #{x.split(" ")[0]} #{list[(list.index(currentSink)+1)%list.length]}")
end
