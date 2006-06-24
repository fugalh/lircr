require 'socket'

module LIRC
  class Client
    def initialize(dev="/dev/lircd")
      @sock = UNIXSocket.open(dev)
    end
    def next
      Event.new(@sock.readline)
    end
  end
  class Event
    attr_reader :code, :repeat, :name, :remote
    def initialize(str)
      code, repeat, @name, @remote = str.split(' ', 4)
      @code = code.hex
      @repeat = repeat.to_i
    end
    def repeat?
      @repeat > 0
    end
  end
end
