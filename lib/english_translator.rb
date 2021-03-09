require './lib/english_dictionary'

class EnglishTranslator
  attr_reader :file1_message,
              :english_dictionary,
              :english_message

  def initialize(file1_message)
    @file1_message = file1_message
    @english_dictionary = EnglishDictionary.new
    @english_message = []
  end
  
  def convert_to_english
    text_array = @file1_message.map do |letters|
      letters.map do |letter|
        @english_dictionary.alphabet_hash[letter]
      end
    end
    text_array.each do |array|
      @english_message.push(array)
    end
  end
end