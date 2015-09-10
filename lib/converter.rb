ALPHABET_TO_BRAILLE  =

         {  "a" => [["0."], [".."], [".."]], "b" => [["0."], ["0."], [".."]],
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

string = "hello world this is a longer test"
@split_string = string.split("")

def convert_each_line_to_braille(i)
  line = @split_string.map {|x| ALPHABET_TO_BRAILLE[x][i]}.flatten.join("")
end


def convert_to_braille(text)
  line_1 = convert_each_line_to_braille(0)
  line_2 = convert_each_line_to_braille(1)
  line_3 = convert_each_line_to_braille(2)

  @block = [line_1, line_2, line_3].join("\n")
  puts @block

end

convert_to_braille(@split_string)


# formatting:: http://stackoverflow.com/questions/29292867/how-to-edit-every-x-amount-of-lines-in-txtfile-in-ruby
input = File.open("/Users/Matt/Turing/1-Modual/Projects/night_writer/input/message.txt", "r")
output = File.open("/Users/Matt/Turing/1-Modual/Projects/night_writer/output/writer.txt", "w")
end
