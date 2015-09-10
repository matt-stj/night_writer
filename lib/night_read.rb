require_relative 'alphabet_key'
require_relative 'file_io'

class NightReader

  def self.process_the_braille(braille_data)
    @line_1 = []; @line_2 = []; @line_3 = []
    braille_data = FileIO.braille_importer
    line_1 = break_up_braille_into_pairs(braille_data[0], @line_1)
    line_2 = break_up_braille_into_pairs(braille_data[1], @line_2)
    line_3 = break_up_braille_into_pairs(braille_data[2], @line_3)
    build_complete_array_of_pairs
  end

  def self.break_up_braille_into_pairs(line, new_array)
    line.split("").each_slice(2) { |pair| new_array << pair }
  end

  def self.transpose
    array_to_transpose = []
    array_to_transpose << @line_1
    array_to_transpose << @line_2
    array_to_transpose << @line_3

    array_to_transpose.transpose
  end


  def self.build_complete_array_of_pairs
    @line_1.map! {|a| a.join}
    @line_2.map! {|a| a.join}
    @line_3.map! {|a| a.join}
    group_together_characters
  end

  def self.group_together_characters
    @final_output = []
    i = 0
    until i == @line_1.length
      @final_output.push(@line_1[i])
      @final_output << @line_2[i]
      @final_output << @line_3[i]
      i += 1
    end
      combine
  end

  def self.combine
    combined_characters_output = []
    @final_output.each_slice(3) { |slice| combined_characters_output << slice }
    check_against_key(combined_characters_output)
  end

  def self.check_against_key(combined_characters_output)
    sentence = []
    combined_characters_output.each_with_index do |char, index|
      if char == ["..", "..", ".0"]
        next_element = combined_characters_output[index + 1]
        next_element[0].prepend("..")
        next_element[1].prepend("..")
        next_element[2].prepend(".0")

      else
        AlphabetKey::KEY.has_value?(char)
        sentence << AlphabetKey::KEY.key(char)
      end
    end
    text = sentence.join("")
    to_text(text)
  end

  def self.to_text(text)
    FileIO.text_exporter(text)
  end

end

this_is_the_program_and_not_the_test = ($PROGRAM_NAME == __FILE__)

if this_is_the_program_and_not_the_test
  braille = NightReader.process_the_braille(@braille_data)
end
