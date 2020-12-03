module Solution
    def self.included(klass)
        klass.extend(ClassMethods)
    end
    
    module ClassMethods
        def run(part)
            file = File.read(self::FILE_INPUT)
            array = file.split("\n").map { |line| self.parse_line(line) }
            self.new(array, part).process
        end

        def parse_line(line)
            line
        end
    end

    def initialize(input, part)
        @input = input
        @part = part
    end

    def process
    end
end