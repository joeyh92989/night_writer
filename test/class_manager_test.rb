require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/class_manager'
require './lib/braille_dictionary'

class ClassManagerTest < MiniTest::Test

  def test_it_exists
    class_manager = ClassManager.new('message.txt', 'test_braille.txt')
    assert_instance_of ClassManager, class_manager
  end

  def test_it_has_attributes
    class_manager = ClassManager.new("test_message.txt", "test_braille.txt")
    assert_equal 'test_message.txt', class_manager.file1
    assert_equal 'test_braille.txt', class_manager.file2
  end
  def test_it_can_store_file_message
    class_manager = ClassManager.new('test_message.txt', 'test_braille.txt')
    assert_equal [], class_manager.file1_message
  end

  def test_it_can_add_file1_message
    class_manager = ClassManager.new("test_message.txt", "test_braille.txt")
    class_manager.create_file1_message
    expected = ['h','e','l','l','o', ' ', 'w','o','r','l','d']
    assert_equal expected, class_manager.file1_message
  end

  # def test_it_can_write_data_to_a_file
  #   class_manager = ClassManager.new('test_message.txt', 'test_braille.txt')
  #   class_manager.create_file1_message
  #   class_manager.convert_to_braille
  #   assert_equal class_manager.file1.length, class_manager.write_to_next_file
  # end

  def test_it_can_convert_values_to_braille
    class_manager = ClassManager.new('test_message.txt', 'test_braille.txt')
    class_manager.create_file1_message
    class_manager.convert_to_braille
    assert_equal class_manager.file1_message.count, class_manager.braille_message.count
  end

  def test_it_can_write_braille_to_file
    class_manager = ClassManager.new('test_message.txt', 'test_braille.txt')
    class_manager.create_file1_message
    class_manager.convert_to_braille
    class_manager.write_braille
    refute_equal nil, File.readlines(class_manager.file2)
  end
end
