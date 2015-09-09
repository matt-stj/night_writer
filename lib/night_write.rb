class NightWriter

  im_running_for_real = ($PROGRAM_NAME == __FILE__)

  if im_running_for_real
  end

  if $PROGRAM_NAME == __FILE__
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
  output.write(@data.flatten[0])
  output.close
  length = @data.inject(0) {|c, w| c += w.length }

  puts "Created '#{ARGV[1]}' containing #{length} characters"


  def self.to_braille(file)
  end

end

braille = NightWriter.to_braille(input)
