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
        threes = differences.count{_1 == 3}
        ones = differences.count{_1 == 1}
        threes * ones
    end
end