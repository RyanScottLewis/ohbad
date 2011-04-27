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



# require 'pp'

# p Ohbad.from_hex("61")
# p Ohbad.from_dec("97")
# p Ohbad.from_oct("141")
# p Ohbad.from_bin("01100001")
# p Ohbad.from_ascii("a")
# p "============================"
# oh_so_very_bad = Ohbad.from_ascii("a")
# p oh_so_very_bad.to_hex
# p oh_so_very_bad.to_dec
# p oh_so_very_bad.to_oct
# p oh_so_very_bad.to_bin
# p oh_so_very_bad.to_ascii