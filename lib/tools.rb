require "tools/version"

module Tools

  class Luhn
    attr_reader :str, :sum
    def initialize(str)
      @str = str
      @arr = []
      @sum = 0
    end

    def char_to_i(str)
      # We go for every char and convert into integer and add it to array
      str.each_char do |char|
        if char != ' '
          @arr << char.to_i
        end
      end
      do_math(@arr)
    end

    def do_math(mt)
      # We do reverse so we can double every second number from the end
      mt = mt.reverse
      for i in 0..mt.length-1 do
        if i.odd?
          # If i is 1,3,5.. we are going to double it and then ask if its greater than 9
          mt[i] += mt[i]
          # If its greater than 9 then substract it with 9. Else leave it
          mt[i] = mt[i] > 9 ? mt[i] - 9 : mt[i]
        end
      end
      mt.each { |el| @sum += el }
      # Return true if sum is divisible with 10 else return false
      return @sum = @sum%10 == 0 ? true : false
    end

    def valid?

      # If included alphabetic char and all symbols its not valid
      if  @str.length <=1 || !@str.scan(/[:alpha:]/).empty? || !@str.scan(/[!$&#-]/).empty?  ||  @str.include?(':') || (@str.length == 2 && @str[0] == ' ' && @str[1] == '0')
        false
      # For canadian sin that are 9 digits in this case with two spaces 11 length
      elsif @str.length == 11
        if char_to_i(@str) == true
          true
        else
          false
        end
      # For credit cards number
      else
        if char_to_i(@str) == true
          true
        else
          false
        end
      end
    end
  end
end

