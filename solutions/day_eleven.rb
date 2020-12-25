require_relative 'solution'
require 'pry'

class DayEleven
    include Solution
    FILE_INPUT = "./inputs/day_eleven.txt"
    EMPTY = 'L'.freeze
    OCCUPIED = '#'.freeze
    FLOOR = '.'.freeze

    attr_accessor :input

    def initialize(input, part)
        self.input = input
        @part = part
    end

    def process
        while process_seat_map do
            nil
        end
        input.sum { _1.count(OCCUPIED) }
    end

    def process_seat_map
        temp_map = input.map(&:dup)
        changed = false
        (0...input.length).each do |y|
            (0...input[0].length).each do |x|
                result = seat_transformation(x, y)
                if (result == 1)
                    changed = true
                    temp_map[y][x] = OCCUPIED
                elsif (result == -1)
                    changed = true
                    temp_map[y][x] = EMPTY
                end
            end
        end
        self.input = temp_map
        changed
    end

    def seat_transformation(x, y)
        current = input[y][x]
        return 0 if current == FLOOR
        neighbors = count_neighbors(x, y)
        return -1 if neighbors >= 4 && current == OCCUPIED
        return 1 if neighbors.zero? && current == EMPTY
        0
    end

    def count_neighbors(x, y)
        y_values = [y]
        y_values << y - 1 unless y.zero?
        y_values << y + 1 unless y == input.length - 1
        x_values = [x]
        x_values << x - 1 unless x.zero?
        x_values << x + 1 unless x == input[y].length - 1
        values = []
        y_values.each do |y_val|
            x_values.each do |x_val|
                values << input[y_val][x_val] unless y_val == y && x_val == x
            end
        end
        values.count { _1 == OCCUPIED }
    end
end