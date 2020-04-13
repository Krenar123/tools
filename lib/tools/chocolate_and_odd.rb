module Tools
    class Chocolate 
        class << self
            def fairness?(first_p = nil, second_p = nil)
                check_for_nil(first_p, second_p)
            end

            private
            # this methods it checks if there are not para, or only one or parameters are not matrices
            def check_for_nil(frs, sec)
                return nil if frs.nil? || sec.nil?
                return nil if !frs[0].is_a?(Array) || !sec[0].is_a?(Array) 
                break_down(frs, sec)
            end

            # this method breaks down parameters and checks theirs sum
            def break_down(frs, sec)
                get_sum(frs) == get_sum(sec)
            end

            # this method calculate the sum of one gicen parameter
            def get_sum(sum_cal)
                sum_cal.sum{|i| i.inject(:*) }
            end
        end
    end

    class Odd
        def initialize(numbers = [])
            puts numbers
            @numbers = numbers.each_with_object(Hash.new(0)) { |key, val| val[key] += 1}
        end

        def first_odd_integer
            @numbers.select { |key, value| key if value.odd? }.keys.first
        end

        def all_odd_integers
            @numbers.map { |key, value| key if value.odd? }.compact
        end
    end
end