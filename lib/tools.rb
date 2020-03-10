require "tools/version"

module Tools

  class Luhn
    attr_reader :str, :sum
    def initialize(str)
      @str = str
      @arr = []
      @sum = 0
    end
    def valid?
      # If included alphabetic char and all symbols its not valid
      return false if  @str.length <=1 || !@str.scan(/[:alpha:]/).empty? || !@str.scan(/[!$&#-]/).empty?  ||  @str.include?(':') || (@str.length == 2 && @str[0] == ' ' && @str[1] == '0')
      return false if char_to_i(@str) == false
      true
    end

    private
    def char_to_i(str)
      # We go for every char and convert into integer and add it to array
      str.delete(' ').each_char do |char|
        @arr << char.to_i
      end
      do_math(@arr)
    end

    def do_math(mt)
      # We do reverse so we can double every second number from the end
      mt = mt.reverse

      mt.each_with_index do |value, index|
        if index.odd?
          mt[index] += mt[index]
          # If its greater than 9 then substract it with 9. Else leave it
          mt[index] = mt[index] > 9 ? mt[index] - 9 : mt[index]
        end
      end
      mt.each { |el| @sum += el }
      # Return true if sum is divisible with 10 else return false
      return @sum%10 == 0 ? true : false
    end

    
  end
end

