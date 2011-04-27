require 'meta_tools'


# Octal
# Hexadecimal
# Binary
# ASCII
# Decimal
#
# Funny name, great results.
# Conversion made easy.
class Ohbad
  extend MetaTools
  BASES = {
    :hex => 16,
    :dec => 10,
    :oct => 8,
    :bin => 2,
    :ascii => 10 # ascii uses decimals
  }

  # Converts a value from one base to another.
  # Hint:
  #   * Binary = base2
  #   * Octal = base8
  #   * Decimal = base10
  #   * Hexadecimal = base16
  def self.convert_base(value, from, to)
    value.to_s.to_i(from).to_s(to)
  end

  BASES.each do |type, base_from|
    # Ohbad#from_type
    meta_def("from_#{type}") do |value|
      value = value.ord if type == :ascii
      instance = new
      instance.instance_eval { update_instance_variables(value, base_from) }
      instance
    end

    # to_type
    class_def("to_#{type}".to_sym) do
      instance_variable_get("@#{type}")
    end

    # type =
    class_def("#{type}=") do |value|
      value = value.ord if type == :ascii
      update_instance_variables(value, base_from)
      self
    end
  end

  private
  def update_instance_variables(value, base_from)
    BASES.each do |type, base_to|
      result = self.class.convert_base(value, base_from, base_to)
      metaclass = self.class.metaclass
      has_format = metaclass.send(:method_defined?, :format)
      result = has_format ? self.class.send(:format, result, type) : result
      instance_variable_set("@#{type}", result)
    end
    @ascii = @dec.to_i.chr
    self
  end

end


# ("LO" * 40)[0...-1].tap { |lol| puts lol }

class Ohbad
  class Nibble < Ohbad; end

  class Byte < Ohbad
    private
    def Byte.format(value, type)
      case type
      when :bin
        value.split.last(8).join.rjust(8, "0")
      else
        value
      end
    end
  end
end