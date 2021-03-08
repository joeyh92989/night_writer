require './lib/english_writer'

file1 = ARGV[0]
file2 = ARGV[1]
class_manager = EnglishWriter.new(file1, file2)
class_manager.create_file1_message
class_manager.convert_to_braille
class_manager.write_braille
class_manager.print_message