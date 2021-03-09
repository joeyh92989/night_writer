require './test/test_helper'
require './lib/english_dictionary'

class EnglishDictionaryTest < MiniTest::Test


  def test_it_exists
    ed = EnglishDictionary.new
    assert_instance_of EnglishDictionary, ed
  end
  
  def test_it_has_attributes
    ed = EnglishDictionary.new
    assert_equal 26, ed.alphabet_hash.count
  end
end