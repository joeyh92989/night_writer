require './test/test_helper'
require './lib/english_writer'
require './lib/english_dictionary'

class EnglishWriterTest < MiniTest::Test

  def test_it_exists
    ew = EnglishWriter.new('test_braille_message.txt', 'test_english_conversion.txt')
    
    assert_instance_of EnglishWriter, ew
  end

  def test_it_has_attributes
    ew = EnglishWriter.new("test_braille_message.txt", "test_english_conversion.txt")
    
    assert_equal 'test_braille_message.txt', ew.file1
    assert_equal 'test_english_conversion.txt', ew.file2
  end


  def test_it_can_add_file1_message
    ew = EnglishWriter.new("test_braille_message.txt", "test_english_conversion.txt")
    ew.create_file1_message
    
    assert_equal 3, ew.file1_message.count
  end

  def test_it_can_write_english_to_file
    ew = EnglishWriter.new("test_braille_message.txt", "test_english_conversion.txt")
    ew.create_file1_message
    ew.write_english

    assert_equal 1 , File.readlines(ew.file2).length
  end

  def test_it_can_create_string_pairs
    test_array = [['abcd'],['abcd'],['abcd']]
    ew = EnglishWriter.new("test_braille_message.txt", "test_english_conversion.txt")

    test = ew.create_string_pairs(test_array)
    assert_equal [[['ab','cd']],[['ab','cd']],[['ab','cd']]], test
  end
end

