
class ClassManager
  attr_reader :file1,
              :file2,
              :file1_message
              :braille_dictionary

  def initialize(file1, file2)
    @file1 = file1
    @file2 = file2
    @file1_message =[]
    @braille_dictionary = BrailleDictionary.new
  end

  def print_message
    text =(File.readlines(@file1)).join.length
   p "Created #{@file2} containing #{text} characters"
  end

  def create_file1_message
    text = (File.readlines(@file1)).join
    @file1_message = text.split""
  end

  def write_to_next_file
    File.open(@file2, "w") do |f|
      f.write @file1_message
    end
  end

  def convert_to_braille
    
  end
end

