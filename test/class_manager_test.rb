require 'minitest/autorun'
require 'minitest/nyan_cat'
require './lib/class_manager'

class ClassManagerTest < MiniTest::Test

  def test_it_exists
    class_manager = ClassManager.new
    assert_instance_of ClassManager, class_manager
  end
end