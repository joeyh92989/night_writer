require './test/test_helper'
require './lib/braille_writer'
require './lib/braille_dictionary'

class BrailleWriterTest < MiniTest::Test

  def test_it_exists
    bw = BrailleWriter.new('message.txt', 'test_braille.txt')
   
    assert_instance_of BrailleWriter, bw
  end

  def test_it_has_attributes
    bw = BrailleWriter.new("test_message.txt", "test_braille.txt")
   
    assert_equal 'test_message.txt', bw.file1
    assert_equal 'test_braille.txt', bw.file2
  end
  def test_it_can_store_file_message
    bw = BrailleWriter.new('test_message.txt', 'test_braille.txt')
    
    assert_equal [], bw.file1_message
  end

  def test_it_can_add_file1_message
    bw = BrailleWriter.new("test_message.txt", "test_braille.txt")
    bw.create_file1_message
    
    refute_equal nil, bw.file1_message.count
  end

  def test_it_can_break_down_braille_message
    bw = BrailleWriter.new("test_message.txt", "test_braille.txt")
    File.open(bw.file2, 'w') {|file| file.truncate(0)}
    bw.create_file1_message
    bw.break_down_braille_message
    
    assert_equal 3, File.readlines(bw.file2).length
  end

  def test_it_can_write_braille_to_file

    bw = BrailleWriter.new('test_message.txt', 'test_braille.txt')
    bw.create_file1_message
    bw.write_braille_loop
    assert_equal 9 , File.readlines(bw.file2).length
  end
end

