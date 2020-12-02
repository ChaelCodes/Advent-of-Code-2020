Dir["./solutions/*.rb"].each {|file| require file }

class AdventOfCode
    def self.run
        print "What day would you like to run? (ex. one)\n"
        day = gets.strip.capitalize
        print "Part 1 or Part 2? (ex. 1)\n"
        part = gets.strip.to_i
        print Kernel.const_get("Day#{day}").run(part)
        print "\n"
    end
end

AdventOfCode.run