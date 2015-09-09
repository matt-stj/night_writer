require 'minitest'                     # => true
require_relative '../lib/night_write'  # ~> TypeError: no implicit conversion of nil into String

class NightWriterTest < Minitest::Test

  def test_we_can_import_a_file
    skip
    `ruby ../lib/night_write.rb ../input/message.txt ../output/writer.rb`
  end

  def test_we_can_convert_the_file_contents_to_lower_case
    skip
  end

  def test_we_can_turn_the_file_into_one_complete_string_without_line_breaks
    skip
  end

  def test_we_can_convert_a_single_character_to_braille_in_one_flat_line
    skip
  end

  def test_we_can_output_the_conversion_into_3_lines
    skip
  end

  def test_we_can_convert_a_string_of_test_to_functional_braille
    skip
    #### input output for hello world ####
    # "hello world"
    # "0.0.0.0.0....00.0.0.00" == "0.0.0.0.0....00.0.0.00"
    # "0..00.0..0..00.0000.0." == "0..00.0..0..00.0000.0."
    # "....0.0.0....00.0.0..." == "....0.0.0....00.0.0..."
  end

end

# ~> TypeError
# ~> no implicit conversion of nil into String
# ~>
# ~> /Users/Matt/Turing/1-Modual/Projects/night_writer/lib/night_write.rb:9:in `initialize'
# ~> /Users/Matt/Turing/1-Modual/Projects/night_writer/lib/night_write.rb:9:in `open'
# ~> /Users/Matt/Turing/1-Modual/Projects/night_writer/lib/night_write.rb:9:in `<class:NightWriter>'
# ~> /Users/Matt/Turing/1-Modual/Projects/night_writer/lib/night_write.rb:1:in `<top (required)>'
# ~> /Users/Matt/Turing/1-Modual/Projects/night_writer/test/night_write_test.rb:2:in `require_relative'
# ~> /Users/Matt/Turing/1-Modual/Projects/night_writer/test/night_write_test.rb:2:in `<main>'
