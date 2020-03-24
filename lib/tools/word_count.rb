module Tools 
    class WordCount
        def initialize(str)
            @str = str
        end
        def count
            @str.downcase.scan(/\w+/).each_with_object(Hash.new(0)) { |key,hash| hash[key] += 1}
        end
    end
end