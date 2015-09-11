require 'minitest'
require_relative '../lib/night_write'
require_relative '../lib/file_io'
require_relative '../lib/alphabet_key'

class NightWriterTest < Minitest::Test

  def test_we_are_notified_if_the_converter_cant_proceed_do_to_an_unsupported_character
    assert_raises(KeyError) { NightWriter.to_braille("^") }
  end

  def test_we_can_convert_a_single_lowercase_character_to_braille

    assert_equal    "0.\n" +
                    "00\n" +
                    "..",       NightWriter.to_braille("h")
  end

  def test_we_can_convert_a_single_lowercase_word_to_braille

    assert_equal    "0.0.0.0.0.\n" +
                    "00.00.0..0\n" +
                    "....0.0.0.",       NightWriter.to_braille("hello")

  end

  def test_we_can_convert_many_lowercase_words_to_braille

    assert_equal    ".00..0.0.00000...000..0000...00..0.00.0....00.0.0..0\n" +
                    "00.00.000..000..0.0......0..00000.00.000..00.000..0.\n" +
                    "0...0.0...0...........0.00...00...0...0....00.0.0.0.",       NightWriter.to_braille("testing if my writer works")

  end

  def test_we_can_convert_a_single_uppercase_character_to_braille

    assert_equal    "..0.\n" +
                    "..00\n" +
                    ".0..",       NightWriter.to_braille("H")
  end

  def test_we_can_convert_an_uppercase_word_to_braille

    assert_equal    "..0...0...0...0...0.\n" +
                    "..00...0..0...0....0\n" +
                    ".0...0...00..00..00.",       NightWriter.to_braille("HELLO")
  end

  def test_we_can_convert_an_uppercase_word_to_braille

    assert_equal    "..0...0...0...0...0.\n" +
                    "..00...0..0...0....0\n" +
                    ".0...0...00..00..00.",       NightWriter.to_braille("HELLO")
  end

  def test_we_can_convert_multiple_upercase_words_to_braille

    assert_equal    "..0...0...0...0...0......0..0...0...0...00\n" +
                    "..00...0..0...0....0....00...0..00..0....0\n" +
                    ".0...0...00..00..00....0.0.00..00..00..0..",       NightWriter.to_braille("HELLO WORLD")
  end

  def test_we_can_convert_mixed_case_words_to_braille

    assert_equal    "..0.0...0.0...0....0..0.0...0.00\n" +
                    "..00.0..0.0....0..00...000..0..0\n" +
                    ".0.....00.0..00....0.00.0..00...",       NightWriter.to_braille("HeLlO wOrLd")
  end

  def test_our_output_file_will_cap_lines_at_80_characters
    assert_equal    "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n" +
                    "................................................................................\n" +
                    "................................................................................",

                    NightWriter.to_braille("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
  end

  def test_our_output_file_will_wrap_blocks_of_braille_after_80_characters
    assert_equal    "0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.\n" +
                    "................................................................................\n" +
                    "................................................................................\n" +
                    "0.\n" +
                    "..\n" +
                    "..",

                    NightWriter.to_braille("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
  end


end
