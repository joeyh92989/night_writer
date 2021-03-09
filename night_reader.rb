require './lib/english_writer'

file1 = ARGV[0]
file2 = ARGV[1]
ew = EnglishWriter.new(file1, file2)
ew.create_file1_message
ew.write_english
ew.print_message