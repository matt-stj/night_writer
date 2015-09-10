require_relative 'alphabet_key'
require_relative 'file_io'

class NightWriter

  def self.convert_each_line_to_braille(stripped_text, braille_line)
    returned_data = FileIO.importer
    split_string = returned_data.split("")
    line = split_string.map {|x| AlphabetKey::KEY[x][braille_line]}.flatten.join("")
  end

  def self.to_braille(input)
    line_1 = convert_each_line_to_braille(@stripped_text, 0)
    line_2 = convert_each_line_to_braille(@stripped_text, 1)
    line_3 = convert_each_line_to_braille(@stripped_text, 2)
    block = [line_1, line_2, line_3].join("\n")
    FileIO.exporter(block)
  end

end

braille = NightWriter.to_braille(@stripped_text)
