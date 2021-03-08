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
    @file1_message = text.split""
  end

  # def write_to_next_file
  #   File.open(@file2, "w") do |f|
  #     f.write @file1
  #   end
  # end

  def convert_to_braille
    text_array = @file1_message.map do |letter|
      (@braille_dictionary.alphabet_hash[letter])
    end
      text_array.each do |array|
        @braille_message.push(array)
      end
  end
  def write_braille
    line1 = []
    line2 = []
    line3 = []
    @braille_message.each do |line|
      line1.push(line[0])
      line2.push(line[1])
      line3.push(line[2])
    end
    line1
    line2
    line2
    File.open(@file2, "w") do |f|
      f << "#{line1.join}\n" 
      f << "#{line2.join}\n" 
      f << "#{line3.join}\n" 
    end
  end
end