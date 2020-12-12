require_relative 'solution'
require 'pry'

class DayEight
    include Solution
    FILE_INPUT = "./inputs/day_eight.txt"
    
    attr_accessor :acc, :index
    
    def initialize(input, part)
        super
        self.index = 0
        self.acc = 0
    end

    def exec(line)
        instruction = @input[line].match(/(?<operation>\w{3}) (?<argument>\+?-?\d+)/)
        increment_instruction = 1
        case instruction[:operation]
        when 'acc'
            self.acc += instruction[:argument].to_i
        when 'jmp'
            increment_instruction = instruction[:argument].to_i
        end
        self.index += increment_instruction
    end

    def process
        instructions_called = []
        until instructions_called.include?(index)
            instructions_called << index
            exec(index)
        end
        acc
    end
end