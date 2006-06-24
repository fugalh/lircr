require 'test/unit'
require 'lirc'

class TC_LIRC < Test::Unit::TestCase
  include LIRC
  def setup
  end
  def teardown
  end
  def test_event
    e = Event.new("00000000000a8b59 00 power Sony-838")
    assert_equal 0xa8b59, e.code
    assert_equal 0, e.repeat
    assert ! e.repeat?
    assert_equal "power", e.name
    assert_equal "Sony-838", e.remote

    e = Event.new("00000000000a8b59 01 power Sony-838")
    assert_equal 0xa8b59, e.code
    assert_equal 1, e.repeat
    assert e.repeat?
    assert_equal "power", e.name
    assert_equal "Sony-838", e.remote
  end
end
