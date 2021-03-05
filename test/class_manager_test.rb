require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/class_manager'

class ClassManagerTest < MiniTest::Test

  def test_it_exists
    class_manager = ClassManager.new('messages.txt', 'braille.txt')
    assert_instance_of ClassManager, class_manager
  end

  def test_it_has_attributes
    class_manager = ClassManager.new('messages.txt', 'braille.txt')

    assert_equal 'messages.txt', class_manager.file1
    assert_equal 'braille.txt', class_manager.file2

  end
  
end