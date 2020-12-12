require_relative 'solution'
require 'pry'

class DaySeven
    include Solution
    FILE_INPUT = "./inputs/day_seven.txt"

    def initialize(input, part)
        super
        @bag_list = []
        @find_bag = "shiny gold"
    end

    def process
        bags = find_bags(@find_bag)
        if @part == 1
            bag_finder(bags)
            return @bag_list.count
        else
            bag_counter(bags) - 1
        end
    end

    def bag_finder(bags)
        new_bags = bags - @bag_list 
        @bag_list = @bag_list.union(bags)
        return if new_bags.empty?
        new_bags.each do |bag|
            bag_finder(find_bags(bag))
        end
    end

    def bag_counter(bags)
        return 1 if bags.empty?
        purses = bags.map do |count, bag|
            count.to_i * bag_counter(find_bags(bag))
        end
        1 + purses.sum
    end

    def find_bags(bag)
        @part == 1 ? find_bags_containing(bag) : find_bags_within(bag)
    end


    def find_bags_containing(bag)
        @input.filter { |input| input.match?(/\d+ #{bag} bag/) }
            .map do |input| input.match(/(?<bag>\w+ \w+) bags contain/)[:bag] end
    end

    def find_bags_within(bag)
        @input.filter { |input| input.match?(/#{bag} bags contain/) }
            .first.scan(/(?<count>\d) (?<bag>\w+ \w+) bag/)
    end
end