#!/usr/bin/env ruby
require 'json'


def parse_device_config(filename)
  s=File.read(filename)
  return JSON.parse(s) 
end

def nextdevice(devicehash,key)
  devices           = devicehash.keys()
  print(devices)
  index             = devices.find_index{|elem| elem.include?(key)}
  print "\n",key, index,"\n"
  next_index = (index.nil? ? 0 : index+1) % devices.length
  next_device_name  = devices[next_index]
  print "next index",next_index,"device length",devices.length,"devicename:",next_device_name,"\n"

  return next_device_name
end

def find_assigned_targets(configured_devices,target)
  targets={}
  configured_devices.each do |device,name| 
    targets[`pactl list short #{target}s |grep #{device}`.split(" ")[0]]  = name
  end
  targets.delete_if {|k,v| k==nil}
  return targets
end

###check input
abort("either choose input or output") if ARGV.length==0 
if not ["input","output"].include?ARGV[0] then abort("'#{ARGV[0]}' not viable, either choose input or output") end
target, io              = ARGV[0]=="output"? ["sink","output"] : ["source","input"]

### main
configured_devices      = parse_device_config("#{`hostname`.split(" ")[0]}-sinks.json")["#{io}"]
assigned_targets        = find_assigned_targets(configured_devices,target)
default_target_name     = `pactl info|grep -i "Default #{target}"`.split()[2]
default_target_id       = `pactl list short #{target}s |grep "#{default_target_name}"`.split(" ")[0]
next_device_name        = nextdevice(configured_devices,default_target_name)
next_device_id          = `pactl list short #{target}s |grep "#{next_device_name}"`.split(" ")[0]
puts("\ncurrent #{target}: #{default_target_name}\n next: #{next_device_name}")
puts("\ncurrent #{target}: #{configured_devices[default_target_name]} \nnext: #{configured_devices[next_device_name]}")
puts("move all and default target(s) to #{next_device_id}")

Process.spawn("notify-send -t 3000 \"🎶#{target=="output" ? "<-" : "->"} #{configured_devices[next_device_name]}\"")
Process.spawn("pactl set-default-#{target} #{next_device_id}")
