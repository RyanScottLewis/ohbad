$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'helper'

context "A Nibble" do
  setup { Hexadecimal::Nibble.new }

  asserts_topic.assigns(:hex) { "0" }
  asserts("to_hex is zero") { topic.to_hex == "0" }
  asserts_topic.assigns(:dec) { 0 }
  asserts("to_dec is zero") { topic.to_dec == 0 }

  context "with a decimal value of 10" do
    context "set with #replace with an Integer" do
      hookup { topic.replace(10) }

      asserts("to_hex is A") { topic.to_hex == "A" }
      asserts("to_dec is 10") { topic.to_dec == 10 }
    end

    context "set with #replace with a String" do
      hookup { topic.replace("A") }

      asserts("to_hex is A") { topic.to_hex == "A" }
      asserts("to_dec is 10") { topic.to_dec == 10 }
    end

    context "set with #dec=" do
      hookup { topic.dec = 10 }

      asserts("to_hex is A") { topic.to_hex == "A" }
      asserts("to_dec is 10") { topic.to_dec == 10 }
    end

    context "set with #hex=" do
      hookup { topic.hex = "A" }

      asserts("to_hex is A") { topic.to_hex == "A" }
      asserts("to_dec is 10") { topic.to_dec == 10 }
    end
  end


end