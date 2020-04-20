module Tools 
    class Pokemon
        EFFECT = {
            'fire' => [['fire','electric'],['grass'],['water']],
            'grass' => [['grass','electric'],['water'],['fire']],
            'electric' => [['electric','fire','grass'],['water'],[]],
            'water' => [['water'],['fire'],['grass','electric']]
        }
        def self.calculate_damage(my_type, opp_type, my_attack, opp_defense)
            50 * (my_attack / opp_defense) * effect(my_type, opp_type)
        end

        def self.effect(my_type, opp_type)
            return 1 if EFFECT[my_type][0].include?(opp_type)
            return 2 if EFFECT[my_type][1].include?(opp_type)
            return 0.5 if EFFECT[my_type][2].include?(opp_type)
        end
    end

    class AdjustTime
        def initialize(display_format, hour, minute, second)
            @hour, @minutes, @seconds = display_format.split(':').map(&:to_i)
            @hour += hour
            @minutes += minute
            @seconds += second
        end

        def adjusted_time
            fix_the_format
        end

        def fix_the_format
            @seconds -= 60 while @seconds >= 60 && @minutes += 1
            @minutes -= 60 while @minutes >= 60 && @hour += 1
            @hour -= 24 while @hour >= 24 
            string_format
        end

        def string_format
            @seconds = @seconds.digits.size == 1 ? "0#{@seconds}" : @seconds.to_s
            @minutes = @minutes.digits.size == 1 ? "0#{@minutes}" : @minutes.to_s
            @hour = @hour.digits.size == 1 ? "0#{@hour}" : @hour.to_s
            print_format
        end

        def print_format
            "#{@hour}:#{@minutes}:#{@seconds}"
        end
    end
end