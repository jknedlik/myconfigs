#!/usr/bin/env ruby
require 'json'
HASH={}
def nextk(key)
  return HASH.flatten[(HASH.flatten.index(key)+2)%HASH.flatten.length]
end
s=File.read("#{`hostname`.split(" ")[0]}-sinks.json")
JSON.parse(s)['sinks'].each do |sink| 
  HASH[`pactl list short sinks |grep #{sink[0]}`.split(" ")[0]]=sink[1]
  HASH[`pactl list short sinks |grep #{sink[0]}`.split(" ")[0]]=sink[1]
end
puts("list:\" #{HASH} \"")
sinkInputs=`pactl list short sink-inputs`.split("\n")
currentSink=sinkInputs[0].split(" ")[1]
puts("current sink: #{currentSink} next: #{nextk currentSink} flat: #{HASH.flatten[0]}")
target=(HASH.keys.include? currentSink)? nextk(currentSink) : HASH.flatten[0]
puts("move currentSink and default target to #{target}")
Process.spawn("notify-send -t 3000 \"switch 🎶\n #{HASH[target]}\"")
Process.spawn("pactl set-default-sink #{target}")
for x in sinkInputs do
  Process.spawn("pactl move-sink-input #{x.split(" ")[0]} #{target}")
end
