Description
===========

lircr (pronounced 'lurker') is a LIRC client library for Ruby. It's simple,
it's easy, it's fun. If you got LIRC, get lircr. I am not responsible if you
grow more hair on your index finger or thumb.

Usage
=====

	require 'lirc'
	lirc = LIRC::Client.new
	event = lirc.next
	p event
	if event.name == "play"
			system "xmms", "/av/music/3.mod"
	end

Control your MPD:

	require 'lirc'
	lirc = LIRC::Client.new
	lirc.each do |event|
		case event.name
		when "play"
			system "mpc", "play"
		when "pause"
			system "mpc", "pause"
		when "stop"
			system "mpc", "stop"
		end
	end
