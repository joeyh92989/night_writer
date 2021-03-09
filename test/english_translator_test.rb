require './test/test_helper'
require './lib/english_translator'
require './lib/english_dictionary'

class EnglishTranslatorTest < MiniTest::Test

  def test_it_exists
    ew = EnglishWriter.new('test_braille_message.txt', 'test_english_conversion.txt')
    et = EnglishTranslator.new(ew.file1_message)

    assert_instance_of EnglishTranslator, et
  end
  def test_it_has_attributes
    ew = EnglishWriter.new("test_braille_message.txt", "test_english_conversion.txt")
    et = EnglishTranslator.new(ew.file1_message)
    ed = EnglishDictionary.new

    refute_equal nil, et.file1_message
    assert_equal 40, et.file1_message[0].count
    refute_equal nil, et.english_dictionary
    assert_equal [], et.english_message
  end

  def test_it_can_convert_to_english
    ew = EnglishWriter.new("test_braille_message.txt", "test_english_conversion.txt")
    et = EnglishTranslator.new(ew.file1_message)
    ed = EnglishDictionary.new
    et.convert_to_english

    assert_equal 40 , et.english_message[0].count
  end
end