module Tools
    class Series
        def initialize(str)
            @str = str
        end
    
        def slices(num)
            raise ArgumentError.new if num > @str.length
            k = []
            for i in 0..@str.length-num do
                k << @str.slice(i,num)
            end
            k
        end
    end
end