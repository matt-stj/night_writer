require 'minitest'
require_relative '../lib/night_read'
require_relative '../lib/file_io'
require_relative '../lib/alphabet_key'


class NightReaderTest < Minitest::Test

    def test_we_can_convert_a_single_lowercase_braille_character_to_text
      project_root           = File.expand_path("..", __dir__)
      original_english_file  = "input/input_message.txt"
      converted_braille_file = "output/braille.txt"
      final_english_file     = "output/output_message.txt"

        Dir.chdir project_root do

        File.open(original_english_file, 'w') { |file| file.write("h") }
        assert File.read(original_english_file) == "h"
        `ruby lib/night_write.rb #{original_english_file} #{converted_braille_file}`
        assert $?.success?
        `ruby lib/night_read.rb #{converted_braille_file} #{final_english_file}`
        assert $?.success?
        assert_equal File.read(original_english_file), File.read(final_english_file)
        end
    end

    def test_we_can_convert_a_lowercase_braille_word_to_text
      project_root           = File.expand_path("..", __dir__)
      original_english_file  = "input/input_message.txt"
      converted_braille_file = "output/braille.txt"
      final_english_file     = "output/output_message.txt"

        Dir.chdir project_root do

        File.open(original_english_file, 'w') { |file| file.write("hello") }
        assert File.read(original_english_file) == "hello"
        `ruby lib/night_write.rb #{original_english_file} #{converted_braille_file}`
        assert $?.success?
        `ruby lib/night_read.rb #{converted_braille_file} #{final_english_file}`
        assert $?.success?
        assert_equal File.read(original_english_file), File.read(final_english_file)
        end
    end

    def test_we_can_convert_a_lowercase_braille_sentence_to_text
      project_root           = File.expand_path("..", __dir__)
      original_english_file  = "input/input_message.txt"
      converted_braille_file = "output/braille.txt"
      final_english_file     = "output/output_message.txt"

        Dir.chdir project_root do

        File.open(original_english_file, 'w') { |file| file.write("hello world") }
        assert File.read(original_english_file) == "hello world"
        `ruby lib/night_write.rb #{original_english_file} #{converted_braille_file}`
        assert $?.success?
        `ruby lib/night_read.rb #{converted_braille_file} #{final_english_file}`
        assert $?.success?
        assert_equal File.read(original_english_file), File.read(final_english_file)
        end
    end

    def test_we_can_convert_an_uppercase_braille_character_to_text
      project_root           = File.expand_path("..", __dir__)
      original_english_file  = "input/input_message.txt"
      converted_braille_file = "output/braille.txt"
      final_english_file     = "output/output_message.txt"

        Dir.chdir project_root do

        File.open(original_english_file, 'w') { |file| file.write("I") }
        assert File.read(original_english_file) == "I"
        `ruby lib/night_write.rb #{original_english_file} #{converted_braille_file}`
        assert $?.success?
        `ruby lib/night_read.rb #{converted_braille_file} #{final_english_file}`
        assert $?.success?
        assert_equal File.read(original_english_file), File.read(final_english_file)
        end
    end

    def test_we_can_convert_an_uppercase_braille_word_to_text
      project_root           = File.expand_path("..", __dir__)
      original_english_file  = "input/input_message.txt"
      converted_braille_file = "output/braille.txt"
      final_english_file     = "output/output_message.txt"

        Dir.chdir project_root do

        File.open(original_english_file, 'w') { |file| file.write("HELLO") }
        assert File.read(original_english_file) == "HELLO"
        `ruby lib/night_write.rb #{original_english_file} #{converted_braille_file}`
        assert $?.success?
        `ruby lib/night_read.rb #{converted_braille_file} #{final_english_file}`
        assert $?.success?
        assert_equal File.read(original_english_file), File.read(final_english_file)
        end
    end

    def test_we_can_convert_an_uppercase_braille_sentence_to_text
      project_root           = File.expand_path("..", __dir__)
      original_english_file  = "input/input_message.txt"
      converted_braille_file = "output/braille.txt"
      final_english_file     = "output/output_message.txt"

        Dir.chdir project_root do

        File.open(original_english_file, 'w') { |file| file.write("HELLO WORLD") }
        assert File.read(original_english_file) == "HELLO WORLD"
        `ruby lib/night_write.rb #{original_english_file} #{converted_braille_file}`
        assert $?.success?
        `ruby lib/night_read.rb #{converted_braille_file} #{final_english_file}`
        assert $?.success?
        assert_equal File.read(original_english_file), File.read(final_english_file)
        end
    end

    def test_we_can_convert_a_mixed_case_braille_sentence_to_text
      project_root           = File.expand_path("..", __dir__)
      original_english_file  = "input/input_message.txt"
      converted_braille_file = "output/braille.txt"
      final_english_file     = "output/output_message.txt"

        Dir.chdir project_root do

        File.open(original_english_file, 'w') { |file| file.write("Hi ThErE") }
        assert File.read(original_english_file) == "Hi ThErE"
        `ruby lib/night_write.rb #{original_english_file} #{converted_braille_file}`
        assert $?.success?
        `ruby lib/night_read.rb #{converted_braille_file} #{final_english_file}`
        assert $?.success?
        assert_equal File.read(original_english_file), File.read(final_english_file)
        end
    end

    def test_we_can_convert_a_braille_sentence_with_various_punctuation_to_text
      project_root           = File.expand_path("..", __dir__)
      original_english_file  = "input/input_message.txt"
      converted_braille_file = "output/braille.txt"
      final_english_file     = "output/output_message.txt"

        Dir.chdir project_root do

        File.open(original_english_file, 'w') { |file| file.write("Hi? ... There?!") }
        assert File.read(original_english_file) == "Hi? ... There?!"
        `ruby lib/night_write.rb #{original_english_file} #{converted_braille_file}`
        assert $?.success?
        `ruby lib/night_read.rb #{converted_braille_file} #{final_english_file}`
        assert $?.success?
        assert_equal File.read(original_english_file), File.read(final_english_file)
        end
    end

    def test_we_can_convert_a_braille_sentence_with_multiple_lines_to_text
      project_root           = File.expand_path("..", __dir__)
      original_english_file  = "input/input_message.txt"
      converted_braille_file = "output/braille.txt"
      final_english_file     = "output/output_message.txt"

        Dir.chdir project_root do

        File.open(original_english_file, 'w') { |file| file.write("This is a long sentence. And it goes on forever.") }
        assert File.read(original_english_file) == "This is a long sentence. And it goes on forever."
        `ruby lib/night_write.rb #{original_english_file} #{converted_braille_file}`
        assert $?.success?
        `ruby lib/night_read.rb #{converted_braille_file} #{final_english_file}`
        assert $?.success?
        assert_equal File.read(original_english_file), File.read(final_english_file)
        end
    end

end
