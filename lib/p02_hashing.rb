class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 0.hash if empty?
    res = []
    each {|num| res.push(num.hash)}
    res.reduce(:-)
  end
end

class String
  def hash
    split('').map { |letter| letter.ord}.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort!.hash
  end
end
