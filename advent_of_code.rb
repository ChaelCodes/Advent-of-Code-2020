Dir["./solutions/*.rb"].each {|file| require file }

class AdventOfCode
    def self.run
        print "What day would you like to run?\n"
        day = gets.strip.capitalize
        print "Part 1 or Part 2?"
        part = gets.strip
        print Kernel.const_get("Day#{day}").run(part)
        print "\n"
    end
end

AdventOfCode.run