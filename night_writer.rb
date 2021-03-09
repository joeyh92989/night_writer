require './lib/braille_writer'

file1 = ARGV[0]
file2 = ARGV[1]
bw = BrailleWriter.new(file1, file2)
bw.create_file1_message
bw.write_braille_loop
bw.print_message