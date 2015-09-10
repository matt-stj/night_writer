require 'minitest'
require_relative '../lib/night_write'
require_relative '../lib/file_io'
require_relative '../lib/alphabet_key'

class NightWriterTest < Minitest::Test

  def test_we_can_import_a_file
    `ruby ../lib/night_write.rb ../input/message.txt ../output/writer.rb`
  end

  def test_we_can_turn_the_file_into_one_complete_string_without_line_breaks_or_capital_letters
    skip
    assert_equal "this is the new string",
                 FileIO.importer("THIS IS the new STRING")
  end

  def test_we_can_convert_a_single_character_to_braille
    assert_equal     "00
                      ..
                     ..",

  end

  def test_we_can_convert_a_string_of_test_to_functional_braille
    skip
    #### input output for hello world ####
  end

  def test_we_are_notified_if_the_converter_cant_proceed_do_to_unsupported_characters
  end

end
