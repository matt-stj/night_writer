class NightWriter

    if $PROGRAM_NAME != __FILE__                                                                # => false
      handle = File.open(ARGV[0], "r")
      writer = File.open(ARGV[1], 'w')
    else
      handle = File.open("/Users/Matt/Turing/1-Modual/Projects/night_writer/message.txt", "r")  # => #<File:/Users/Matt/Turing/1-Modual/Projects/night_writer/message.txt>
      writer = File.open("/Users/Matt/Turing/1-Modual/Projects/night_writer/writer.txt", "w")   # => #<File:/Users/Matt/Turing/1-Modual/Projects/night_writer/writer.txt>
    end                                                                                         # => #<File:/Users/Matt/Turing/1-Modual/Projects/night_writer/writer.txt>
    @data = []                                                                                  # => []
    handle.each_line do |line|                                                                  # => #<File:/Users/Matt/Turing/1-Modual/Projects/night_writer/message.txt>
      @data << (line.downcase.strip.gsub("\n",''))                                                    # => ["lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ut enim ad minim veniam, quis nostrudexercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. duis auteirure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."]
    end                                                                                         # => #<File:/Users/Matt/Turing/1-Modual/Projects/night_writer/message.txt>
    handle.close                                                                                # => nil

  # # write to output File
  # # one line at a time - top row, middle row, bottom row --NEED TO KEEP CHAR SPACING EXACTLY THE SAME and stop @ 80
  #         #this will work because 80 is an even # and each character takes up 2 chars - so we'll get 40 chars per line.
    writer.write(@data.flatten[0])                    # => 442
    writer.close                                      # => nil
    length = @data.inject(0) {|c, w| c += w.length }  # => 442

      # # print the summary
    puts "Created '#{ARGV[1]}' containing #{length} characters"  # => nil


  # convert to braille
  # make object that lays down first line, second line, third line then output that as the complete converted line
    @key =    { "a" => [["0."], [".."], [".."]], "b" => [["0."], ["0."], [".."]],  # => [["0."], ["0."], [".."]]
                "c" => [["00"], [".."], [".."]], "d" => [["00"], ["0."], [".."]],  # => [["00"], ["0."], [".."]]
                "e" => [["0."], [".0"], [".."]], "f" => [["00"], ["0."], [".."]],  # => [["00"], ["0."], [".."]]
                "g" => [["00"], ["00"], [".."]], "h" => [["0."], ["0."], [".."]],  # => [["0."], ["0."], [".."]]
                "i" => [[".0"], ["0."], [".."]], "j" => [[".0"], ["00"], [".."]],  # => [[".0"], ["00"], [".."]]
                "k" => [["0."], [".."], ["0."]], "l" => [["0."], ["0."], ["0."]],  # => [["0."], ["0."], ["0."]]
                "m" => [["00"], [".,"], ["0."]], "n" => [["00"], [".0"], ["0."]],  # => [["00"], [".0"], ["0."]]
                "o" => [["0."], [".0"], [".0"]], "p" => [["00"], ["0."], ["0."]],  # => [["00"], ["0."], ["0."]]
                "q" => [["00"], ["00"], ["0."]], "r" => [["0."], ["00"], ["0."]],  # => [["0."], ["00"], ["0."]]
                "s" => [[".0"], ["0."], ["0."]], "t" => [["0."], ["00"], ["0."]],  # => [["0."], ["00"], ["0."]]
                "u" => [["0."], [".."], ["00"]], "v" => [["0."], ["0."], ["0."]],  # => [["0."], ["0."], ["0."]]
                "w" => [["0."], [".0"], [".0"]], "x" => [["00"], ["0."], ["00"]],  # => [["00"], ["0."], ["00"]]
                "y" => [["00"], [".0"], ["00"]], "z" => [["0."], [".0"], ["00"]],  # => [["0."], [".0"], ["00"]]
                " " => [[".."], [".."], [".."]]                                    # => [[".."], [".."], [".."]]

              }  # => {"a"=>[["0."], [".."], [".."]], "b"=>[["0."], ["0."], [".."]], "c"=>[["00"], [".."], [".."]], "d"=>[["00"], ["0."], [".."]], "e"=>[["0."], [".0"], [".."]], "f"=>[["00"], ["0."], [".."]], "g"=>[["00"], ["00"], [".."]], "h"=>[["0."], ["0."], [".."]], "i"=>[[".0"], ["0."], [".."]], "j"=>[[".0"], ["00"], [".."]], "k"=>[["0."], [".."], ["0."]], "l"=>[["0."], ["0."], ["0."]], "m"=>[["00"], [".,"], ["0."]], "n"=>[["00"], [".0"], ["0."]], "o"=>[["0."], [".0"], [".0"]], "p"=>[["00"], ["0."], ["0."]], "q"=>[["00"], ["00"], ["0."]], "r"=>[["0."], ["00"], ["0."]], "s"=>[[".0"], ["0."], ["0."]], "t"=>[["0."], ["00"], ["0."]], "u"=>[["0."], [".."], ["00"]], "v"=>[["0."], ["0."], ["0."]], "w"=>[["0."], [".0"], [".0"]], "x"=>[["00"], ["0."], ["00"]], "y"=>[["00"], [".0"], ["00"]], "z"=>[["0."], [".0"], ["00"]], " "=>[[".."], [".."], [".."]]}

end  # => {"a"=>[["0."], [".."], [".."]], "b"=>[["0."], ["0."], [".."]], "c"=>[["00"], [".."], [".."]], "d"=>[["00"], ["0."], [".."]], "e"=>[["0."], [".0"], [".."]], "f"=>[["00"], ["0."], [".."]], "g"=>[["00"], ["00"], [".."]], "h"=>[["0."], ["0."], [".."]], "i"=>[[".0"], ["0."], [".."]], "j"=>[[".0"], ["00"], [".."]], "k"=>[["0."], [".."], ["0."]], "l"=>[["0."], ["0."], ["0."]], "m"=>[["00"], [".,"], ["0."]], "n"=>[["00"], [".0"], ["0."]], "o"=>[["0."], [".0"], [".0"]], "p"=>[["00"], ["0."], ["0."]], "q"=>[["00"], ["00"], ["0."]], "r"=>[["0."], ["00"], ["0."]], "s"=>[[".0"], ["0."], ["0."]], "t"=>[["0."], ["00"], ["0."]], "u"=>[["0."], [".."], ["00"]], "v"=>[["0."], ["0."], ["0."]], "w"=>[["0."], [".0"], [".0"]], "x"=>[["00"], ["0."], ["00"]], "y"=>[["00"], [".0"], ["00"]], "z"=>[["0."], [".0"], ["00"]], " "=>[[".."], [".."], [".."]]}

# >> Created '' containing 442 characters
