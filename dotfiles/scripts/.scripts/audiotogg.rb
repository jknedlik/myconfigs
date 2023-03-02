#!/usr/bin/env ruby
require 'json'

cmd={"target" => "sink", "io"=>'input'}
cmd={"target"=>"source", "io"=>'output'} if ARGV.length>0
HASH={}
def nextk(key)
  return HASH.flatten[(HASH.flatten.index(key)+2)%HASH.flatten.length]
end
s=File.read("#{`hostname`.split(" ")[0]}-sinks.json")

JSON.parse(s)["#{cmd['target']}s"].each do |sink| 
  HASH[`pactl list short #{cmd['target']}s |grep #{sink[0]}`.split(" ")[0]]=sink[1]
end
puts("list:\" #{HASH} \"")
allTargets=`pactl list short #{cmd['target']}-#{cmd['io']}s`.split("\n")
HASH.delete_if {|k,v| k==nil}
defaultName=`pactl info|grep -i "Default #{cmd['target']}"`.split()[2]
current=`pactl list short #{cmd['target']}s |grep "#{defaultName}"`.split(" ")[0]
target=(HASH.keys.include? current)? nextk(current) : HASH.flatten[0]
puts("current #{cmd['target']}: #{current} next: #{target}")
puts("move currentk and default target to #{target}")
Process.spawn("notify-send -t 3000 \"switch 🎶 \n#{HASH[target]}\"")
Process.spawn("pactl set-default-#{cmd['target']} #{target}")
for x in allTargets do
  Process.spawn("pactl move-#{cmd['target']}-#{cmd['io']} #{x.split(" ")[0]} #{target}")
end
