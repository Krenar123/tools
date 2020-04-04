module Tools
    class Antipode
        def initialize(arr)
            @arr = arr
        end

        def average
            return @arr if size == 1
            check_for_length
        end

        private
        def check_for_length
            @arr.delete_at(median) if size.odd?
            do_math
        end

        def do_math
            @arr.take(median).zip(@arr.reverse).map{|a,b| ((a+b).to_f/2)}
        end

        def median
            size/2
        end

        def size
            @arr.size
        end
    end
end