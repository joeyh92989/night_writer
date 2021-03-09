require './lib/english_translator'
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
  end

  def print_message
    text =(File.readlines(@file2)).join.length
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
    string_pairs = create_string_pairs(string_container)
    @file1_message = string_pairs.map do |line|
      line[0].zip(line[1], line[2])
    end
  end

  def write_english
    File.open(@file2, 'w') {|file| file.truncate(0) }
    message = @english_translator.english_message.flatten
    File.open(@file2, "a") do |f|
      f << "#{message.join}" 
    end
  end

  def create_string_pairs(array)
    array.map do |v|
      v.map do |x|
        x.scan(/.{1,2}/m)
      end
    end
  end
end