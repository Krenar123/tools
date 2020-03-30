module Tools
    class Resistor
        HASH = {
            'black' => 0,
            'brown' => 1,
            'red' => 2,
            'orange' => 3,
            'yellow' => 4,
            'green' => 5,
            'blue' => 6,
            'violet' => 7,
            'gray' => 8,
            'white' => 9,
            'gold' => nil,
            'silver' => nil
        }
        def self.color_coded(str=nil)
            str==nil ? str : str.map{|i| HASH[i] if HASH.include?(i)}.take(2).join().to_i
        end
    end
end