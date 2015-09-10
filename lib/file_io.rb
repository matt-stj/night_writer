class FileIO

  def self.importer
    input = File.open(ARGV[0], "r")
    file_text= []
    input.each_line do |line|
      file_text << (line.strip.gsub("\n",''))
    end
    input.close
    @stripped_text = file_text.first
  end

  def self.braille_importer
    input = File.open(ARGV[0], "r")
    file_text= []
    input.each_line do |line|
      file_text << (line.strip.gsub("\n",''))
    end
    input.close
    @braille_data = file_text
  end

  def self.exporter(block)
    output = File.open(ARGV[1], 'w')
    output.write(block)
    output.close
    output_length = block.chars.inject(0) {|c, w| c += w.length }
    puts "Created '#{ARGV[1]}' containing #{output_length} characters"
  end

end
