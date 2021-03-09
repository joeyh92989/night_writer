require './lib/braille_dictionary'
class BrailleTranslator
  attr_reader :file1_message,
              :braille_dictionary,
              :braille_message

  def initialize(file1_message)
    @file1_message = file1_message
    @braille_dictionary = BrailleDictionary.new
    @braille_message = []
    convert_to_braille
  end

  def convert_to_braille
    text_array = @file1_message.map do |letters|
      letters.map do |letter|
        @braille_dictionary.alphabet_hash[letter]
      end
    end
    text_array.each do |character|
      @braille_message << character
    end
  end
end
