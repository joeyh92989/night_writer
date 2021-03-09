require './test/test_helper'
require './lib/braille_dictionary'

class BrailleDictionaryTest < MiniTest::Test


  def test_it_exists
    bd = BrailleDictionary.new
    assert_instance_of BrailleDictionary, bd
  end
  
  def test_it_has_attributes
    bd = BrailleDictionary.new
    assert_equal 27, bd.alphabet_hash.count
  end
end