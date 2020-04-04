module Tools 
    class WordCount
        def initialize(sentence)
            @words = sentence.downcase.scan(/\b[\w']+\b/)
        end
    
        def word_count
            count = Hash.new(0)
            @words.map{|i| count[i]+=1}
            count
        end
    end    
end