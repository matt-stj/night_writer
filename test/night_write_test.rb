require 'minitest'
require_relative '../lib/night_write'

class NightWriterTest < Minitest::Test

  def test_we_can_import_a_file
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
    assert_equal "sakljd",
  end

  def test_we_can_output_the_conversion_into_3_lines
  end

  def test_we_can_convert_a_string_of_test_to_functional_braille
    #### input output for hello world ####
    # "hello world"
    # "0.0.0.0.0....00.0.0.00" == "0.0.0.0.0....00.0.0.00"
    # "0..00.0..0..00.0000.0." == "0..00.0..0..00.0000.0."
    # "....0.0.0....00.0.0..." == "....0.0.0....00.0.0..."
  end
end
