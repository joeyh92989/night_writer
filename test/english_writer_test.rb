require './test/test_helper'
require './lib/english_writer'
require './lib/english_dictionary'

class BrailleWriterTest < MiniTest::Test

  def test_it_exists
    class_manager = EnglishWriter.new('test_braille_message.txt', 'test_english_conversion.txt')
    assert_instance_of EnglishWriter, class_manager
  end

  def test_it_has_attributes
    class_manager = EnglishWriter.new("test_braille_message.txt", "test_english_conversion.txt")
    assert_equal 'test_braille_message.txt', class_manager.file1
    assert_equal 'test_english_conversion.txt', class_manager.file2
  end
  def test_it_can_store_file_message
    class_manager = EnglishWriter.new('test_braille_message.txt', 'test_english_conversion.txt')
    assert_equal [], class_manager.file1_message
  end

  def test_it_can_add_file1_message
    
    class_manager = EnglishWriter.new("test_braille_message.txt", "test_english_conversion.txt")
    class_manager.create_file1_message
    
    refute_equal nil, class_manager.file1_message.count
  end

  # def test_it_can_write_data_to_a_file
  #   skip
  #   class_manager = ClassManager.new('test_message.txt', 'test_braille.txt')
  #   class_manager.create_file1_message
  #   class_manager.convert_to_braille
  #   assert_equal class_manager.file1.length, class_manager.write_to_next_file
  # end

  def test_it_can_convert_values_to_english
    
    class_manager = EnglishWriter.new('test_braille_message.txt', 'test_english_conversion.txt')
    class_manager.create_file1_message
    class_manager.convert_to_english
    assert_equal class_manager.file1_message.count, class_manager.english_message.count
  end

  def test_it_can_write_english_to_file
    
    class_manager = EnglishWriter.new('test_braille_message.txt', 'test_english_conversion.txt')
    class_manager.create_file1_message
    class_manager.convert_to_english
    class_manager.write_english
    refute_equal nil, File.readlines(class_manager.file2)
  end
end

