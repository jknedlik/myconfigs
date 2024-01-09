#!/usr/bin/env ruby
require 'json'

def parse_device_config(filename)
  s=File.read(filename)
  return JSON.parse(s) 
end

def nextdevice(devicehash,key)
  devices           = devicehash.keys()
  index             = devices.find_index{|elem| elem.include?(key)}
  next_index        = (index.nil? ? 0 : index+1) % devices.length
  next_device_name  = devices[next_index]
  return next_device_name
end

### check input
abort("either choose input or output") if ARGV.length==0 
if not ["input","output"].include?ARGV[0] then abort("'#{ARGV[0]}' not viable, either choose input or output") end
target, io              = ARGV[0]=="output"? ["sink","output"] : ["source","input"]

### calculate next device
configured_devices      = parse_device_config("#{`hostname`.split(" ")[0]}-sinks.json")["#{io}"]
default_target_name     = `pactl info|grep -i "Default #{target}"`.split()[2]

next_device_name        = default_target_name
next_device_id          = nil
while next_device_id.nil? do #empty if next_device_name not found
  next_device_name        = nextdevice(configured_devices,next_device_name)
  next_device_id          = `pactl list short #{target}s |grep "#{next_device_name}"`.split(" ")[0]
end

puts("\n#{configured_devices[default_target_name]} -> '#{configured_devices[next_device_name]}'")
puts("move all and default target(s) to'#{next_device_id}''")

### spawn notification and set default target
Process.spawn("notify-send -t 3000 \"🎶#{target=="output" ? "<-" : "->"} #{configured_devices[next_device_name]}\"")
Process.spawn("pactl set-default-#{target} #{next_device_id}")
