require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  map = HashMap.new()
  letters = string.chars

  letters.each do |char|
    map.include?(char) ? map[char] += 1 : map[char] = 1
  end

  nums = []
  map.each { |link, val| nums << val }
  expected_result = [1]
  (string.length/2).times { expected_result.push(2) }
  expected_result == nums.sort
end
