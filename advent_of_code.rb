Dir["./solutions/*.rb"].each {|file| require file }

class AdventOfCode
    def self.run
        print "What day would you like to run?\n"
        day = gets.strip.capitalize
        print Kernel.const_get("Day#{day}").run
        print "\n"
    end
end

AdventOfCode.run