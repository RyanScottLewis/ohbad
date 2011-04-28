$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'helper'

class TestByte < MiniTest::Unit::TestCase
  def setup; end

  def assert_the_byte(byte, hsh={})
    hsh.each do |method, result|
      assert_equal byte.send(method), result
    end
  end

  def test_from_oct
    byte = Ohbad::Byte.from_oct("141")
    assert_the_byte(byte, 
      :to_oct   => "141",
      :to_hex   => "61",
      :to_ascii => "a",
      :to_bin   => "01100001",
      :to_dec   => "97"
    )
  end

  def test_from_hex
    byte = Ohbad::Byte.from_hex("62")
    assert_the_byte(byte, 
      :to_oct   => "142",
      :to_hex   => "62",
      :to_ascii => "b",
      :to_bin   => "01100010",
      :to_dec   => "98"
    )
  end

  def test_from_bin
    byte = Ohbad::Byte.from_bin("1100011")
    assert_the_byte(byte, 
      :to_oct   => "143",
      :to_hex   => "63",
      :to_ascii => "c",
      :to_bin   => "01100011",
      :to_dec   => "99"
    )
  end
  
  def test_from_ascii
    byte = Ohbad::Byte.from_ascii("d")
    assert_the_byte(byte, 
      :to_oct   => "144",
      :to_hex   => "64",
      :to_ascii => "d",
      :to_bin   => "01100100",
      :to_dec   => "100"
    )
  end
  
  def test_from_dec
    byte = Ohbad::Byte.from_dec("101")
    assert_the_byte(byte, 
      :to_oct   => "145",
      :to_hex   => "65",
      :to_ascii => "e",
      :to_bin   => "01100101",
      :to_dec   => "101"
    )
  end

  def test_from_dec_integer
    byte = Ohbad::Byte.from_dec(102)
    assert_the_byte(byte, 
      :to_oct   => "146",
      :to_hex   => "66",
      :to_ascii => "f",
      :to_bin   => "01100110",
      :to_dec   => "102"
    )
  end

  def test_from_dec_hex
    byte = Ohbad::Byte.from_dec(0x67)
    assert_the_byte(byte, 
      :to_oct   => "147",
      :to_hex   => "67",
      :to_ascii => "g",
      :to_bin   => "01100111",
      :to_dec   => "103"
    )
  end
end