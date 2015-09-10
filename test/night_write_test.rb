require 'minitest'
require_relative '../lib/night_write'
require_relative '../lib/file_io'
require_relative '../lib/alphabet_key'

class NightWriterTest < Minitest::Test

  def test_we_are_notified_if_the_converter_cant_proceed_do_to_unsupported_characters
    assert_equal "/lib/night_write.rb:17:in `fetch': key not found: "^" (KeyError)", NightWriter.to_braille("^")
  end

  def test_we_can_convert_a_single_character_to_braille

    assert_equal    "0.\n" +
                    "00\n" +
                    "..",       NightWriter.to_braille("h")

  end

  def test_we_can_convert_a_single_word_to_braille

    assert_equal    "0.0.0.0.0.\n" +
                    "00.00.0..0\n" +
                    "....0.0.0.",       NightWriter.to_braille("hello")

  end

  def test_we_can_convert_many_words_to_braille

    assert_equal    ".00..0.0.00000...000..0000...00..0.00.0....00.0.0..0\n" +
                    "00.00.000..000..0.0......0..00000.00.000..00.000..0.\n" +
                    "0...0.0...0...........0.00...00...0...0....00.0.0.0.",       NightWriter.to_braille("testing if my writer works")

  end

end
