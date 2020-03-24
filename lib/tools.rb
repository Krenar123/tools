require "tools/version"
require "tools/word_count"

module Tools

  class Luhn
    attr_reader :str, :sum
    def initialize(str)
      @str = str
      @arr = []
      @sum = 0
    end
    def valid?
      @str.delete!(' ')
      # If included alphabetic char and all symbols its not valid
      return false if  @str.length <=1 || !@str.scan(/[:alpha:]/).empty? || !@str.scan(/[:punct:]/).empty? 
      return false if char_to_i(@str) == false
      true
    end

    private
    def char_to_i(str)
      # We go for every char and convert into integer and add it to array
      @arr = str.each_char.map(&:to_i)
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

  # Another class from the same library
  class Raindrop
    attr_reader :num

    def initialize(num)
      @num = num
    end

    def se_if_factors
      str = ''

      arr = (1..@num).select { |n| @num%n == 0}
      
      str += 'Pling' if arr.include?(3)
      str += 'Plang' if arr.include?(5)
      str += 'Plong' if arr.include?(7)
      # If str is empty then str = num.to_s else return plingPlang ...
      str=='' ? @num.to_s : str
    end

    def output
      se_if_factors
    end

  end
end

