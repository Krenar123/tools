class Acronym
    def self.abbreviate str
        str.gsub(/[-]/,' ').split().map{ |k| k[0]}.join().upcase
    end
end