require './test/test_helper'
require './lib/braille_writer'
require './lib/braille_dictionary'
require './lib/braille_translator'

class BrailleTranslatorTest < MiniTest::Test

  def test_it_exists
    bw = BrailleWriter.new("test_message.txt", "test_braille.txt")
    bt = BrailleTranslator.new(bw.file1_message)
    assert_instance_of BrailleTranslator, bt
  end
  def test_it_has_attributes
    bw = BrailleWriter.new("test_message.txt", "test_braille.txt")
    bt = BrailleTranslator.new(bw.file1_message)
    bd = BrailleDictionary.new
    refute_equal nil, bt.file1_message
    assert_equal 40, bt.file1_message[0].count
    refute_equal nil, bt.braille_dictionary
  end

  def test_it_can_convert_to_braille
    bw = BrailleWriter.new("test_message.txt", "test_braille.txt")
    bt = BrailleTranslator.new(bw.file1_message)
    bt.convert_to_braille
    assert_equal 40 , bt.braille_message[0].count
  end
end
