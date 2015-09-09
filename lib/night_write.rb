class NightWriter

  im_running_a_test = ($PROGRAM_NAME == __FILE__)

  if im_running_a_test
    input = File.open(ARGV[0], "r")
    output = File.open(ARGV[1], 'w')
  else
    input = File.open("/Users/Matt/Turing/1-Modual/Projects/night_writer/input/message.txt", "r")
    output = File.open("/Users/Matt/Turing/1-Modual/Projects/night_writer/output/writer.txt", "w")
  end

  @data = []
  input.each_line do |line|
    @data << (line.downcase.strip.gsub("\n",''))
  end
  input.close

  def self.to_braille(input)
    key =    {  "a" => [["0."], [".."], [".."]], "b" => [["0."], ["0."], [".."]],
                "c" => [["00"], [".."], [".."]], "d" => [["00"], ["0."], [".."]],
                "e" => [["0."], [".0"], [".."]], "f" => [["00"], ["0."], [".."]],
                "g" => [["00"], ["00"], [".."]], "h" => [["0."], ["0."], [".."]],
                "i" => [[".0"], ["0."], [".."]], "j" => [[".0"], ["00"], [".."]],
                "k" => [["0."], [".."], ["0."]], "l" => [["0."], ["0."], ["0."]],
                "m" => [["00"], [".."], ["0."]], "n" => [["00"], [".0"], ["0."]],
                "o" => [["0."], [".0"], ["0."]], "p" => [["00"], ["0."], ["0."]],
                "q" => [["00"], ["00"], ["0."]], "r" => [["0."], ["00"], ["0."]],
                "s" => [[".0"], ["0."], ["0."]], "t" => [[".0"], ["00"], ["0."]],
                "u" => [["0."], [".."], ["00"]], "v" => [["0."], ["0."], ["0."]],
                "w" => [[".0"], ["00"], [".0"]], "x" => [["00"], ["0."], ["00"]],
                "y" => [["00"], [".0"], ["00"]], "z" => [["0."], [".0"], ["00"]],
                " " => [[".."], [".."], [".."]], "." => [[".."], ["00"], ["0."]],
                "’" => [[".."], ["0."], [".."]], "!" => [[".."], ["00"], ["0."]],
                "?" => [[".."], ["0."], ["00"]], "'" => [[".."], [".."], ["0."]],
                "-" => [[".."], [".."], ["00"]]

              }

    string = @data[0]
    split_string = string.split("")

    new_line_1 = []
    line_1 = split_string.each do |x|
      new_line_1.push(key[x][0])
    end
    flat_line_1 = new_line_1.flatten
    final_line_1 = flat_line_1.join("")

    new_line_2 = []
    line_2 = split_string.each do |x|
      new_line_2.push(key[x][1])
      flat_2 = new_line_2.flatten
    end
    flat_line_2 = new_line_2.flatten
    final_line_2 = flat_line_2.join("")

    new_line_3 = []
    line_3 = split_string.each do |x|
      new_line_3.push(key[x][2])
      flat_3 = new_line_3.flatten
    end
    flat_line_3 = new_line_3.flatten
    final_line_3 = flat_line_3.join("")

    @block = [final_line_1, final_line_2, final_line_3].join("\n")
  end

  braille = NightWriter.to_braille(@data)

  output.write(@block)
  output.close
  output_length = @block.chars.inject(0) {|c, w| c += w.length }

  puts "Created '#{ARGV[1]}' containing #{output_length} characters"

end
