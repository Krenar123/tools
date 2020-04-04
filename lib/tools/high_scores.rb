class HighScores
    def initialize(sc)
        @sc = sc
    end

    def scores
        @sc
    end
    def latest
        @sc.last
    end
    def personal_best
        @sc.max
    end
    def personal_top_three
        @sc.sort {|a,b| b <=> a}.take(3) 
    end 
    def latest_is_personal_best?
        @sc.last == @sc.max
    end
end