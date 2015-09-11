class FileIO

  def self.text_importer
    input = File.open(ARGV[0], "r")
    file_text= []
    input.each_line do |line|
      file_text << (line.chomp.strip.gsub('\n', ''))
    end
    input.close
    stripped_text = file_text.join(" ")
  end

  def self.braille_exporter(block)
    output = File.open(ARGV[1], 'w')
    output.write(block)
    output.close
    output_length = block.chars.inject(0) {|c, w| c += w.length }
    puts "Created '#{ARGV[1]}' containing #{output_length} characters"
  end

  def self.braille_importer
    input = File.open(ARGV[0], "r")
    file_text = []
    input.each_line do |line|
      file_text << (line.strip.gsub('\n', ''))
    end
    new_array = []
    if file_text.to_s.size > 180
      (file_text.size/2).times do |i|
        new_array << file_text[i] + file_text[i+3]
        i += 1
      end 
    else
      new_array = file_text
    end
    new_array
  end

  def self.text_exporter(text)
    output = File.open(ARGV[1], 'w')
    output.write(text)
    output.close
    output_length = text.chars.inject(0) {|c, w| c += w.length }
    puts "Created '#{ARGV[1]}' containing #{output_length} characters"
  end


end
