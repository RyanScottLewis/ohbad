$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'helper'

class TestByte < MiniTest::Unit::TestCase
  def setup; end

  def assert_the_byte(byte, hsh={})
    hsh.each do |method, result|
      assert_equal byte.send(method), result
    end
  end

  def test_from_oct_to_all
    byte = Ohbad::Byte.from_oct("141")
    assert_the_byte(byte, 
      :to_oct   => "141",
      :to_hex   => "61",
      :to_ascii => "a",
      :to_bin   => "01100001",
      :to_dec   => "97"
    )
  end

  def test_from_hex_to_all
    byte = Ohbad::Byte.from_hex("62")
    assert_the_byte(byte, 
      :to_oct   => "142",
      :to_hex   => "62",
      :to_ascii => "b",
      :to_bin   => "01100010",
      :to_dec   => "98"
    )
  end

  def test_from_bin_to_all
    byte = Ohbad::Byte.from_bin("1100011")
    assert_the_byte(byte, 
      :to_oct   => "143",
      :to_hex   => "63",
      :to_ascii => "c",
      :to_bin   => "01100011",
      :to_dec   => "99"
    )
  end
  
  def test_from_ascii_to_all
    byte = Ohbad::Byte.from_ascii("d")
    assert_the_byte(byte, 
      :to_oct   => "144",
      :to_hex   => "64",
      :to_ascii => "d",
      :to_bin   => "01100100",
      :to_dec   => "100"
    )
  end
  
  def test_from_dec_to_all
    byte = Ohbad::Byte.from_dec("101")
    assert_the_byte(byte, 
      :to_oct   => "145",
      :to_hex   => "65",
      :to_ascii => "e",
      :to_bin   => "01100101",
      :to_dec   => "101"
    )
  end
end