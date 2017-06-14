class MaxIntSet
  def initialize(max)
    @store = Array.new(max)
  end

  def insert(num)
    raise 'Out of bounds' if num < 0 || num >= @store.length
    # return false if @store[num]
    @store[num] = true

  end

  def remove(num)
    raise 'Out of bounds' if num < 0 || num >= @store.length
    return nil unless include?(num)
    @store[num] = false
    # num
  end

  def include?(num)
    raise 'Out of bounds' if num < 0 || num >= @store.length
    @store[num]
  end

  private

  def is_valid?(num)

  end

  def validate!(num)

  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num].push(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    return true if self[num].include?(num)
    false
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    self[num] << num
    @count += 1
    resize! if @count > num_buckets
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    cur_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2){[]}
    cur_store.each do |bucket|
      bucket.each do |num|
        insert(num)
      end
    end

  end
end
