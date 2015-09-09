require 'minitest'
require_relative '../lib/night_write'

class NightWriterTest < Minitest::Test

  def test_we_can_import_a_file
    skip
    path = File.expand_path("../lib/message.txt", __dir__)
    `ruby ../lib/night_write.rb ../input/message.txt ../output/writer.rb`
  end

  def test_we_can_convert_the_file_contents_to_lower_case
    skip
  end

  def test_we_can_turn_the_file_into_one_complete_string_without_line_breaks
    skip
  end

  def test_we_can_convert_text_to_braille
    skip
    assert equal #brailer, braille.conver
  end

end
