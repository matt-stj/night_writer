require 'minitest'
require_relative '../lib/night_write'
require_relative '../lib/file_io'
require_relative '../lib/alphabet_key'

class NightWriterTest < Minitest::Test

  def test_we_can_import_and_export_files
    full_path = "~/Turing/1-Modual/Projects/night_writer"
    assert_equal "Created '/Users/Matt/Turing/1-Modual/Projects/night_writer/output/writer.rb' containing 200 characters\n",
    `ruby #{full_path}/lib/night_write.rb #{full_path}/input/message.txt #{full_path}/output/writer.rb`

  end

  def test_we_can_turn_the_file_into_one_complete_string_without_line_breaks
    skip
    assert_equal "this is the new string",
                 FileIO.importer("THIS IS the new STRING")
  end

  def test_we_can_convert_a_single_character_to_braille
    skip
    assert_equal     "00\n" +
                     "..\n" +
                      "..",       NightWriter.to_braille("h")

  end

  def test_we_can_convert_a_string_of_test_to_functional_braille
    skip
    #### input output for hello world ####
  end

  def test_we_are_notified_if_the_converter_cant_proceed_do_to_unsupported_characters
    skip
  end

end
