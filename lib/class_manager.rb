require './lib/braille_dictionary'
class ClassManager
  attr_reader :file1,
              :file2,
              :file1_message,
              :braille_dictionary,
              :braille_message

  def initialize(file1, file2)
    @file1 = file1
    @file2 = file2
    @file1_message =[]
    @braille_dictionary = BrailleDictionary.new
    @braille_message= []
  end

  def print_message
    text =(File.readlines(@file1)).join.length
   p "Created #{@file2} containing #{text} characters"
  end

  def create_file1_message
    text = (File.readlines(@file1)).join
    split_text = text.split""
    message_stage = split_text.partition.with_index { |_, index| index <= 39 }
    until message_stage == [[],[]]
      @file1_message << message_stage.shift
      message_stage.flatten!
      message_stage =message_stage.partition.with_index { |_, index| index <= 39 }
      message_stage
    end
  end

  def convert_to_braille
    text_array = @file1_message.map do |letters|
      letters.map do |letter|
        (@braille_dictionary.alphabet_hash[letter])
    end
   end
      text_array.each do |array|
        @braille_message.push(array)
    end
  end

  def write_braille
    File.open(@file2, 'w') {|file| file.truncate(0) }
    until @braille_message == []
     line1 = []
     line2 = []
     line3 = []
     @braille_message[0].each do |line|
       line1.push(line[0])
       line2.push(line[1])
       line3.push(line[2])
     end
     @braille_message.shift
     line1
     line2
     line2
     File.open(@file2, "a") do |f|
       f << "#{line1.join}\n" 
       f << "#{line2.join}\n" 
       f << "#{line3.join}\n" 
    end
  end
end
end