require 'socket'

module LIRC
	class Client
		def initialize dev = nil
			dev ||= "/dev/lircd"
			@sock = UNIXSocket.new dev
		end

		def next
			Event.new @sock.gets
		end

		def each_event
			return Enumerator.new( self, :each_event)  unless block_given?
			loop { yield self.next }
		end
		alias each each_event
	end

	class Event
		attr_reader :code, :repeat, :name, :remote

		def initialize str
			code, repeat, @name, @remote = str.split(' ', 4)
			@code = code.hex
			@repeat = repeat.hex
		end

		def repeat?
			@repeat > 0
		end

		def to_s
			"%016x %02x %s %s" % [@code, @repeat, @name, @remote]
		end
	end
end
