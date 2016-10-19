# Enter your code here. Read input from STDIN. Print output to STDOUT
require 'set'
ALPHABET = Set.new((('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a + " ();:,.'?-!".split('')).map(&:ord))

def find_key(message, key_length)
  key = ""
  key_length.times { |place| key << find_partial_key(message, key_length, place) }
  key
end

def find_partial_key(message, key_length, place)
  ('a'..'z').find do |letter|
    (0...message.length).all? do |i|
      i % key_length != place || ALPHABET.include?(letter.ord ^ message[i].ord)
    end
  end
end

message_length = gets.chomp.to_i
message = gets.chomp.split(' ').map(&:to_i)
puts find_key(message, 3)
