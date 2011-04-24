
module Hexadecimal
  module Mixin
    def initialize(*args)
      @config = {}
      if self.class == Nibble
        @config[:hex_from_dec_format] = "%x"
        @config[:max_dec] = 15
        @config[:regex_to_match] = /^[A-Fa-f0-9]$/
      elsif self.class == Byte
        @config[:hex_from_dec_format] = "%02x"
        @config[:max_dec] = 255
        @config[:regex_to_match] = /^[A-Fa-f0-9]{1,2}$/
      end

      if args.empty?
        self.dec = 0
      elsif args.length == 1
        replace(args.first)
      else
        raise(ArgumentError, "Cannot have more than one value")
      end
    end
    def length; @hex.length; end
    def hex=(value)
      @hex = value
      update_dec_from_hex
      update_hex_from_dec # To format according to @config[:hex_from_dec_format]
    end
    def dec=(value)
      @dec = value
      update_hex_from_dec
    end
    def replace(value)
      if value.is_a?(Integer)
        raise(ArgumentError, "value must be included in 0..#{@config[:max_dec]}") unless (0..@config[:max_dec]).include?(value)
        self.dec = value
      elsif value.is_a?(String)
        raise(ArgumentError, "value must match #{@config[:regex_to_match]}") unless value =~ @config[:regex_to_match]
        self.hex = value.upcase
      elsif value.is_a?(Nibble) # TODO
      elsif value.is_a?(Byte) # TODO
      else
        raise(TypeError, "value must be of type String or Integer") unless value.nil?
      end
    end
    def to_dec; @dec; end
    def to_hex; @hex; end
    def to_chr; @dec.chr; end
    def inspect
      vars = instance_variables.dup
      vars.delete(:@config)
      vars.collect! { |v| v.to_hex << "=#{instance_variable_get(v).inspect}"}
      "#<%s:0x%x %s>" % [self.class, object_id, vars.join(", ")]
    end

    private
    def update_dec_from_hex; @dec = @hex.to_i(16); end
    def update_hex_from_dec; @hex = (@config[:hex_from_dec_format] % @dec).upcase; end
  end

  class Nibble
    include Mixin
  end

  class Byte
    include Mixin
    def nibbles; @hex.chars.collect { |c| Nibble.new(c) }; end
    def [](index); nibbles[index]; end
    def []=(index, value)
      clone = nibbles.dup
      clone[index].replace(value)
      self.hex = clone.join
    end
  end
  
  class Data
    def initialize(*args)
      @bytes = []
      args.each { |value| self << value }
    end
    def <<(value); @bytes << Hexadecimal::Byte.new(value); end
    def [](index); @bytes[index]; end
    def []=(index, value); @bytes[index].replace(value); end
    def bytes; @bytes; end
    def each_byte(&blk); @bytes.each(&blk); end

    def to_ascii; @bytes.collect { |byte| byte.to_chr }.join; end
    def to_hex; @bytes.collect { |byte| byte.to_hex }.join; end
    def to_dec; @bytes.collect { |byte| byte.to_dec }; end
    def inspect
      vars = instance_variables.dup
      vars.collect! { |v| v.to_s << "=#{instance_variable_get(v).inspect}"}
      "#<%s:0x%x %s>" % [self.class, object_id, vars.join(", ")]
    end
    def Data.from_s(str)
      new(*str.bytes.to_a)
    end
  end
end

byte = Hexadecimal::Byte.new(11)
p byte.to_dec # => 11
p byte.to_hex # => 10
p byte.to_chr # => 10