require_relative 'alphabet_key'

# NW class --> File I/O .read(file)
#                             |
# NW class  <--  raw text <---
#  |
#   ---------------> Coder class
#                          |
#  -converted text  <------
# |
#  ----------> File I/O FileIO.writer(filename, text)

class NightWriter

  def self.importer
    input = File.open(ARGV[0], "r")
    @data = []
    input.each_line do |line|
      @data << (line.downcase.strip.gsub("\n",''))
    end
    input.close
  end

  def self.to_braille(input)
    line_1 = convert_each_line_to_braille(0)
    line_2 = convert_each_line_to_braille(1)
    line_3 = convert_each_line_to_braille(2)
    @block = [line_1, line_2, line_3].join("\n")
    exporter
  end

  def self.convert_each_line_to_braille(i)
    importer
    string = @data[0]
    @split_string = string.split("")
    line = @split_string.map {|x| AlphabetKey::KEY[x][i]}.flatten.join("")
  end

  def self.exporter
    output = File.open(ARGV[1], 'w')
    output.write(@block)
    output.close
    output_length = @block.chars.inject(0) {|c, w| c += w.length }
    puts "Created '#{ARGV[1]}' containing #{output_length} characters"
  end

  braille = NightWriter.to_braille(@data)

end
