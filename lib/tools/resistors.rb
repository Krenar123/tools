module Tools
    class Resistor
        DEFTOLERANCE = :default
        COLORS = {
            black: {
                value: 0,
                tolerance:20
            },
            brown: {
                value: 1,
                tolerance: 1   
            },
            red: {
                value: 2,
                tolerance: 2
            },
            orange: {
                value: 3,
                tolerance: 0.2
            },
            yellow: {
                value: 4,
                tolerance: 0.05
            },
            green: {
                value: 5,
                tolerance: 0.5
            },
            blue: {
                value: 6,
                tolerance: 0.25
            },
            violet: {
                value: 7,
                tolerance: 0.10
            },
            gray: {
                value: 8,
                tolerance: 0.05
            },
            white: {
                value: 9,
                tolerance: 10
            },
            gold: {
                value: -1,
                tolerance: 5
            },
            silver: {
                value: -2,
                tolerance: 10
            },
            default: {
                tolerance: 20
            }
        }
       
        def putss(colors)
            a,b,c,d = colors
            d == nil ? DEFTOLERANCE : d
        end
        
        def self.color_coded(colors=nil)
            colors==nil ? colors : colors.map{|i| COLORS[i][:value] if COLORS.include?(i)}.take(2).join().to_i
        end

        def self.specification(str)
            @f_color, @s_color, @multiplier, @tolerance = str
            
            "#{get_multiplier} ohms +/-#{get_tolerance}%"
        end

        def self.get_multiplier
            arr = []
            color_coded(arr<<@f_color<<@s_color) * (10 ** COLORS[@multiplier][:value])
        end

        def self.get_tolerance
            @tolerance = :default if @tolerance == nil
            COLORS[@tolerance][:tolerance]
        end
    end
end