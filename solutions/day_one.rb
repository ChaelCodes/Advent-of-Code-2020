class DayOne
    def initialize(input, set)
        @numbers = input
        @set = set
    end

    def process
        find_sum(@set, 2020)
    end

    def find_sum(num_remaining, total_remaining)
        @numbers.each do |number|
            if num_remaining == 1
                return number if number == total_remaining
            else
                potential_match = find_sum(num_remaining - 1, total_remaining - number)
                return potential_match * number if potential_match
            end
        end
        return false
    end

    def self.run(part)
        file = File.read("./inputs/day_one.txt")
        array = file.split
        set = (part == 1) ? 2 : 3
        DayOne.new(array.map(&:to_i), set).process
    end
end