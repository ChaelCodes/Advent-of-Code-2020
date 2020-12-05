require_relative 'solution'
require 'pry'

class DayFive
    include Solution
    FILE_INPUT = "./inputs/day_five.txt"

    def process
        @locations = @input.map { |boarding_pass|
            seat_location(boarding_pass)
        }.sort
        return @locations.last if @part == 1
        @locations.each_with_index do |seat, index|
            return seat - 1 if (seat != @locations[index - 1] + 1 && index != 0)
        end
    end

    def seat_location(boarding_pass)
        @row = (0..127).to_a
        @column = (0..8).to_a
        boarding_pass.each_char do |direction|
            case direction
            when 'F'
                @row.slice!((@row.length/2..-1))
            when 'B'
                @row.slice! (0..(@row.length/2) - 1)
            when 'L'
                @column.slice!((@column.length/2..-1))
            when 'R'
                @column.slice! (0..(@column.length/2) - 1)
            end
        end
        @row[0] * 8 + @column[0]
    end
end