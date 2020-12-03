require_relative 'solution'
require 'pry'

class DayThree
    include Solution
    FILE_INPUT = "./inputs/day_three.txt"
    SLOPES = [[1,1],[3,1],[5,1],[7,1],[1,2]]

    def process
        if (@part == 1)
            trees_per_slope(3, 1)
        else
            SLOPES.map { |x, y|
                trees_per_slope(x, y)
            }.reduce(&:*)
        end
    end

    def trees_per_slope(x, y)
        trees = 0
        @location = [0,0]
        while (@location[1] < @input.length - 1) do
            move(x, y)
            tree = @input[@location[1]][@location[0]] == '#'
            trees += 1 if tree
        end
        trees
    end

    def move(x, y)
        @map_length ||= @input.length
        @map_width ||= @input.first.length
        @location[0] = (@location[0] + x) % @map_width 
        @location[1] += y
    end
end