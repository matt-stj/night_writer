require_relative 'alphabet_key'
require_relative 'file_io'

class NightWriter

  def self.to_braille(text)
    line_1 = convert_each_line_to_braille(0, text)
    line_2 = convert_each_line_to_braille(1, text)
    line_3 = convert_each_line_to_braille(2, text)
    block = [line_1, line_2, line_3].join("\n")
  end

  private

  def self.convert_each_line_to_braille(braille_line, text)
    split_string = text.split("")
    line = split_string.map do |x|
      AlphabetKey::KEY.fetch(x)[braille_line]
    end.flatten.join("")
  end

  def line_chopper
    
  end


end

this_is_the_program_and_not_the_test = ($PROGRAM_NAME == __FILE__)

if this_is_the_program_and_not_the_test
  block = NightWriter.to_braille(FileIO.text_importer)
  FileIO.braille_exporter (block)
end
