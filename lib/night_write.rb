require_relative 'alphabet_key'
require_relative 'file_io'

class NightWriter
  def self.to_braille(text)
    line_1 = convert_each_line_to_braille(0, text)
    line_2 = convert_each_line_to_braille(1, text)
    line_3 = convert_each_line_to_braille(2, text)
    chopped_1 = line_chopper(line_1)
    chopped_2 = line_chopper(line_2)
    chopped_3 = line_chopper(line_3)
    block = formatter(chopped_1, chopped_2, chopped_3)
  end


  private

  def self.convert_each_line_to_braille(braille_line, text)
    split_string = text.split("")
    line = split_string.map do |x|
      AlphabetKey::KEY.fetch(x)[braille_line]
    end.flatten.join("")
  end

  def self.line_chopper(line)
    line.scan(/.{1,80}/)
  end

  def self.formatter(top_line, middle_line, bottom_line)
    output = ""
    top_line.size.times do |index|
      output << top_line[index]
      output << "\n"
      output << middle_line[index]
      output << "\n"
      output << bottom_line[index]
      output << "\n" if index != (top_line.size - 1)
      index += 1
    end
    output
  end


end

this_is_the_program_and_not_the_test = ($PROGRAM_NAME == __FILE__)

if this_is_the_program_and_not_the_test
  block = NightWriter.to_braille(FileIO.text_importer)
  FileIO.braille_exporter(block)
end
