require_relative 'solution'
require 'pry'

class DaySix
    include Solution
    FILE_INPUT = "./inputs/day_six.txt"
    FILE_SPLIT = "\n\n"

    def process
        if @part == 1
            @input.map { |group_input| group_input.tr("\n", '').split('')  }
                .map(&:uniq)
                .sum(&:length)
        else
            @input.map do |group_input|
                group_input.split("\n").
                    map do |answer| answer.split('') end.
                    reduce(&:&)
            end.sum(&:length)
        end
    end
end