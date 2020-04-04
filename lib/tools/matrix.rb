class Matrix
    attr_reader :rows, :columns
    def initialize(str)
        @str = str
        extract_rows
    end

    def extract_rows
        @rows = @str.split("\n").map { |n| n.split().map(&:to_i) }
        extract_columns
    end

    def extract_columns
        @columns = @rows.transpose
    end
end