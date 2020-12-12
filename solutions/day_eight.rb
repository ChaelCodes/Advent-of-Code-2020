require_relative 'solution'
require 'pry'

class DayEight
    include Solution
    FILE_INPUT = "./inputs/day_eight.txt"
    
    attr_accessor :acc, :input, :index, :instructions_called
    
    def initialize(input, part)
        super
        self.acc = 0
        self.index = 0
        self.instructions_called = []
    end

    def exec(line)
        instruction = parse_instruction(@input[line])
        increment_instruction = 1
        case instruction[:operation]
        when 'acc'
            self.acc += instruction[:argument].to_i
        when 'jmp'
            increment_instruction = instruction[:argument].to_i
        end
        self.index += increment_instruction
    end

    def parse_instruction(instruction)
        instruction.match(/(?<operation>\w{3}) (?<argument>\+?-?\d+)/)
    end

    def process
        find_program_end(@instructions_called)
        if @part == 2
            swap_operations = find_swap_operations
            swap_operations.each do |line|
                substitute_operation(line)
                find_program_end([])
                return acc if part_two_solution_found?
                substitute_operation(line)
            end
        end
        acc
    end

    def substitute_operation(line)
        instruction = parse_instruction(@input[line])
        if instruction[:operation] == 'jmp'
            @input[line] = "nop #{instruction[:argument]}"
        else
            @input[line] = "jmp #{instruction[:argument]}"
        end
    end

    def find_program_end(instructions_indexes)
        self.index = 0
        self.acc = 0
        until instructions_indexes.include?(index) || part_two_solution_found?
            instructions_indexes << index
            exec(index)
        end
    end

    def find_swap_operations
        swap_operations = []
        instructions_called.each do |instruction|
            swap = ['jmp', 'nop'].include?(parse_instruction(@input[instruction])[:operation])
            swap_operations << instruction if swap
        end
        swap_operations
    end

    def part_two_solution_found?
        index == @input.length
    end
end