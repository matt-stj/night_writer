require_relative 'alphabet_key'
require_relative 'file_io'

class NightWriter

  def self.to_braille(input, file)
    line_1 = convert_each_line_to_braille(@stripped_text, 0, file)
    line_2 = convert_each_line_to_braille(@stripped_text, 1, file)
    line_3 = convert_each_line_to_braille(@stripped_text, 2, file)
    block = [line_1, line_2, line_3].join("\n")
  end

  private

  def self.convert_each_line_to_braille(stripped_text, braille_line, returned_data)
    split_string = returned_data.split("")
    line = split_string.map {|x| AlphabetKey::KEY.fetch(x)[braille_line]}.flatten.join("")
  end


end

this_is_the_program_and_not_the_test = ($PROGRAM_NAME == __FILE__)

if this_is_the_program_and_not_the_test
  block = NightWriter.to_braille(@stripped_text, FileIO.importer)
  FileIO.exporter(block)
end
