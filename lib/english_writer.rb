require './lib/braille_dictionary'
class EnglishWriter
  attr_reader :file1,
              :file2,
              :file1_message,
              :english_dictionary,
              :english_message

  def initialize(file1, file2)
    @file1 = file1
    @file2 = file2
    @file1_message =[]
    create_file1_message
    @english_translator = EnglishTranslator.new(@file1_message)
    # @english_dictionary = EnglishDictionary.new
    # @english_message= []
  end

  def print_message
    text =(File.readlines(@file1)).join.length
   p "Created #{@file2} containing #{text} characters"
  end

  def create_file1_message
    lines_array = File.read(@file1).split
    message_stage = lines_array.partition.with_index { |_, index| index <= 2 }
    string_container = []
    until message_stage == [[],[]]
      string_container << message_stage.shift
      message_stage.flatten!
      message_stage =message_stage.partition.with_index { |_, index| index <= 2 }
      message_stage
    end
     string_pairs = string_container.map do |v|
      v.map do |x|
        x.scan(/.{1,2}/m)
     end
    end
    @file1_message = string_pairs.map do |line|
      line[0].zip(line[1], line[2])
    end
  end

  # def convert_to_english
  #   text_array = @file1_message.map do |letters|
  #     letters.map do |letter|
  #       (@english_dictionary.alphabet_hash[letter])
  #   end
  #  end
  #     text_array.each do |array|
  #       @english_message.push(array)
  #   end
  # end

  def write_english
    File.open(@file2, 'w') {|file| file.truncate(0) }
    until @english_message == []
     line1 = []
     @english_message[0].each do |line|
       line1.push(line[0])
     end
     @english_message.shift
     line1
     File.open(@file2, "a") do |f|
       f << "#{line1.join}\n" 
    end
  end
end
end