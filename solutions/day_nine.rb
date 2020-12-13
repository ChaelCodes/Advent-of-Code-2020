require_relative 'solution'
require 'pry'

class DayNine
    include Solution
    FILE_INPUT = "./inputs/day_nine.txt"

    attr_accessor :preamble, :nonsum, :stack

    def initialize(input, part)
        super
        self.stack = @input
        self.preamble = 25
    end

    def self.parse_line(line)
        line.to_i
    end

    def preamble_valid?
        options = stack.first(preamble)
                        .combination(2)
                        .map { |first, second| first + second }
        options.include? stack[preamble]
    end

    def process
        find_nonsum
        return nonsum if @part == 1
        find_contiguous_sum
    end

    def find_nonsum
        self.stack = @input.dup
        while (preamble_valid?)
            stack.shift
        end
        self.nonsum = stack[preamble]
    end

    def find_contiguous_sum
        self.stack = []
        total = 0
        index = 0
        while (total != nonsum)
            total += @input[index]
            self.stack << @input[index]
            index += 1
            while (total > nonsum)
                remove = stack.shift
                total -= remove
            end
        end
        stack.min + stack.max
    end
end