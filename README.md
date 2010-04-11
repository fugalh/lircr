Description
===========

lircr (pronounced 'lurker') is a LIRC client library for Ruby. It is simple,
it is easy, it is fun. If you got LIRC, get lircr. I am not responsible if you
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
	require 'librmpd'
	lirc = LIRC::Client.new
	mpd = MPD.new 'localhost', 6600
	lirc.each do |event|
		case event.name
		when "play"
			mpc.play
		when "pause"
			mpd.pause = !mpd.pause
		when "stop"
			mpd.stop
		end
	end
