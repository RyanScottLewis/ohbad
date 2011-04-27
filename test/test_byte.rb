$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'helper'

class TestByte < MiniTest::Unit::TestCase
  def setup; end

  def test_from_hex
    byte = Ohbad::Byte.from_hex("61")
    assertion_hash = {
      :to_hex => "61",
      :to_dec => "97",
      :to_oct => "141",
      :to_bin => "01100001",
      :to_ascii => "a"
    }

    assertion_hash.each do |method, result|
      assert_equal byte.send(method), result
    end
  end
end