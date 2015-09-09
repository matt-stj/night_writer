@key =    { "a" => [["0."], [".."], [".."]], "b" => [["0."], ["0."], [".."]],
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
split_string = string.downcase.split("")

@new_line_1 = []
line_1 = split_string.each do |x|
  @new_line_1.push(@key[x][0])
end
@flat_line_1 = @new_line_1.flatten
@final_line_1 = @flat_line_1.join("")

  @new_line_2 = []
line_2 = split_string.each do |x|
  @new_line_2.push(@key[x][1])
  @flat_2 = @new_line_2.flatten
end
@flat_line_2 = @new_line_2.flatten
@final_line_2 = @flat_line_2.join("")

@new_line_3 = []
line_3 = split_string.each do |x|
  @new_line_3.push(@key[x][2])
  flat_3 = @new_line_3.flatten
end
@flat_line_3 = @new_line_3.flatten
@final_line_3 = @flat_line_3.join("")

@block = [@final_line_1, @final_line_2, @final_line_3].join("\n")




puts @block


#### input output for hello world ####
# "hello world"
# "0.0.0.0.0....00.0.0.00" == "0.0.0.0.0....00.0.0.00"
# "0..00.0..0..00.0000.0." == "0..00.0..0..00.0000.0."
# "....0.0.0....00.0.0..." == "....0.0.0....00.0.0..."

# formatting:: http://stackoverflow.com/questions/29292867/how-to-edit-every-x-amount-of-lines-in-txtfile-in-ruby
