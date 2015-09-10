require_relative 'alphabet_key'
require_relative 'file_io'

class NightReader

  def self.process_each_line_of_braille(braille_data)
    @line_1 = []; @line_2 = []; @line_3 = []
    braille_data = FileIO.braille_importer
    line_1 = break_up_braille_into_characters(braille_data[0], @line_1)
    line_2 = break_up_braille_into_characters(braille_data[1], @line_2)
    line_3 = break_up_braille_into_characters(braille_data[2], @line_3)
      require "pry"; binding.pry
  end

  def self.break_up_braille_into_characters(line, new_array)
    line.split("").each_slice(2) { |slice| new_array << slice.join }
  end

  #### push each character into an array of arrays (top, mid, bottom)-  like in hash
  #### iterate over each character and check against hash key

  def self.to_text(input)
    line_1 = process_each_line_of_braille(braille_data)
    FileIO.exporter(block)
  end

end

braille = NightReader.process_each_line_of_braille(@braille_data)
