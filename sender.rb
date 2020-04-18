require 'rubyserial'


class Sender
    attr_accessor :content, :device, :write_possible

    def initialize(filename, device)
        self.content = File.read(filename) + "\n\n"
        self.device = device || "/dev/ttyUSB0"
        self.write_possible = true
        
        read_until_end
    end

    def serial
        @serial ||= Serial.new(device, 115200)
    end

    def read_until_end
        loop do
            byte = serial.read(1)
            return if byte.size == 0
            print byte
            if byte == "\x13"
                self.write_possible = false
            elsif byte == "\x11"
                self.write_possible = true
            end
        end
    end

    def write_char(char)
        while !write_possible
            read_until_end
            sleep 0.0001
        end
        serial.write(char)
        sleep 0.0001
        read_until_end
    end

    def write_content
        content.each_char { |char| write_char(char) }
    end
end

Sender.new(ARGV[0], ARGV[1]).write_content