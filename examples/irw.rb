#!/usr/bin/ruby
# rewrite of lirc's own irw using lircr

require 'lirc'
l = LIRC::Client.new
puts l.next.to_s while true
