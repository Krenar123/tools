module Tools
    class BookStore

        def self.calculate_price(basket)
            freq = basket.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
            calculate(freq,basket)
    
        end
    
        def self.calculate(freq,basket)
            price = 0.00
            br = []
            if freq.length > 1   
                while freq.length > 1
                    arr = []
                    freq.each do |key,value|
                        arr << key
                        freq[key] -= 1
                        if freq[key] == 0
                            freq.delete(key)
                        end
                    end
                    br << arr
                end
                another(br, freq)
            else
                basket.length-1.times do 
                    price += basket.length * 8
                end
                return price
            end
        end
    
        def self.another(br,freq)
            price = 0.00
            perc = 0
            hash = { 5=>2.00,4=>1.60,3=>0.80,2=>0.40 }
            if (br.size >= 2) && (br.size % 2== 0)
                sum = 0
                br.each_with_index do |key,index|
                    sum += br[index].size
                end
                
                if sum >= 8 
                    for i in 0..br.length-1 do
                        for j in 0..br.length-1 do
                            k = br[i] - br[j]
                            puts k.to_s
                            puts br[j].to_s
                            if !k.empty? && br[j].length <=3
                                br[j] << k[0]
                                br[i].delete(k[0])
                                break
                            end
                        end
                    end
                end
            end
            for i in 0..br.length-1
                hash.each do |key,value|
                    if key == br[i].length 
                        perc = value
                    end
                end
                price += br[i].length * (8 - perc)
            end
            if freq.length == 1
                price += 8
            end
            return price
        end
    end
end