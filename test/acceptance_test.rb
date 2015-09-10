class AcceptanceTest < Minitest::Test
  def test_the_thing_actually_works
    project_root           = File.expand_path("..", __dir__)
    original_english_file  = "input/message.txt"
    converted_braille_file = "output/braille.txt"
    final_english_file     = "output/message.txt"

    Dir.chdir project_root do
      printed = `ruby lib/night_write.rb #{original_english_file} #{converted_braille_file}`
      assert_equal "Created 'output/braille.txt' containing 200 characters", printed.chomp
      assert $?.success?

      # FIXME: the file redirection should be done by night_read.rb
      `ruby lib/night_read.rb #{converted_braille_file} #{final_english_file} > #{final_english_file}`
      assert $?.success?

      assert_equal File.read(original_english_file), File.read(final_english_file)
    end
  end
end
