require_relative 'solution'
require 'pry'

class DayTen
    include Solution
    FILE_INPUT = "./inputs/day_ten.txt"

    def self.parse_line(line)
        line.to_i
    end

    def process
        differences = [3] # add the device difference
        sorted_input = @input.sort { |a, b| b <=> a }
        sorted_input << 0 # Add the plug
        sorted_input.each_with_index do |joltage, index|
            next if joltage.zero?
            differences << joltage - sorted_input[index + 1]
        end
        if @part == 1
            threes = differences.count{_1 == 3}
            ones = differences.count{_1 == 1}
            return threes * ones
        end
        replaceables = []
        index = 0
        while(index < differences.length) do
            if differences[index] == 1
                count = 0
                while (differences[index] == 1)
                    count += 1
                    index += 1
                end
                replaceables << count
            end
            index += 1
        end
        replaceables.map { convert_to_arrangements(_1) }.reduce(&:*)
    end

    def convert_to_arrangements(repeats)
        base = 2**(repeats - 1)
        return base unless repeats > 3
        return 22 if repeats == 6
        return 13 if repeats == 5
        return 7 if repeats == 4
    end
end
